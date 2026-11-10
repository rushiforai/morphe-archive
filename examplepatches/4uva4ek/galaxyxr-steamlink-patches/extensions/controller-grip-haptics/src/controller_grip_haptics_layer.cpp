#include <openxr/openxr.h>
#include <openxr/openxr_loader_negotiation.h>

#include <android/binder_ibinder.h>
#include <android/binder_ibinder_jni.h>
#include <android/binder_parcel.h>
#include <android/binder_status.h>
#include <android/log.h>
#include <jni.h>
#include <sys/system_properties.h>
#include <time.h>

#include <atomic>
#include <cmath>
#include <condition_variable>
#include <cstdlib>
#include <cstring>
#include <mutex>
#include <string>
#include <thread>
#include <vector>

#define GXR_LOG(...) __android_log_print(ANDROID_LOG_INFO, "GxrHapticMain", __VA_ARGS__)

namespace {

constexpr char LAYER_NAME[] = "XR_APILAYER_local_GalaxyXR_haptic_main";

// The Galaxy XR controller service sends every OpenXR vibration to the trigger (SUB) vibrator.
// The grip (MAIN) vibrator is reachable only through the controller HAL, which an application
// cannot call. gxr.haptic.HapticService relays to it from a Shizuku user service; without that
// service every call goes to the runtime unchanged.
constexpr char SERVICE_DESCRIPTOR[] = "gxr.haptic.IHapticService";
constexpr transaction_code_t SERVICE_VIBRATE = 1;
constexpr transaction_code_t SERVICE_STOP = 2;
constexpr transaction_code_t SERVICE_PLAY = 3;
constexpr int32_t VIBRATOR_MAIN = 1;
// The HAL's device 2 is both controllers: one upload that both of them play.
constexpr int32_t DEVICE_BOTH = 2;
// The stock controller service does not send pulses shorter than 30 ms; the layer goes down to 10.
constexpr int32_t MIN_DURATION_MS = 10;
constexpr float MIN_AMPLITUDE = 0.1f;
constexpr float HZ_PER_FREQUENCY_STEP = 50.0f;
constexpr float MIN_FREQUENCY = 1.0f;
constexpr float MAX_FREQUENCY = 10.0f;
// The grip vibrator is much weaker than the trigger one at the same amplitude and gets shrill above
// step 2. The stock service stops at 0.8, but the HAL sends amplitude * 100 in a 7-bit field, so
// 1.27 is the largest value that does not wrap; 0.8, 1.0 and 1.27 each feel stronger than the one
// before. An OpenXR amplitude a maps to low + (high - low) * a^gamma: weak requests are lifted
// into the range the vibrator is felt in and strong ones still differ from each other.
constexpr float DEFAULT_LOW_AMPLITUDE = 0.2f;
constexpr float DEFAULT_HIGH_AMPLITUDE = 0.8f;
constexpr float DEFAULT_GAMMA = 0.5f;
constexpr float AMPLITUDE_LIMIT = 1.27f;
// By default the frequency step follows the request. A frequency SteamVR really set picks the
// step: low below MID_HZ, high from HIGH_HZ. Dashboard ticks carry 0, 1 or 20 Hz, which says
// nothing, so below MEANINGFUL_HZ the step follows the amplitude sent to the vibrator instead:
// light effects are higher pitched, strong ones lower. Step 3 already feels shrill, so nothing goes
// above it.
constexpr float FREQUENCY_BY_REQUEST = -1.0f;
constexpr float MEANINGFUL_HZ = 30.0f;
constexpr float DEFAULT_MID_HZ = 120.0f;
constexpr float DEFAULT_HIGH_HZ = 220.0f;
constexpr float LIGHT_AMPLITUDE = 0.15f;
constexpr float STRONG_AMPLITUDE = 0.65f;
constexpr float LIGHT_FREQUENCY = 3.0f;
constexpr float MEDIUM_FREQUENCY = 2.0f;
constexpr float STRONG_FREQUENCY = 1.0f;
constexpr int32_t DEFAULT_MIN_DURATION_MS = 10;
// Requests closer together than this are one continuous vibration. It is played as pulses of
// this length, so that the command rate stays low however often the request repeats.
constexpr int64_t STREAM_GAP_NS = 50000000;
constexpr int32_t DEFAULT_STREAM_PULSE_MS = 60;
constexpr int64_t TUNING_REFRESH_NS = 500000000;
constexpr int LOGGED_CALLS = 40;

// Waveform mode. The controller also plays signed 8-bit samples at 8000 Hz, so a vibration can
// carry the frequency SteamVR asked for instead of one of the HAL's coarse steps. A generator
// thread sends the samples in short chunks, each continuing the phase of the one before, and a
// new request only changes what is generated next, as in PSVR2Toolkit. The HAL needs about 14 ms
// per chunk and handles both controllers in one queue: 10 ms chunks were dropped and rattled,
// 20 ms ones play cleanly for one controller, so two controllers that vibrate differently get
// chunks twice as long. Two controllers playing the same tone (crossed sabers in Beat Saber) get
// one chunk sent to both at once instead. The default is 40 ms, the value used in games. Long
// waveforms are not sent: once the controller's buffer (about a second) is full they queue up
// and play late. The HAL stop is not used here: it leaves that buffer as it was and the next
// waveform does not play.
constexpr int32_t DEFAULT_CHUNK_MS = 40;
constexpr float SAMPLE_RATE = 8000.0f;
// The grip vibrator feels right around 100 Hz and shrill from about 150 Hz (HAL steps 2 and 3),
// while games ask for frequencies meant for other controllers (Beat Saber: 200 Hz), so the
// requested frequency is scaled down and capped.
constexpr float MIN_TONE_HZ = 40.0f;
constexpr float DEFAULT_MAX_TONE_HZ = 130.0f;
constexpr float DEFAULT_TONE_SCALE = 0.5f;
constexpr float STRONG_TONE_HZ = 60.0f;
constexpr float MEDIUM_TONE_HZ = 100.0f;
constexpr float LIGHT_TONE_HZ = 130.0f;
constexpr float FULL_SCALE = 100.0f;
// SteamVR dashboard and menu ticks arrive as 1 or 20 Hz for about 20 ms. By default they play as
// a short tone like any other request (CLICK_TONE), and ticks in quick succession run together
// into one tone. They can also play as a click, as PSVR2Toolkit's generator does at low
// frequencies: the vibrator is pushed one way for the request's duration (CLICK_PUSH), or one way
// and then the other (CLICK_CYCLE), with alternating polarity and mixed into a playing tone. On
// the grip vibrator a run of such pushes rattles.
enum ClickShape { CLICK_TONE = 0, CLICK_PUSH = 1, CLICK_CYCLE = 2 };
constexpr float MAX_SAMPLE = 127.0f;

enum Mode { MODE_OFF = 0, MODE_MAIN = 1, MODE_BOTH = 2 };

PFN_xrGetInstanceProcAddr NEXT_GET_INSTANCE_PROC_ADDR = nullptr;
PFN_xrApplyHapticFeedback NEXT_APPLY_HAPTIC_FEEDBACK = nullptr;
PFN_xrStopHapticFeedback NEXT_STOP_HAPTIC_FEEDBACK = nullptr;
XrPath LEFT_HAND = XR_NULL_PATH;
XrPath RIGHT_HAND = XR_NULL_PATH;
std::atomic<int> MODE{MODE_MAIN};
std::atomic<float> LOW_AMPLITUDE{DEFAULT_LOW_AMPLITUDE};
std::atomic<float> HIGH_AMPLITUDE{DEFAULT_HIGH_AMPLITUDE};
std::atomic<float> GAMMA{DEFAULT_GAMMA};
std::atomic<float> FREQUENCY{FREQUENCY_BY_REQUEST};
std::atomic<float> MID_HZ{DEFAULT_MID_HZ};
std::atomic<float> HIGH_HZ{DEFAULT_HIGH_HZ};
std::atomic<int32_t> MIN_DURATION{DEFAULT_MIN_DURATION_MS};
std::atomic<int32_t> STREAM_PULSE{DEFAULT_STREAM_PULSE_MS};
std::atomic<int64_t> TUNING_READ_AT{0};
// Per controller: when its current HAL pulse ends, and whether a stop was already sent.
std::atomic<int64_t> BUSY_UNTIL[2]{};
std::atomic<bool> STOPPED[2]{};
std::atomic<int64_t> LAST_REQUEST[2]{};
std::atomic<AIBinder*> SERVICE{nullptr};
std::atomic<int> LOGGED{0};
std::atomic<bool> WAVEFORM{true};
std::atomic<float> TONE_HZ{0.0f};
std::atomic<float> TONE_SCALE{DEFAULT_TONE_SCALE};
std::atomic<float> MAX_TONE_HZ{DEFAULT_MAX_TONE_HZ};
std::atomic<float> DRIVE{1.0f};
std::atomic<int> CLICK{CLICK_TONE};
std::atomic<int32_t> CHUNK_MS{DEFAULT_CHUNK_MS};
std::atomic<bool> SHARED{true};

// What the generator plays for one controller. Peaks are in samples, lengths in samples left.
struct Voice {
    float hz = 0.0f;
    float peak = 0.0f;
    double phase = 0.0;
    uint32_t toneLeft = 0;
    float clickPeak = 0.0f;
    uint32_t clickLeft = 0;
    uint32_t clickLength = 0;
    int clickShape = CLICK_PUSH;
    bool clickInverted = false;
};
std::mutex VOICE_LOCK;
std::condition_variable VOICE_WAKE;
Voice VOICES[2];
bool GENERATOR_STARTED = false;

// What SteamVR asked for over the last STATS_PERIOD_NS, written to the log to tune the mapping.
constexpr int64_t STATS_PERIOD_NS = 5000000000LL;
constexpr int STATS_FREQUENCIES = 12;
struct Stats {
    std::mutex lock;
    int64_t since = 0;
    int requests = 0;
    int sent = 0;
    float minAmplitude = 0.0f;
    float maxAmplitude = 0.0f;
    float minDurationMs = 0.0f;
    float maxDurationMs = 0.0f;
    int hz[STATS_FREQUENCIES]{};
    int count[STATS_FREQUENCIES]{};
    int otherFrequencies = 0;
} STATS;

float clamp(float value, float low, float high) {
    return value < low ? low : value > high ? high : value;
}

float readProperty(const char* name, float fallback) {
    char value[PROP_VALUE_MAX]{};
    if (__system_property_get(name, value) <= 0) return fallback;
    return static_cast<float>(std::atof(value));
}

// Tuning from adb, picked up while the stream runs:
//   debug.gxr.haptic        0|1|2  OpenXR only, grip, grip + trigger
//   debug.gxr.haptic.min    amplitude sent for the weakest request
//   debug.gxr.haptic.max    amplitude sent for the strongest request (0.8), up to 1.27
//   debug.gxr.haptic.gamma  curve between them; below 1 lifts weak requests, 1 is linear
//   debug.gxr.haptic.freq   1..10 fixed HAL frequency step, 0 = derive from the OpenXR frequency,
//                           -1 = by the request: its frequency when SteamVR set one, else its
//                           sent amplitude (3 below 0.15, 2 below 0.65, else 1)
//   debug.gxr.haptic.midhz  request frequency from which step 2 is used (120)
//   debug.gxr.haptic.highhz request frequency from which step 3 is used (220)
//   debug.gxr.haptic.minms  shortest pulse in milliseconds, at least 10
//   debug.gxr.haptic.pcm    1 = play generated waveforms (default), 0 = HAL pulses
//   debug.gxr.haptic.hz     waveform mode: fixed tone in Hz, 0 = from the request
//   debug.gxr.haptic.hzscale  waveform mode: multiplier for the requested frequency (0.5)
//   debug.gxr.haptic.maxhz  waveform mode: highest tone played (130)
//   debug.gxr.haptic.drive  waveform mode: 1 = sine, above 1 clips it towards a square wave
//   debug.gxr.haptic.click  waveform mode, requests without a real frequency: 0 = a tone like any
//                           other request (default), 1 = one push, 2 = push and pull
//   debug.gxr.haptic.chunkms  waveform mode: chunk length in milliseconds for one controller (40)
//   debug.gxr.haptic.shared  waveform mode: 1 = one chunk for both controllers when they play the
//                           same tone (default), 0 = always a chunk per controller
//   debug.gxr.haptic.streamms  pulse length for a vibration that keeps repeating
int64_t monotonicNs() {
    timespec now{};
    clock_gettime(CLOCK_MONOTONIC, &now);
    return now.tv_sec * 1000000000LL + now.tv_nsec;
}

void refreshTuning() {
    const int64_t nowNs = monotonicNs();
    const int64_t readAt = TUNING_READ_AT.load();
    if (readAt != 0 && nowNs - readAt < TUNING_REFRESH_NS) return;
    TUNING_READ_AT.store(nowNs);
    MODE.store(static_cast<int>(readProperty("debug.gxr.haptic", MODE_MAIN)));
    LOW_AMPLITUDE.store(
        clamp(readProperty("debug.gxr.haptic.min", DEFAULT_LOW_AMPLITUDE), MIN_AMPLITUDE, AMPLITUDE_LIMIT));
    HIGH_AMPLITUDE.store(
        clamp(readProperty("debug.gxr.haptic.max", DEFAULT_HIGH_AMPLITUDE), MIN_AMPLITUDE, AMPLITUDE_LIMIT));
    GAMMA.store(clamp(readProperty("debug.gxr.haptic.gamma", DEFAULT_GAMMA), 0.1f, 4.0f));
    FREQUENCY.store(readProperty("debug.gxr.haptic.freq", FREQUENCY_BY_REQUEST));
    MID_HZ.store(readProperty("debug.gxr.haptic.midhz", DEFAULT_MID_HZ));
    HIGH_HZ.store(readProperty("debug.gxr.haptic.highhz", DEFAULT_HIGH_HZ));
    MIN_DURATION.store(static_cast<int32_t>(readProperty("debug.gxr.haptic.minms", DEFAULT_MIN_DURATION_MS)));
    WAVEFORM.store(readProperty("debug.gxr.haptic.pcm", 1.0f) != 0.0f);
    TONE_HZ.store(readProperty("debug.gxr.haptic.hz", 0.0f));
    TONE_SCALE.store(readProperty("debug.gxr.haptic.hzscale", DEFAULT_TONE_SCALE));
    MAX_TONE_HZ.store(clamp(readProperty("debug.gxr.haptic.maxhz", DEFAULT_MAX_TONE_HZ), MIN_TONE_HZ, 1000.0f));
    DRIVE.store(clamp(readProperty("debug.gxr.haptic.drive", 1.0f), 1.0f, 50.0f));
    CLICK.store(static_cast<int>(readProperty("debug.gxr.haptic.click", CLICK_TONE)));
    CHUNK_MS.store(
        static_cast<int32_t>(clamp(readProperty("debug.gxr.haptic.chunkms", DEFAULT_CHUNK_MS), 10.0f, 200.0f)));
    SHARED.store(readProperty("debug.gxr.haptic.shared", 1.0f) != 0.0f);
    STREAM_PULSE.store(
        static_cast<int32_t>(readProperty("debug.gxr.haptic.streamms", DEFAULT_STREAM_PULSE_MS)));
}

void* serviceCreate(void*) { return nullptr; }
void serviceDestroy(void*) {}
binder_status_t serviceTransact(AIBinder*, transaction_code_t, const AParcel*, AParcel*) {
    return STATUS_UNKNOWN_TRANSACTION;
}

int32_t deviceFor(XrPath subactionPath) {
    if (subactionPath == LEFT_HAND) return 0;
    if (subactionPath == RIGHT_HAND) return 1;
    return -1;
}

binder_status_t sendVibrate(
    AIBinder* service,
    int32_t device,
    int32_t durationMs,
    float frequency,
    float amplitude
) {
    AParcel* in = nullptr;
    binder_status_t status = AIBinder_prepareTransaction(service, &in);
    if (status != STATUS_OK) return status;
    AParcel_writeInt32(in, device);
    AParcel_writeInt32(in, VIBRATOR_MAIN);
    AParcel_writeInt32(in, durationMs);
    AParcel_writeFloat(in, frequency);
    AParcel_writeFloat(in, amplitude);
    AParcel* out = nullptr;
    status = AIBinder_transact(service, SERVICE_VIBRATE, &in, &out, FLAG_ONEWAY);
    if (out) AParcel_delete(out);
    return status;
}

binder_status_t sendSamples(AIBinder* service, int32_t device, const std::vector<int8_t>& samples) {
    AParcel* in = nullptr;
    binder_status_t status = AIBinder_prepareTransaction(service, &in);
    if (status != STATUS_OK) return status;
    AParcel_writeInt32(in, device);
    AParcel_writeInt32(in, VIBRATOR_MAIN);
    AParcel_writeByteArray(in, samples.data(), static_cast<int32_t>(samples.size()));
    AParcel* out = nullptr;
    status = AIBinder_transact(service, SERVICE_PLAY, &in, &out, FLAG_ONEWAY);
    if (out) AParcel_delete(out);
    return status;
}

bool isPlaying(const Voice& voice) {
    return voice.toneLeft != 0 || voice.clickLeft != 0;
}

// Fills one chunk for a controller and advances its voice. Returns false when it is silent.
bool generate(Voice& voice, std::vector<int8_t>& samples) {
    if (!isPlaying(voice)) return false;
    const double step = 2.0 * M_PI * voice.hz / SAMPLE_RATE;
    const float drive = DRIVE.load();
    for (int8_t& sample : samples) {
        float value = 0.0f;
        if (voice.toneLeft != 0) {
            value += clamp(static_cast<float>(std::sin(voice.phase)) * drive, -1.0f, 1.0f) * voice.peak;
            voice.phase += step;
            --voice.toneLeft;
        }
        if (voice.clickLeft != 0) {
            const bool pull = voice.clickShape == CLICK_CYCLE && voice.clickLeft <= voice.clickLength / 2;
            value += pull ? -voice.clickPeak : voice.clickPeak;
            --voice.clickLeft;
        }
        sample = static_cast<int8_t>(clamp(value, -MAX_SAMPLE, MAX_SAMPLE));
    }
    if (voice.toneLeft == 0) voice.phase = 0.0;
    return true;
}

// Both controllers play the same tone and nothing else, so one chunk can serve both.
bool isSameTone(const Voice& left, const Voice& right) {
    return left.toneLeft != 0 && right.toneLeft != 0 && left.clickLeft == 0 && right.clickLeft == 0 &&
        left.hz == right.hz && std::fabs(left.peak - right.peak) < 1.0f;
}

void generatorLoop() {
    std::vector<int8_t> samples[2];
    int64_t next = 0;
    for (;;) {
        bool active[2]{};
        int32_t chunkMs = 0;
        int shared = -1;
        {
            std::unique_lock<std::mutex> lock(VOICE_LOCK);
            VOICE_WAKE.wait(lock, [] { return isPlaying(VOICES[0]) || isPlaying(VOICES[1]); });
            const bool both = isPlaying(VOICES[0]) && isPlaying(VOICES[1]);
            if (both && SHARED.load() && isSameTone(VOICES[0], VOICES[1])) {
                // The chunk of the controller with more left to play is sent to both; the other
                // one ends within this chunk.
                shared = VOICES[0].toneLeft >= VOICES[1].toneLeft ? 0 : 1;
                VOICES[1].phase = VOICES[0].phase;
            }
            chunkMs = CHUNK_MS.load() * (both && shared < 0 ? 2 : 1);
            for (int device = 0; device < 2; ++device) {
                samples[device].assign(static_cast<size_t>(chunkMs * SAMPLE_RATE / 1000.0f), 0);
                active[device] = generate(VOICES[device], samples[device]);
            }
        }
        AIBinder* service = SERVICE.load();
        if (shared >= 0) {
            if (service) sendSamples(service, DEVICE_BOTH, samples[shared]);
        } else {
            for (int device = 0; device < 2; ++device) {
                if (active[device] && service) sendSamples(service, device, samples[device]);
            }
        }
        // Chunks follow each other exactly one chunk apart; after a silence the clock restarts.
        const int64_t nowNs = monotonicNs();
        if (next < nowNs - chunkMs * 1000000LL) next = nowNs;
        next += chunkMs * 1000000LL;
        const int64_t wait = next - monotonicNs();
        if (wait > 0) {
            timespec delay{static_cast<time_t>(wait / 1000000000LL), static_cast<long>(wait % 1000000000LL)};
            nanosleep(&delay, nullptr);
        }
    }
}

// amplitude is in the HAL's units, where 1.0 is 100 of the 127 a sample can hold. hz 0 = a click.
void playWaveform(int32_t device, int32_t durationMs, float hz, float amplitude, int click) {
    const uint32_t length = static_cast<uint32_t>(durationMs * SAMPLE_RATE / 1000.0f);
    const float peak = clamp(amplitude * FULL_SCALE, 0.0f, MAX_SAMPLE);
    std::lock_guard<std::mutex> lock(VOICE_LOCK);
    Voice& voice = VOICES[device];
    if (hz > 0.0f) {
        voice.hz = hz;
        voice.peak = peak;
        voice.toneLeft = length;
    } else {
        voice.clickInverted = !voice.clickInverted;
        voice.clickPeak = voice.clickInverted ? -peak : peak;
        voice.clickLeft = length;
        voice.clickLength = length;
        voice.clickShape = click;
    }
    if (!GENERATOR_STARTED) {
        GENERATOR_STARTED = true;
        std::thread(generatorLoop).detach();
    }
    VOICE_WAKE.notify_one();
}

void silenceWaveform(int32_t device) {
    std::lock_guard<std::mutex> lock(VOICE_LOCK);
    VOICES[device].toneLeft = 0;
    VOICES[device].clickLeft = 0;
}

binder_status_t sendStop(AIBinder* service, int32_t device) {
    AParcel* in = nullptr;
    binder_status_t status = AIBinder_prepareTransaction(service, &in);
    if (status != STATUS_OK) return status;
    AParcel_writeInt32(in, device);
    AParcel* out = nullptr;
    status = AIBinder_transact(service, SERVICE_STOP, &in, &out, FLAG_ONEWAY);
    if (out) AParcel_delete(out);
    return status;
}

void recordRequest(const XrHapticVibration& vibration, bool sent) {
    const int64_t nowNs = monotonicNs();
    const float durationMs = vibration.duration * 1e-6f;
    std::lock_guard<std::mutex> guard(STATS.lock);
    if (STATS.requests == 0) {
        STATS.since = nowNs;
        STATS.minAmplitude = STATS.maxAmplitude = vibration.amplitude;
        STATS.minDurationMs = STATS.maxDurationMs = durationMs;
    }
    ++STATS.requests;
    if (sent) ++STATS.sent;
    if (vibration.amplitude < STATS.minAmplitude) STATS.minAmplitude = vibration.amplitude;
    if (vibration.amplitude > STATS.maxAmplitude) STATS.maxAmplitude = vibration.amplitude;
    if (durationMs < STATS.minDurationMs) STATS.minDurationMs = durationMs;
    if (durationMs > STATS.maxDurationMs) STATS.maxDurationMs = durationMs;
    const int hz = static_cast<int>(std::lround(vibration.frequency));
    int slot = 0;
    while (slot < STATS_FREQUENCIES && STATS.count[slot] != 0 && STATS.hz[slot] != hz) ++slot;
    if (slot == STATS_FREQUENCIES) {
        ++STATS.otherFrequencies;
    } else {
        STATS.hz[slot] = hz;
        ++STATS.count[slot];
    }
    if (nowNs - STATS.since < STATS_PERIOD_NS) return;

    std::string frequencies;
    for (int i = 0; i < STATS_FREQUENCIES && STATS.count[i] != 0; ++i) {
        frequencies += " " + std::to_string(STATS.hz[i]) + "Hz x" + std::to_string(STATS.count[i]);
        STATS.count[i] = 0;
    }
    if (STATS.otherFrequencies != 0) frequencies += " other x" + std::to_string(STATS.otherFrequencies);
    GXR_LOG("stats: requests=%d sent=%d amp=%.2f..%.2f dur=%.0f..%.0fms freq:%s", STATS.requests, STATS.sent,
        STATS.minAmplitude, STATS.maxAmplitude, STATS.minDurationMs, STATS.maxDurationMs, frequencies.c_str());
    STATS.requests = 0;
    STATS.sent = 0;
    STATS.otherFrequencies = 0;
}

XrResult XRAPI_CALL layerApplyHapticFeedback(
    XrSession session,
    const XrHapticActionInfo* info,
    const XrHapticBaseHeader* haptic
) {
    refreshTuning();
    const int mode = MODE.load();
    AIBinder* service = SERVICE.load();
    if (!service || mode == MODE_OFF || !info || !haptic || haptic->type != XR_TYPE_HAPTIC_VIBRATION) {
        return NEXT_APPLY_HAPTIC_FEEDBACK(session, info, haptic);
    }
    const auto* vibration = reinterpret_cast<const XrHapticVibration*>(haptic);
    const int32_t device = deviceFor(info->subactionPath);
    int32_t durationMs = static_cast<int32_t>(vibration->duration / 1000000);
    const int32_t minDuration = MIN_DURATION.load() > MIN_DURATION_MS ? MIN_DURATION.load() : MIN_DURATION_MS;
    if (durationMs < minDuration) durationMs = minDuration;
    const float low = LOW_AMPLITUDE.load();
    const float amplitude = clamp(
        low + (HIGH_AMPLITUDE.load() - low) * std::pow(clamp(vibration->amplitude, 0.0f, 1.0f), GAMMA.load()),
        MIN_AMPLITUDE, AMPLITUDE_LIMIT);
    float frequency = FREQUENCY.load();
    if (frequency < 0.0f && vibration->frequency >= MEANINGFUL_HZ) {
        frequency = vibration->frequency < MID_HZ.load() ? STRONG_FREQUENCY
            : vibration->frequency < HIGH_HZ.load() ? MEDIUM_FREQUENCY
            : LIGHT_FREQUENCY;
    } else if (frequency < 0.0f) {
        frequency = amplitude < LIGHT_AMPLITUDE ? LIGHT_FREQUENCY
            : amplitude < STRONG_AMPLITUDE ? MEDIUM_FREQUENCY
            : STRONG_FREQUENCY;
    } else if (frequency == 0.0f) {
        frequency = std::round(vibration->frequency / HZ_PER_FREQUENCY_STEP);
    }
    frequency = clamp(frequency, MIN_FREQUENCY, MAX_FREQUENCY);

    // SteamVR can repeat a vibration every frame. The stock service drops requests while a pulse
    // is playing; without that the controller link floods and the controller loses tracking.
    binder_status_t status = STATUS_BAD_VALUE;
    if (device >= 0) {
        const int64_t nowNs = monotonicNs();
        // A game can send zero-amplitude requests every frame while nothing vibrates (Beat Saber:
        // about 70 per second per hand). They are not a stop: treating them as one cut each pulse
        // short and aborted waveform uploads. Only xrStopHapticFeedback stops the vibrator.
        if (vibration->amplitude <= 0.0f) {
            recordRequest(*vibration, false);
            return mode == MODE_BOTH ? NEXT_APPLY_HAPTIC_FEEDBACK(session, info, haptic) : XR_SUCCESS;
        }
        const bool waveform = WAVEFORM.load();
        const int click = waveform && TONE_HZ.load() <= 0.0f && vibration->frequency < MEANINGFUL_HZ
            ? CLICK.load() : CLICK_TONE;
        const bool continuous =
            click == CLICK_TONE && nowNs - LAST_REQUEST[device].exchange(nowNs) < STREAM_GAP_NS;
        if (continuous && durationMs < STREAM_PULSE.load()) durationMs = STREAM_PULSE.load();
        if (waveform) {
            // Nothing is dropped here: the generator plays whatever was asked for last.
            float hz = 0.0f;
            if (click == CLICK_TONE) {
                hz = TONE_HZ.load();
                if (hz <= 0.0f && vibration->frequency >= MEANINGFUL_HZ) {
                    hz = vibration->frequency * TONE_SCALE.load();
                }
                if (hz <= 0.0f) {
                    hz = amplitude < LIGHT_AMPLITUDE ? LIGHT_TONE_HZ
                        : amplitude < STRONG_AMPLITUDE ? MEDIUM_TONE_HZ
                        : STRONG_TONE_HZ;
                }
                hz = clamp(hz, MIN_TONE_HZ, MAX_TONE_HZ.load());
            }
            frequency = hz;
            playWaveform(device, durationMs, hz, amplitude, click);
            status = STATUS_OK;
        } else {
            if (nowNs < BUSY_UNTIL[device].load()) {
                recordRequest(*vibration, false);
                return mode == MODE_BOTH ? NEXT_APPLY_HAPTIC_FEEDBACK(session, info, haptic) : XR_SUCCESS;
            }
            BUSY_UNTIL[device].store(nowNs + durationMs * 1000000LL);
            STOPPED[device].store(false);
            status = sendVibrate(service, device, durationMs, frequency, amplitude);
        }
    }
    recordRequest(*vibration, status == STATUS_OK && vibration->amplitude > 0.0f);
    if (LOGGED.fetch_add(1) < LOGGED_CALLS) {
        GXR_LOG("vibration dur=%.1fms freq=%.0f amp=%.2f -> main device=%d dur=%dms freq=%.0f amp=%.2f status=%d",
            vibration->duration * 1e-6, vibration->frequency, vibration->amplitude, device, durationMs,
            frequency, amplitude, status);
    }
    if (mode == MODE_BOTH || status != STATUS_OK) return NEXT_APPLY_HAPTIC_FEEDBACK(session, info, haptic);
    return XR_SUCCESS;
}

XrResult XRAPI_CALL layerStopHapticFeedback(XrSession session, const XrHapticActionInfo* info) {
    AIBinder* service = SERVICE.load();
    if (service && MODE.load() != MODE_OFF && info) {
        const int32_t device = deviceFor(info->subactionPath);
        if (device >= 0) {
            if (WAVEFORM.load()) {
                silenceWaveform(device);
            } else {
                if (!STOPPED[device].exchange(true)) sendStop(service, device);
                BUSY_UNTIL[device].store(0);
            }
        }
    }
    return NEXT_STOP_HAPTIC_FEEDBACK(session, info);
}

XrResult XRAPI_PTR layerGetInstanceProcAddr(
    XrInstance instance,
    const char* name,
    PFN_xrVoidFunction* function
) {
    if (!name || !function) return XR_ERROR_VALIDATION_FAILURE;
    if (std::strcmp(name, "xrGetInstanceProcAddr") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerGetInstanceProcAddr);
        return XR_SUCCESS;
    }
    if (!NEXT_GET_INSTANCE_PROC_ADDR) {
        *function = nullptr;
        return XR_ERROR_FUNCTION_UNSUPPORTED;
    }
    if (NEXT_APPLY_HAPTIC_FEEDBACK && std::strcmp(name, "xrApplyHapticFeedback") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerApplyHapticFeedback);
        return XR_SUCCESS;
    }
    if (NEXT_STOP_HAPTIC_FEEDBACK && std::strcmp(name, "xrStopHapticFeedback") == 0) {
        *function = reinterpret_cast<PFN_xrVoidFunction>(layerStopHapticFeedback);
        return XR_SUCCESS;
    }
    return NEXT_GET_INSTANCE_PROC_ADDR(instance, name, function);
}

XrResult XRAPI_PTR layerCreateApiLayerInstance(
    const XrInstanceCreateInfo* instanceCreateInfo,
    const XrApiLayerCreateInfo* apiLayerInfo,
    XrInstance* instance
) {
    if (!apiLayerInfo || !apiLayerInfo->nextInfo) return XR_ERROR_INITIALIZATION_FAILED;
    XrApiLayerCreateInfo nextInfo = *apiLayerInfo;
    nextInfo.nextInfo = apiLayerInfo->nextInfo->next;
    const XrResult result = apiLayerInfo->nextInfo->nextCreateApiLayerInstance(
        instanceCreateInfo,
        &nextInfo,
        instance
    );
    if (XR_FAILED(result)) return result;

    NEXT_GET_INSTANCE_PROC_ADDR = apiLayerInfo->nextInfo->nextGetInstanceProcAddr;
    NEXT_GET_INSTANCE_PROC_ADDR(*instance, "xrApplyHapticFeedback",
        reinterpret_cast<PFN_xrVoidFunction*>(&NEXT_APPLY_HAPTIC_FEEDBACK));
    NEXT_GET_INSTANCE_PROC_ADDR(*instance, "xrStopHapticFeedback",
        reinterpret_cast<PFN_xrVoidFunction*>(&NEXT_STOP_HAPTIC_FEEDBACK));
    PFN_xrStringToPath stringToPath = nullptr;
    NEXT_GET_INSTANCE_PROC_ADDR(*instance, "xrStringToPath",
        reinterpret_cast<PFN_xrVoidFunction*>(&stringToPath));
    if (stringToPath) {
        stringToPath(*instance, "/user/hand/left", &LEFT_HAND);
        stringToPath(*instance, "/user/hand/right", &RIGHT_HAND);
    }
    refreshTuning();
    GXR_LOG("mode=%d amplitude=%.2f..%.2f gamma=%.2f service=%d", MODE.load(), LOW_AMPLITUDE.load(),
        HIGH_AMPLITUDE.load(), GAMMA.load(), SERVICE.load() != nullptr);
    return XR_SUCCESS;
}

}  // namespace

extern "C" JNIEXPORT void JNICALL Java_gxr_haptic_HapticBridge_nativeSetBinder(
    JNIEnv* env,
    jclass,
    jobject binder
) {
    AIBinder* service = nullptr;
    if (binder) {
        service = AIBinder_fromJavaBinder(env, binder);
        const AIBinder_Class* clazz =
            AIBinder_Class_define(SERVICE_DESCRIPTOR, serviceCreate, serviceDestroy, serviceTransact);
        if (service && !AIBinder_associateClass(service, clazz)) {
            GXR_LOG("user service has an unexpected interface");
            AIBinder_decStrong(service);
            service = nullptr;
        }
    }
    AIBinder* previous = SERVICE.exchange(service);
    if (previous) AIBinder_decStrong(previous);
    GXR_LOG("grip vibrator %s", service ? "available" : "not available");
}

extern "C" __attribute__((visibility("default"))) XrResult XRAPI_CALL xrNegotiateLoaderApiLayerInterface(
    const XrNegotiateLoaderInfo* loaderInfo,
    const char* layerName,
    XrNegotiateApiLayerRequest* request
) {
    if (!loaderInfo || !layerName || !request || std::strcmp(layerName, LAYER_NAME) != 0) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    if (loaderInfo->maxInterfaceVersion < XR_CURRENT_LOADER_API_LAYER_VERSION ||
        loaderInfo->maxApiVersion < XR_CURRENT_API_VERSION) {
        return XR_ERROR_INITIALIZATION_FAILED;
    }
    request->layerInterfaceVersion = XR_CURRENT_LOADER_API_LAYER_VERSION;
    request->layerApiVersion = XR_CURRENT_API_VERSION;
    request->getInstanceProcAddr = layerGetInstanceProcAddr;
    request->createApiLayerInstance = layerCreateApiLayerInstance;
    return XR_SUCCESS;
}
