// Radio converter for the Packs tab's import: PSP ATRAC3plus (.AT3, a RIFF WAVE) -> the MP3 the game streams
// (mono, 44.1 kHz, 96 kbps CBR, no tags). FFmpeg decodes, LAME encodes; see build_codecs.sh.
#include <jni.h>
#include <stdio.h>
#include <string.h>
#include <vector>

extern "C" {
#include <libavcodec/avcodec.h>
}
#include <lame/lame.h>

struct Wave { int channels = 0, rate = 0, block = 0; long data = 0, size = 0; };

static bool parseWave(FILE* f, Wave& w)
{
    uint8_t h[12];
    if (fread(h, 1, 12, f) != 12 || memcmp(h, "RIFF", 4) || memcmp(h + 8, "WAVE", 4)) return false;
    for (uint8_t c[8]; fread(c, 1, 8, f) == 8;) {
        uint32_t len;
        memcpy(&len, c + 4, 4);
        if (!memcmp(c, "fmt ", 4)) {
            uint8_t fmt[16];
            if (len < 16 || fread(fmt, 1, 16, f) != 16) return false;
            w.channels = fmt[2] | fmt[3] << 8;
            w.rate = fmt[4] | fmt[5] << 8 | fmt[6] << 16 | fmt[7] << 24;
            w.block = fmt[12] | fmt[13] << 8;
            fseek(f, (len - 16 + 1) & ~1L, SEEK_CUR);
        } else if (!memcmp(c, "data", 4)) {
            w.data = ftell(f);
            w.size = len;
            return w.channels > 0 && w.rate > 0 && w.block > 0;
        } else fseek(f, (len + 1) & ~1L, SEEK_CUR);
    }
    return false;
}

// Returns null on success, else the error. progress[0] receives the input bytes done, for the progress bar.
static const char* convert(const char* inPath, const char* outPath, JNIEnv* env, jlongArray progress)
{
    FILE* in = fopen(inPath, "rb");
    if (!in) return "cannot open the AT3 file";
    Wave w;
    if (!parseWave(in, w)) { fclose(in); return "not an ATRAC3plus AT3 file"; }
    fseek(in, w.data, SEEK_SET);

    const AVCodec* codec = avcodec_find_decoder(AV_CODEC_ID_ATRAC3P);
    AVCodecContext* ctx = codec ? avcodec_alloc_context3(codec) : nullptr;
    if (!ctx) { fclose(in); return "no ATRAC3plus decoder"; }
    av_channel_layout_default(&ctx->ch_layout, w.channels);
    ctx->sample_rate = w.rate;
    ctx->block_align = w.block;
    FILE* out = nullptr;
    lame_t lame = lame_init();
    AVPacket* pkt = av_packet_alloc();
    AVFrame* frame = av_frame_alloc();
    const char* err = nullptr;
    std::vector<float> mono;
    std::vector<uint8_t> mp3(1 << 16);

    lame_set_num_channels(lame, 1);
    lame_set_mode(lame, MONO);
    lame_set_in_samplerate(lame, w.rate);
    lame_set_out_samplerate(lame, 44100);
    lame_set_brate(lame, 96);
    lame_set_VBR(lame, vbr_off);
    lame_set_quality(lame, 7);       // fast; radio talk and music at 96k mono sound the same
    lame_set_bWriteVbrTag(lame, 0);  // the game reads MP3 frames from byte 0: no Xing/LAME frame, no ID3

    if (avcodec_open2(ctx, codec, nullptr) < 0) err = "cannot open the decoder";
    else if (lame_init_params(lame) < 0) err = "cannot set up the MP3 encoder";
    else if (!(out = fopen(outPath, "wb"))) err = "cannot write the MP3 file";
    else if (av_new_packet(pkt, w.block) < 0) err = "out of memory";
    long done = 0;
    while (!err && done + w.block <= w.size && fread(pkt->data, 1, w.block, in) == (size_t)w.block) {
        done += w.block;
        if (avcodec_send_packet(ctx, pkt) < 0) continue;  // a damaged frame: skip it
        while (avcodec_receive_frame(ctx, frame) == 0) {
            int n = frame->nb_samples, ch = frame->ch_layout.nb_channels;
            mono.resize(n);
            for (int i = 0; i < n; i++) {
                float s = 0;
                for (int c = 0; c < ch; c++) s += ((float*)frame->extended_data[c])[i];
                mono[i] = s / ch;
            }
            if ((int)mp3.size() < n * 5 / 4 + 7200) mp3.resize(n * 5 / 4 + 7200);
            int len = lame_encode_buffer_ieee_float(lame, mono.data(), nullptr, n, mp3.data(), (int)mp3.size());
            if (len < 0 || fwrite(mp3.data(), 1, len, out) != (size_t)len) { err = "cannot write the MP3 file"; break; }
        }
        if (env && (done / w.block) % 256 == 0) {
            jlong d = done;
            env->SetLongArrayRegion(progress, 0, 1, &d);
        }
    }
    if (!err) {
        int len = lame_encode_flush(lame, mp3.data(), (int)mp3.size());
        if (len < 0 || fwrite(mp3.data(), 1, len, out) != (size_t)len) err = "cannot write the MP3 file";
    }
    if (out && fclose(out) && !err) err = "cannot write the MP3 file";
    fclose(in);
    av_frame_free(&frame);
    av_packet_free(&pkt);
    avcodec_free_context(&ctx);
    lame_close(lame);
    return err;
}

// ctw.packs.Packs.nativeConvertAt3(String in, String out, long[] progress): null, or the error message.
static jstring JNICALL nConvertAt3(JNIEnv* env, jclass, jstring in, jstring out, jlongArray progress)
{
    const char* i = env->GetStringUTFChars(in, nullptr);
    const char* o = env->GetStringUTFChars(out, nullptr);
    const char* err = convert(i, o, env, progress);
    env->ReleaseStringUTFChars(in, i);
    env->ReleaseStringUTFChars(out, o);
    return err ? env->NewStringUTF(err) : nullptr;
}

bool registerRadioConverter(JNIEnv* env)
{
    jclass packs = env->FindClass("ctw/packs/Packs");
    if (!packs) { env->ExceptionClear(); return false; }
    static const JNINativeMethod m[] = {
        {"nativeConvertAt3", "(Ljava/lang/String;Ljava/lang/String;[J)Ljava/lang/String;", (void*)nConvertAt3}};
    bool ok = env->RegisterNatives(packs, m, 1) == JNI_OK;
    if (!ok) env->ExceptionClear();
    return ok;
}


#ifdef CTW_RADIO_TEST  // standalone check: radio_test IN.AT3 OUT.mp3
int main(int argc, char** argv)
{
    const char* err = argc == 3 ? convert(argv[1], argv[2], nullptr, nullptr) : "usage: radio_test IN.AT3 OUT.mp3";
    if (err) fprintf(stderr, "%s\n", err);
    return err ? 1 : 0;
}
#endif