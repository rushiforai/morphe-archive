// Gboard Parakeet acceptance agent for the owned emulator only.
//
// Observation: call-through hooks on the Parakeet recognizer entry points and on the
// Gboard callbacks it drives; every original result and exception is preserved.
//
// Stimulus (explicitly labelled): when the host supplies 16 kHz mono PCM, reads made by
// the Parakeet microphone thread return those samples instead of the emulator's silent
// microphone, paced by the original blocking read. Nothing is played on the host.
import Java from 'frida-java-bridge';

let stimulus = null; // Java short[]
let stimulusLength = 0;
let stimulusPos = 0;
let levels = 0;
let zeros = null;

function silence(count) {
  if (zeros === null || zeros.length < count) zeros = Java.array('short', new Array(Math.max(count, 4096)).fill(0));
  return zeros;
}

function send_(event, extra) {
  send(Object.assign({event: event, uptime_ms: Date.now()}, extra || {}));
}

rpc.exports = {
  stimulus(samples) {
    Java.perform(() => {
      stimulus = Java.array('short', samples);
      stimulusLength = samples.length;
      stimulusPos = 0;
    });
    send_('stimulus-armed', {samples: stimulusLength});
    return stimulusLength;
  },
  stimulusState() {
    return {armed: stimulus !== null, position: stimulusPos, length: stimulusLength};
  },
};

Java.perform(() => {
  const Thread = Java.use('java.lang.Thread');
  const System = Java.use('java.lang.System');

  const AudioRecord = Java.use('android.media.AudioRecord');
  const read = AudioRecord.read.overload('[S', 'int', 'int');
  read.implementation = function (buffer, offset, size) {
    const n = read.call(this, buffer, offset, size);
    if (stimulus !== null && n > 0 && Thread.currentThread().getName() === 'MorpheParakeetMic') {
      const available = Math.max(0, stimulusLength - stimulusPos);
      const copy = Math.min(n, available);
      if (copy > 0) {
        System.arraycopy(stimulus, stimulusPos, buffer, offset, copy);
        stimulusPos += copy;
        if (stimulusPos >= stimulusLength) send_('stimulus-finished', {samples: stimulusLength});
      }
      if (n > copy) System.arraycopy(silence(n - copy), 0, buffer, offset + copy, n - copy);
    }
    return n;
  };

  let Recognizer;
  try {
    Recognizer = Java.use('nl.johninnl.gboard.ParakeetRecognizer');
  } catch (e) {
    send_('hook-failed', {target: 'ParakeetRecognizer', error: String(e)});
    return;
  }

  const create = Recognizer.create.overload('android.content.Context');
  create.implementation = function (context) {
    const result = create.call(this, context);
    send_('create', {parakeet: result !== null});
    return result;
  };
  for (const name of ['start', 'stopListening', 'stopRecognition', 'shutdown', 'retry']) {
    const method = Recognizer[name];
    method.overloads.forEach((overload) => {
      overload.implementation = function () {
        send_('recognizer', {method: name});
        return overload.apply(this, arguments);
      };
    });
  }
  const callbacks = {
    cbListening: () => ({}),
    cbSpeech: () => ({}),
    cbStopListening: () => ({}),
    cbStopRecognition: () => ({}),
    cbError: (args) => ({kind: args[1]}),
    cbResult: (args) => ({text: String(args[1]), final: args[2]}),
  };
  for (const name of Object.keys(callbacks)) {
    Recognizer[name].overloads.forEach((overload) => {
      overload.implementation = function () {
        send_('callback', Object.assign({method: name}, callbacks[name](arguments)));
        return overload.apply(this, arguments);
      };
    });
  }
  const level = Recognizer.cbLevel.overload('java.lang.Object', 'int');
  level.implementation = function (callback, value) {
    if (++levels % 25 === 0) send_('callback', {method: 'cbLevel', count: levels, value: value});
    return level.call(this, callback, value);
  };

  const Engine = Java.use('nl.johninnl.gboard.ParakeetEngine');
  const transcribe = Engine.transcribe.overload('android.content.Context', '[F', 'int');
  transcribe.implementation = function (context, samples, count) {
    const start = Date.now();
    const text = transcribe.call(this, context, samples, count);
    send_('decode', {audio_ms: Math.round(count / 16), took_ms: Date.now() - start, chars: text.length});
    return text;
  };
  send_('hooks-ready', {});
});
