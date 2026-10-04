const { test } = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const core = require('../src/core.js');
const sample = new Uint8Array(Buffer.from(fs.readFileSync(__dirname + '/fixtures/sabr-request.hex', 'utf8').trim(), 'hex'));
function state(bytes) {
  const root = core.fields(bytes), abr = root.find(f => f.id === 1);
  const data = bytes.subarray(abr.payloadStart, abr.end);
  const rate = core.fields(data).find(f => f.id === 35);
  return { root, abr, data, rate, value: new DataView(data.buffer, data.byteOffset + rate.payloadStart, 4).getFloat32(0, true) };
}
test('hand-encoded protobuf truth: only the float32 3 → 6 bytes change', () => {
  assert.equal(state(sample).value, 3);
  const copy = sample.slice(), patched = core.patchSabr(sample, 3, 2);
  assert.ok(patched.changed);
  assert.equal(patched.before, 3); assert.equal(patched.after, 6);
  // Field 35 tag is 0x9d 0x02; little-endian float 3=00004040, 6=0000c040.
  assert.equal(Buffer.from(patched.bytes).toString('hex'), Buffer.from(sample).toString('hex').replace('9d0200004040', '9d020000c040'));
  assert.deepEqual(sample, copy);
  assert.equal(state(patched.bytes).value, 6);
});
test('actual rate correction preserves timing, buffered ranges and session fields', () => {
  const patched = core.patchSabr(sample, 4, 1);
  assert.equal(state(patched.bytes).value, 4);
  for (const field of state(sample).root.filter(f => f.id !== 1)) {
    const same = state(patched.bytes).root.find(f => f.id === field.id);
    assert.deepEqual(patched.bytes.subarray(same.start, same.end), sample.subarray(field.start, field.end));
  }
  const beforeState = state(sample), afterState = state(patched.bytes);
  for (const f of core.fields(beforeState.data).filter(f => f.id !== 35)) {
    const same = core.fields(afterState.data).find(g => g.id === f.id);
    assert.deepEqual(afterState.data.subarray(same.start, same.end), beforeState.data.subarray(f.start, f.end));
  }
});
test('typed-array offsets and cross-realm ArrayBuffers retain exact framing', () => {
  const backing = new Uint8Array(sample.length + 8); backing.set(sample, 3);
  assert.equal(core.patchSabr(backing.subarray(3, 3 + sample.length), 3, 2).after, 6);
  const foreign = vm.runInNewContext(`Uint8Array.from(${JSON.stringify([...sample])}).buffer`);
  assert.equal(core.patchSabr(foreign, 3, 2).after, 6);
});
test('already-correct rate is unchanged and a larger native rate is never reduced', () => {
  assert.equal(core.patchSabr(sample, 3, 1).changed, false);
  assert.equal(core.patchSabr(sample, 1, 1).after, 3);
});
test('missing playback rate is appended while other fields retain their bytes', () => {
  const old = state(sample);
  const nextState = core.concat([old.data.subarray(0, old.rate.start), old.data.subarray(old.rate.end)]);
  const request = core.concat([core.varint(10), core.varint(nextState.length), nextState, sample.subarray(old.abr.end)]);
  const patched = core.patchSabr(request, 3, 2);
  assert.equal(state(patched.bytes).value, 6);
  assert.deepEqual(patched.bytes.subarray(state(patched.bytes).abr.end), sample.subarray(old.abr.end));
});
test('malformed/unknown protobufs are passed through, not guessed', () => {
  for (const body of [new Uint8Array(), sample.subarray(0, 12), Uint8Array.of(10, 255), Uint8Array.of(0), Uint8Array.of(11, 12), 'not binary']) assert.equal(core.patchSabr(body, 3, 2), null);
  for (const speed of [undefined, NaN, Infinity, -1, 0]) assert.equal(core.patchSabr(sample, speed, 2), null);
  assert.equal(core.patchSabr(sample, 3, 99), null);
  const duplicate = core.concat([sample, sample.subarray(0, state(sample).abr.end)]);
  assert.equal(core.patchSabr(duplicate, 3, 2), null);
});
test('adding playback rate updates protobuf length across the 127-byte varint boundary', () => {
  const stateBody = core.concat([Uint8Array.of(0xe0, 1, 0), core.varint((100 << 3) | 2), core.varint(119), new Uint8Array(119)]);
  assert.equal(stateBody.length, 125);
  const request = core.concat([Uint8Array.of(10), core.varint(stateBody.length), stateBody, sample.subarray(state(sample).abr.end)]);
  const patched = core.patchSabr(request, 3, 2);
  assert.equal(state(patched.bytes).data.length, 131);
  assert.equal(state(patched.bytes).value, 6);
});
