"use strict";
const crypto = require("node:crypto");
/** Verify the MorpheSig1 ZIP-comment format used by the upstream Morphe bundle signer. */
function verifyBundle(bytes, publicKey) {
  if (!Buffer.isBuffer(bytes)) bytes = Buffer.from(bytes);
  let end = -1;
  for (let i = bytes.length - 22; i >= Math.max(0, bytes.length - 65557); i--) {
    if (bytes.readUInt32LE(i) === 0x06054b50 && i + 22 + bytes.readUInt16LE(i + 20) === bytes.length) {end = i; break;}
  }
  if (end < 0) throw new Error("Bundle is not a signed ZIP");
  const [magic, embedded, signature, extra] = bytes.subarray(end + 22).toString("ascii").split(" ");
  const raw = Buffer.from(publicKey.trim(), "base64");
  if (magic !== "MorpheSig1" || embedded !== publicKey.trim() || raw.length !== 32 || extra !== undefined) throw new Error("Bundle signing identity does not match the source");
  const unsigned = Buffer.from(bytes.subarray(0, end + 22)); unsigned.writeUInt16LE(0, unsigned.length - 2);
  const digest = crypto.createHash("sha256").update(unsigned).digest();
  const key = crypto.createPublicKey({key: Buffer.concat([Buffer.from("302a300506032b6570032100", "hex"), raw]), type: "spki", format: "der"});
  if (!crypto.verify(null, Buffer.concat([Buffer.from(magic, "ascii"), digest]), key, Buffer.from(signature, "base64"))) throw new Error("Bundle signature is invalid");
  return crypto.createHash("sha256").update(bytes).digest("hex");
}
async function download(url, expectedSize, fetcher = fetch) {
  if (!url.startsWith("https://codeberg.org/")) throw new Error("Unexpected download host");
  const response = await fetcher(url, {signal: AbortSignal.timeout(60000)});
  if (!response.ok) throw new Error(`Bundle download failed: HTTP ${response.status}`);
  const bytes = Buffer.from(await response.arrayBuffer());
  if (bytes.length !== expectedSize || !bytes.length) throw new Error("Downloaded bundle size does not match its release asset");
  return bytes;
}
module.exports = {verifyBundle, download};
