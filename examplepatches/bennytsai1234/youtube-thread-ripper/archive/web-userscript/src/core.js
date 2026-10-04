(function (root, factory) {
  const core = factory();
  if (typeof module === 'object' && module.exports) module.exports = core;
  else root.YTRCore = core;
})(globalThis, function () {
  'use strict';

  function readVarint(bytes, offset) {
    let result = 0n;
    for (let index = 0; index < 10; index++) {
      if (offset >= bytes.length) throw new Error('truncated varint');
      const byte = bytes[offset++];
      if (index === 9 && byte > 1) throw new Error('invalid uint64');
      result |= BigInt(byte & 127) << BigInt(index * 7);
      if (!(byte & 128)) return { value: result, end: offset };
    }
    throw new Error('invalid varint');
  }
  function varint(value) {
    let rest = BigInt(value);
    const out = [];
    do { out.push(Number(rest & 127n) | (rest > 127n ? 128 : 0)); rest >>= 7n; } while (rest);
    return Uint8Array.from(out);
  }
  function fields(bytes) {
    const out = [];
    for (let cursor = 0; cursor < bytes.length;) {
      const start = cursor, tag = readVarint(bytes, cursor);
      if (tag.value > 0xffffffffn || tag.value < 8n) throw new Error('invalid field tag');
      const id = Number(tag.value >> 3n), wire = Number(tag.value & 7n);
      cursor = tag.end;
      let payloadStart = cursor;
      if (wire === 0) cursor = readVarint(bytes, cursor).end;
      else if (wire === 1) cursor += 8;
      else if (wire === 5) cursor += 4;
      else if (wire === 2) {
        const length = readVarint(bytes, cursor);
        if (length.value > BigInt(bytes.length)) throw new Error('invalid field length');
        payloadStart = length.end;
        cursor = payloadStart + Number(length.value);
      } else throw new Error('unsupported wire type');
      if (cursor > bytes.length) throw new Error('truncated field');
      out.push({ id, wire, start, payloadStart, end: cursor });
    }
    return out;
  }
  function concat(chunks) {
    const output = new Uint8Array(chunks.reduce((total, chunk) => total + chunk.length, 0));
    let cursor = 0;
    for (const chunk of chunks) { output.set(chunk, cursor); cursor += chunk.length; }
    return output;
  }
  function bytesOf(body) {
    if (Object.prototype.toString.call(body) === '[object ArrayBuffer]') return new Uint8Array(body);
    if (ArrayBuffer.isView(body)) return new Uint8Array(body.buffer, body.byteOffset, body.byteLength);
    return null;
  }
  function patchSabr(body, actualRate, factor) {
    const bytes = bytesOf(body);
    if (!bytes || !Number.isFinite(actualRate) || actualRate <= 0 || ![1, 2].includes(factor)) return null;
    try {
      const rootFields = fields(bytes);
      const states = rootFields.filter(field => field.id === 1 && field.wire === 2);
      if (states.length !== 1 || !rootFields.some(f => f.id === 5 && f.wire === 2 && f.end > f.payloadStart) || !rootFields.some(f => [16, 17].includes(f.id) && f.wire === 2)) return null;
      const state = states[0], abr = bytes.subarray(state.payloadStart, state.end);
      const stateFields = fields(abr), rates = stateFields.filter(f => f.id === 35);
      // Refuse an unexpected schema instead of guessing how to rewrite it.
      if (rates.length > 1 || (rates.length && rates[0].wire !== 5) || !stateFields.some(f => f.id === 28 && f.wire === 0)) return null;
      const rateField = rates[0];
      const before = rateField ? new DataView(abr.buffer, abr.byteOffset + rateField.payloadStart, 4).getFloat32(0, true) : 1;
      if (!Number.isFinite(before) || before <= 0) return null;
      const after = Math.fround(Math.max(before, actualRate) * factor);
      if (!Number.isFinite(after) || after === before) return { bytes, before, after, changed: false };
      const value = new Uint8Array(4);
      new DataView(value.buffer).setFloat32(0, after, true);
      const replacement = concat([varint((35 << 3) | 5), value]);
      const nextState = rateField ? concat([abr.subarray(0, rateField.start), replacement, abr.subarray(rateField.end)]) : concat([abr, replacement]);
      const next = concat([bytes.subarray(0, state.start), varint(10), varint(nextState.length), nextState, bytes.subarray(state.end)]);
      return { bytes: next, before, after, changed: true };
    } catch { return null; }
  }

  return Object.freeze({ fields, varint, concat, bytesOf, patchSabr });
});
