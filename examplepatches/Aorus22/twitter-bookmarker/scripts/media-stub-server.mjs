#!/usr/bin/env node
/**
 * Local stand-in for the remote media CDN, used only by the browser acceptance
 * run (scripts/check-web-acceptance.sh).
 *
 * The acceptance run happens inside a private network namespace with no
 * internet, so real `pbs.twimg.com` images cannot load and the gallery would
 * degrade every one of them to its error placeholder — hiding the actual layout
 * from the screenshots and making "images render" unverifiable. The runner
 * therefore:
 *
 *   1. rewrites the fixture's media URLs from https:// to http:// (the scheme is
 *      irrelevant to the app, which treats media entries as opaque URLs, and the
 *      hostname stays `pbs.twimg.com` so the stored URL is still what is used), and
 *   2. launches Chrome with `--host-resolver-rules=MAP pbs.twimg.com 127.0.0.1:8899`
 *      so those URLs resolve here.
 *
 * This returns a deterministic gradient SVG per path, so each media entry looks
 * distinct and the screenshots show real, decoded images.
 *
 * Usage: node scripts/media-stub-server.mjs [port]   (default 8899)
 */

import { createServer } from "node:http"

const port = Number(process.argv[2] ?? 8899)

/** Deterministic hue from the request path, so media tiles look distinct. */
function hueFor(path) {
  let hue = 0
  for (let i = 0; i < path.length; i++) hue = (hue * 31 + path.charCodeAt(i)) % 360
  return hue
}

function svgFor(path) {
  const hue = hueFor(path)
  const hue2 = (hue + 52) % 360
  return `<svg xmlns="http://www.w3.org/2000/svg" width="640" height="480" viewBox="0 0 640 480">
<defs><linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
<stop offset="0" stop-color="hsl(${hue},72%,64%)"/>
<stop offset="1" stop-color="hsl(${hue2},68%,38%)"/>
</linearGradient></defs>
<rect width="640" height="480" fill="url(#g)"/>
<circle cx="486" cy="118" r="66" fill="rgba(255,255,255,.22)"/>
<rect x="28" y="380" width="240" height="14" rx="7" fill="rgba(255,255,255,.45)"/>
<rect x="28" y="406" width="150" height="14" rx="7" fill="rgba(255,255,255,.3)"/>
</svg>`
}

createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "image/svg+xml", "Cache-Control": "no-store" })
  res.end(svgFor(req.url ?? "/"))
}).listen(port, "127.0.0.1", () => {
  console.log(`media stub listening on 127.0.0.1:${port}`)
})
