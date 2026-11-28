
// Two claims about "noise suppression stopped working once this was patched" have to stay answerable from the code,
// because the alternative is guessing at Discord's native side. Both are checked here:
//
//  1. The only audio calls the Bluetooth patch answers are the three that decide where sound goes (setMode,
//     startBluetoothSco, setCommunicationDevice), and it passes everything else straight to Android.
//  2. The mic switch is the user's, not a default: with "use the headset microphone" on, the hands-free link is let
//     through exactly as Android asked for it. A build that ignored the switch would look like "my headphones broke
//     in calls" while the answer sat in a switch the patch was overriding.
const fs = require("fs");
const path = require("path");

const ROOT = path.resolve(__dirname, "..", "..");
const KOTLIN = fs.readFileSync(path.join(ROOT, "extensions/audio/src/main/kotlin/app/japatch/audio/Handsfree.kt"), "utf8");

let failures = 0;
function check(name, fn) {
    try { fn(); console.log("PASS " + name); }
    catch (error) { failures++; console.log("FAIL " + name + " - " + error.message); }
}

check("the patch only answers the three calls that choose where sound goes", () => {
    // Only the @JvmStatic entry points Discord calls; the private helpers in this file are not answers to Android.
    const statics = Array.from(KOTLIN.matchAll(/@JvmStatic\s+fun (\w+)\(manager: AudioManager/g)).map(m => m[1]).sort();
    const expected = ["setCommunicationDevice", "setMode", "startBluetoothSco"].sort();
    if (JSON.stringify(statics) !== JSON.stringify(expected))
        throw new Error("answered calls are " + statics.join(", ") + ", expected " + expected.join(", "));
});

check("nothing about noise suppression, echo cancellation or the audio session is touched", () => {
    const forbidden = /AcousticEchoCanceler|NoiseSuppressor|AutomaticGainControl|AudioEffect|AudioAttributes|setParameters|AUDIO_EFFECT/;
    const hit = KOTLIN.match(forbidden);
    if (hit) throw new Error("the patch also reaches " + hit[0] + ", which is outside where sound goes");
});

check("the headset-mic switch is read from the user's settings, not assumed", () => {
    if (!/optBoolean\(KEY_MIC, false\)/.test(KOTLIN)) throw new Error("the mic switch is never read");
    if (!/!headsetMic/.test(KOTLIN)) throw new Error("the mic switch never changes what the patch does");
});

check("a request for the headset microphone is always let through", () => {
    // setCommunicationDevice is the one that makes the microphone work on Bluetooth Classic: refusing it left the mic
    // dead, so the guard there must be "keep A2DP and the user asked for the headset mic" — never an unconditional no.
    const body = KOTLIN.slice(KOTLIN.indexOf("fun setCommunicationDevice"));
    const guard = body.slice(0, body.indexOf("return manager.setCommunicationDevice"));
    if (!/keepA2dp\(manager\) && !headsetMic/.test(guard))
        throw new Error("the handset-mic request is not guarded by the user's switch");
});

console.log(failures ? failures + " failing" : "all passed");
process.exit(failures ? 1 : 0);
