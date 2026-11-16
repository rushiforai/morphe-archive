#!/usr/bin/env python3
"""Run Lurk's Kick chat page script (patches/src/main/resources/kick/chat/chat-page.js) in headless Chrome.

Usage: python3 tests/kick/test_chat_page.py
Requires Google Chrome or Chromium (CHROME overrides the binary) and the Python `websockets` package. Offline:
every request is answered by the test through the DevTools protocol, so the script sees a page at
https://chat.mobile.kick.com shaped like Kick's (the #app message list, its message, emote, link and highlight
elements; none of Kick's code), plus fixed Kick and 7TV responses. Checks the host guard, running once per page,
hidden highlight lines, ignored clears, 7TV words in existing and new messages (channel over global, exact words
only, links and Kick emotes untouched), global emotes only without a known owner, 7TV badges from a stand-in event
socket, and that no request carries a referrer or cookies.
It also runs the Show deleted messages script at document start on a page that reads its config the way Kick's
does, and first checks that every class Lurk selects is one Kick's real page used when
tests/kick/chat-page-contract.json was captured (refresh_chat_page_contract.py refreshes it from the live page).
The Chrome profile lives under $MORPHE_WORK (default ~/build/lurk-morphe-patches) and is removed.
"""
import asyncio
import argparse
import base64
import contextlib
import json
import os
import re
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import sys
import tempfile
import time
import urllib.parse
import urllib.request

import websockets

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = (ROOT / "patches/src/main/resources/kick/chat/chat-page.js").read_text()
MODERATOR = (ROOT / "patches/src/main/resources/kick/chat/moderator-view.js").read_text()
PAGE = "https://chat.mobile.kick.com/?config=%7B%22channelId%22%3A668%7D"
HTML = """<!doctype html><html><head></head><body><div id="app">
<div class="message-container"><span class="message-content">hi OMEGALUL EZ shared LUL, ok<span class="link"
 data-url="https://example.com/OMEGALUL">https://example.com/OMEGALUL</span> EZ<img class="emote"
 src="https://files.kick.com/emotes/1/fullsize" alt="kick"></span></div>
<div class="subscription-container">sub</div><div class="subgift-container">gift</div>
<div class="host-container">host</div><div class="reward-redeem-container">reward</div>
</div></body></html>"""
PIXEL = base64.b64decode("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==")
JSON_RESPONSES = {
    "https://7tv.io/v3/users/kick/676": {"emote_set": {"emotes": [
        {"id": "111111111111111111111111", "name": "OMEGALUL"},
        {"id": "222222222222222222222222", "name": "shared"},
    ]}},
    "https://7tv.io/v3/emote-sets/global": {"emotes": [
        {"id": "333333333333333333333333", "name": "EZ"},
        {"id": "444444444444444444444444", "name": "shared"},
        {"name": "no id"},
    ]},
}
HIGHLIGHTS = [".subscription-container", ".subgift-container", ".host-container", ".reward-redeem-container"]
# How Kick's page reads its config when it loads (tests/kick/chat-page-contract.json pins this on the real page):
# ReactNativeWebView.injectedObjectJson() when that exists, otherwise the address's `config` parameter.
CONFIG_PAGE = """<!doctype html><html><head><script>window.onload = () => { try {
const o = ['object', 'function'].includes(typeof window.ReactNativeWebView.injectedObjectJson)
    ? window.ReactNativeWebView.injectedObjectJson() : new URL(location.href).searchParams.get('config');
window.received = o ? JSON.parse(o) : null; } catch (e) { window.received = 'error'; } };</script></head>
<body><div id="app"></div></body></html>"""
CONFIG = {"chatroomId": 1, "userCanModerate": False, "channelId": 668, "headers": {"User-Agent": "fixture"}}


def contract_check():
    """Every class Lurk's chat code selects must be one Kick's real page uses (tests/kick/chat-page-contract.json,
    refreshed from the live page by refresh_chat_page_contract.py), and everything it relies on was present."""
    contract = json.loads((ROOT / "tests/kick/chat-page-contract.json").read_text())
    classes = set(contract["classes"])
    sources = [SCRIPT, MODERATOR,
               (ROOT / "extensions/shared/src/main/java/io/github/jordanwoodson/extension/shared/kick/KickChat.java").read_text()]
    # CSS selectors among the string literals; host names such as chat.mobile.kick.com look alike and are skipped.
    selectors = {literal for source in sources for literal in re.findall(r"""['"]([^'"\n]+)['"]""", source)
                 if re.fullmatch(r"(?:[a-z]*(?:\.[a-z][a-z0-9-]*)+(?:\[[^\]]*\])?)(?:,\s*[a-z]*(?:\.[a-z][a-z0-9-]*)+)*", literal)
                 and not literal.endswith((".com", ".app", ".io", ".tv"))}
    used = {name for selector in selectors for name in re.findall(r"\.([a-z][a-z0-9-]*)", selector)}
    check(used and used <= classes, "the page's captured classes include every class Lurk selects: " + ", ".join(sorted(used)))
    missing = [key for key, value in contract["required"].items() if not value["present"]]
    check(not missing, f"the page captured on {contract['captured']} had everything Lurk relies on" +
          (": missing " + ", ".join(missing) if missing else ""))


def chrome():
    for name in (os.environ.get("CHROME"), "google-chrome", "chromium", "chromium-browser"):
        if name and shutil.which(name):
            return shutil.which(name)
    sys.exit("FAIL: no Chrome or Chromium (set CHROME)")


def group_exited(pgid, seconds):
    deadline = time.monotonic() + seconds
    while time.monotonic() < deadline:
        try:
            os.killpg(pgid, 0)
        except ProcessLookupError:
            return True
        time.sleep(0.05)
    return False


def stop_chrome(process):
    """Stop Chrome and every helper in its process group. The network service still writes to the profile
    for a moment after the browser process exits, so removing the profile any earlier left part of it behind."""
    if process.poll() is None:
        process.terminate()
    try:
        process.wait(timeout=10)
    except subprocess.TimeoutExpired:
        process.kill()
        process.wait()
    if not group_exited(process.pid, 5):
        with contextlib.suppress(ProcessLookupError):
            os.killpg(process.pid, signal.SIGKILL)
        group_exited(process.pid, 2)


class Page:
    def __init__(self, ws):
        self.ws = ws
        self.next_id = 0
        self.pending = {}
        self.requests = []
        self.unexpected = []
        self.loaded = asyncio.Event()
        self.html = HTML

    async def run(self):
        async for raw in self.ws:
            message = json.loads(raw)
            if "id" in message:
                self.pending.pop(message["id"]).set_result(message)
            elif message.get("method") == "Fetch.requestPaused":
                asyncio.create_task(self.answer(message["params"]))
            elif message.get("method") == "Page.loadEventFired":
                self.loaded.set()

    async def call(self, method, **params):
        self.next_id += 1
        future = asyncio.get_running_loop().create_future()
        self.pending[self.next_id] = future
        await self.ws.send(json.dumps({"id": self.next_id, "method": method, "params": params}))
        reply = await asyncio.wait_for(future, 20)
        if "error" in reply:
            raise RuntimeError(f"{method}: {reply['error']}")
        return reply["result"]

    async def answer(self, params):
        request = params["request"]
        url = request["url"]
        self.requests.append(request)
        headers = [{"name": "Access-Control-Allow-Origin", "value": "https://chat.mobile.kick.com"}]
        if url.startswith(PAGE.split("?")[0]) or (self.html is CONFIG_PAGE and url.startswith("https://other.example/")):
            body, kind = self.html.encode(), "text/html"
        elif url in JSON_RESPONSES:
            body, kind = json.dumps(JSON_RESPONSES[url]).encode(), "application/json"
        elif url.startswith(("https://cdn.7tv.app/emote/", "https://cdn.7tv.app/badge/", "https://files.kick.com/emotes/")):
            body, kind = PIXEL, "image/png"
        else:
            self.unexpected.append(url)
            await self.call("Fetch.failRequest", requestId=params["requestId"], errorReason="Failed")
            return
        headers.append({"name": "Content-Type", "value": kind})
        await self.call("Fetch.fulfillRequest", requestId=params["requestId"], responseCode=200,
                        responseHeaders=headers, body=base64.b64encode(body).decode())

    async def go(self, url):
        self.loaded.clear()
        await self.call("Page.navigate", url=url)
        await asyncio.wait_for(self.loaded.wait(), 20)

    async def eval(self, expression):
        result = await self.call("Runtime.evaluate", expression=expression, awaitPromise=True, returnByValue=True)
        if "exceptionDetails" in result:
            raise RuntimeError(json.dumps(result["exceptionDetails"])[:800])
        return result["result"].get("value")

    async def apply(self, options):
        return await self.eval(f"{SCRIPT}({json.dumps(options)})")

    async def until(self, expression):
        for _ in range(100):
            if await self.eval(f"!!({expression})"):
                return
            await asyncio.sleep(0.1)
        raise AssertionError(f"timed out waiting for {expression}")


def check(condition, what):
    if not condition:
        raise AssertionError(what)
    print(f"ok  {what}")


async def scenario(page):
    page.requests.clear()
    await page.call("Page.enable")
    await page.call("Fetch.enable", patterns=[{"urlPattern": "*"}])

    await page.go("about:blank")
    check(await page.apply({"ignoreClears": True}) == "not the chat page", "does nothing outside the chat page")

    await page.go(PAGE)
    check(await page.apply({}) == "nothing", "no switches, no changes")
    check(await page.eval("document.querySelectorAll('style').length") == 0, "no style added without switches")
    check(await page.eval("(() => { const app = document.getElementById('app'); app.innerHTML = ''; "
                          "return app.children.length; })()") == 0, "control: without the switch a clear empties chat")

    await page.go(PAGE)
    options = {"ignoreClears": True, "hide": HIGHLIGHTS, "sevenTv": True, "sevenTvChannel": "xqc", "sevenTvUser": "676"}
    check(await page.apply(options) == "hide " + " ".join(HIGHLIGHTS) + ", ignore clears, 7tv 676", "reports what it applied")
    check(await page.apply(options) == "already applied", "applies once per page")

    hidden = await page.eval("Array.from(document.querySelectorAll('#app > div')).map(e => getComputedStyle(e).display)")
    check(hidden == ["block", "none", "none", "none", "none"], "highlight lines hidden, messages shown")

    await page.until("window.lurkChat.sevenTvCount && document.querySelector('img[alt=OMEGALUL]')")
    check(await page.eval("window.lurkChat.sevenTvCount") == [2, 3], "channel and global sets loaded")
    content = await page.eval("""Array.from(document.querySelector('.message-content').childNodes).map(n =>
        n.nodeType === 3 ? 'text:' + n.data : n.tagName + (n.classList.contains('link') ? ':link:' + n.textContent
            : ':' + n.alt + ':' + n.getAttribute('src') + ':' + n.className + ':' + n.referrerPolicy))""")
    seven = "https://cdn.7tv.app/emote/"
    check(content == [
        "text:hi ",
        f"IMG:OMEGALUL:{seven}111111111111111111111111/2x.webp:emote:no-referrer",
        "text: ",
        f"IMG:EZ:{seven}333333333333333333333333/2x.webp:emote:no-referrer",
        "text: ",
        f"IMG:shared:{seven}222222222222222222222222/2x.webp:emote:no-referrer",
        "text: LUL, ok",
        "SPAN:link:https://example.com/OMEGALUL",
        "text: ",
        f"IMG:EZ:{seven}333333333333333333333333/2x.webp:emote:no-referrer",
        "IMG:kick:https://files.kick.com/emotes/1/fullsize:emote:",
    ], "existing message: exact words become 7TV images, channel over global; links and Kick emotes stay")

    await page.eval("""(() => { const m = document.createElement('div'); m.className = 'message-container';
        m.innerHTML = '<span class="message-content">late EZ</span>'; document.getElementById('app').append(m); })()""")
    await page.until("document.querySelectorAll('#app > div:last-child img[alt=EZ]').length === 1")
    check(True, "a message added later is rewritten")

    check(await page.eval("(() => { const app = document.getElementById('app'); app.innerHTML = ''; "
                          "return app.children.length; })()") == 6, "a clear keeps the messages")
    check(await page.eval("(() => { const app = document.getElementById('app'); app.innerHTML = '<p>x</p>'; "
                          "return app.innerHTML; })()") == "<p>x</p>", "other assignments still work")

    third_party = [r for r in page.requests if "7tv" in r["url"]]
    check(not any(r["url"].startswith("https://kick.com/") for r in page.requests), "nothing is asked of Kick itself")
    check(third_party and all(not {k.lower() for k in r["headers"]} & {"referer", "cookie"} for r in third_party),
          "no referrer or cookies on 7TV requests")
    # Control: the page's own fetches do send one, so the check above can see it.
    page.requests.clear()
    await page.eval("fetch('https://7tv.io/v3/emote-sets/global').then(r => r.status)")
    # Outstanding image requests can arrive after clear(); identify the control fetch itself.
    control = next(r for r in page.requests if r["url"] == "https://7tv.io/v3/emote-sets/global")
    check(any(k.lower() == "referer" for k in control["headers"]), "control: a default fetch has a referrer")

    page.requests.clear()
    await page.go(PAGE)
    await page.apply({"sevenTv": True, "sevenTvChannel": "xqc", "sevenTvUser": None})
    await page.until("window.lurkChat.sevenTvCount")
    check(await page.eval("window.lurkChat.sevenTvCount") == [0, 3] and
          not any("/users/" in r["url"] or r["url"].startswith("https://kick.com/") for r in page.requests),
          "a channel whose owner the app hasn't seen gets global emotes only, without asking Kick")

    page.requests.clear()
    await page.go(PAGE)
    await page.apply({"sevenTv": True, "sevenTvChannel": None, "sevenTvUser": None})
    await page.until("window.lurkChat.sevenTvCount")
    check(await page.eval("window.lurkChat.sevenTvCount") == [0, 3], "an unknown channel gets global emotes only")
    check(not any("/users/" in r["url"] or r["url"].startswith("https://kick.com/") for r in page.requests),
          "and asks neither Kick nor 7TV about a user")
    check(not page.unexpected, "no other requests: " + ", ".join(page.unexpected))


async def moderator_scenario(page):
    """Show deleted messages: the document-start script, on a page that reads its config the way Kick's does."""
    await page.call("Page.enable")
    await page.call("Fetch.enable", patterns=[{"urlPattern": "*"}])
    page.html = CONFIG_PAGE
    added = []

    async def document_start(source):
        added.append((await page.call("Page.addScriptToEvaluateOnNewDocument", source=source))["identifier"])

    async def clear():
        while added:
            await page.call("Page.removeScriptToEvaluateOnNewDocument", identifier=added.pop())

    url = "https://chat.mobile.kick.com/?config=" + urllib.parse.quote(json.dumps(CONFIG))
    try:
        # react-native-webview's message listener object exists before any script runs; then Lurk's script.
        await document_start("window.ReactNativeWebView = {postMessage() {}};")
        await document_start(MODERATOR)
        page.requests.clear()
        await page.go(url)
        check(await page.eval("window.received") == CONFIG | {"userCanModerate": True},
              "the page gets its own config with userCanModerate true")
        check(await page.eval("window.lurkModeratorView") is True, "it reports that it applied")
        sent = [r["url"] for r in page.requests if r["url"].startswith("https://chat.mobile.kick.com/?")]
        check(sent and all(json.loads(urllib.parse.parse_qs(urllib.parse.urlsplit(u).query)["config"][0]) == CONFIG
                           for u in sent), "the address sent to Kick keeps userCanModerate false")
        check(await page.eval("location.href") == url, "the address inside the page is unchanged")

        await page.go(url + "&preview=true")
        check(await page.eval("window.received") == CONFIG and await page.eval("window.lurkModeratorView") is None,
              "a KICKs gift preview is left alone")
        await page.go("https://chat.mobile.kick.com/?config=not-json")
        check(await page.eval("window.received") == "error" and await page.eval("window.lurkModeratorView") is None,
              "a malformed config is left to the page, as in stock")
        await page.go("https://other.example/?config=" + urllib.parse.quote(json.dumps(CONFIG)))
        check(await page.eval("window.lurkModeratorView") is None and await page.eval("window.received") == CONFIG,
              "other origins are left alone")

        await clear()
        await document_start("window.ReactNativeWebView = {postMessage() {}, injectedObjectJson: () => '{\"app\":1}'};")
        await document_start(MODERATOR)
        await page.go(url)
        check(await page.eval("window.received") == {"app": 1}, "a config the app provides itself wins")

        await clear()
        await document_start(MODERATOR)
        await page.go(url)
        check(await page.eval("window.lurkModeratorView") is None, "without react-native-webview's bridge it does nothing")
        check(not page.unexpected, "no other requests: " + ", ".join(page.unexpected))
    finally:
        await clear()
        page.html = HTML


# Two chat lines as Kick's page draws them (the data attributes the keywords script reads), and a bridge double.
KEYWORD_LINES = """(() => { window.sent = []; window.ReactNativeWebView = {postMessage: s => sent.push(JSON.parse(s))};
    const app = document.getElementById('app'); app.innerHTML = '';
    for (const [id, name, slug, text] of [['m1', 'Troll', 'troll', 'hello'], ['m2', 'Viewer', 'viewer', 'nice clutch']]) {
        const line = document.createElement('div'); line.className = 'message-container';
        Object.assign(line.dataset, {messageId: id, senderUsername: name, senderSlug: slug, originalContent: text});
        line.innerHTML = '<span class="message-content">' + text + ' <img class="emote" alt="x"></span>';
        app.append(line);
    } })()"""


async def keywords_scenario(page):
    """Chat keywords: lines go to the app in batches, once each; its verdicts tint or hide them."""
    await page.call("Page.enable")
    await page.call("Fetch.enable", patterns=[{"urlPattern": "*"}])
    await page.go(PAGE)
    await page.eval(KEYWORD_LINES)
    check(await page.apply({"keywords": True}) == "nothing", "without a page generation nothing is sent")
    await page.go(PAGE)
    await page.eval(KEYWORD_LINES)
    check(await page.apply({"keywords": True, "generation": "g1"}) == "keywords", "reports Chat keywords")
    await page.until("sent.length === 1")
    first = await page.eval("sent[0]")
    check(first == {"type": "lurkKeywords", "generation": "g1", "items": [
        {"id": "m1", "name": "Troll", "slug": "troll", "text": "hello"},
        {"id": "m2", "name": "Viewer", "slug": "viewer", "text": "nice clutch"}]},
        "lines already shown go to the app in one batch: ID, name, handle and the text as sent")
    await page.eval("""(() => { const line = document.createElement('div'); line.className = 'message-container';
        Object.assign(line.dataset, {messageId: 'm3', senderUsername: 'Late', senderSlug: 'late', originalContent: 'late line'});
        document.getElementById('app').append(line); })()""")
    await page.until("sent.length === 2")
    check([item["id"] for item in await page.eval("sent[1].items")] == ["m3"], "a later line goes in its own batch, once")
    await page.eval("window.lurkChat.verdicts({m1: 2, m2: 1, missing: 2})")
    styles = await page.eval("""Array.from(document.querySelectorAll('.message-container')).map(e =>
        [e.dataset.messageId, getComputedStyle(e).display, getComputedStyle(e).backgroundColor])""")
    check(styles[0][:2] == ["m1", "none"], "a hidden line takes no space")
    check(styles[1][0] == "m2" and styles[1][2] == "rgba(83, 252, 24, 0.16)", "a highlighted line is tinted")
    check(styles[2][1] != "none" and styles[2][2] == "rgba(0, 0, 0, 0)", "other lines are unchanged")
    await page.eval("document.getElementById('app').append(document.querySelector('[data-message-id=m3]'))")
    await asyncio.sleep(0.1)
    check(await page.eval("sent.length") == 2, "a line that moves is not sent again")


# Kick's page styles chat from custom properties on <body> that its own code sets inline from the app's settings
# (tests/kick/chat-page-contract.json pins these rules on the real page).
LOOK_PAGE = """<!doctype html><html><head><style>
body{--timestamps-display:inline;--message-gap:2px;--chatroom-font-size:16px;font-size:var(--chatroom-font-size);line-height:1.5}
#app{display:flex;flex-direction:column;row-gap:var(--message-gap)}
.message-container{padding:4px 8px}
.timestamp{display:var(--timestamps-display)}
</style></head><body><div id="app"><div class="message-container"><span class="timestamp">03:10 PM</span>
<span class="message-content">hi</span></div><div class="message-container"><span class="message-content">yo</span></div></div>
<script>window.setPage = (timestamps, size) => { document.body.style.setProperty('--timestamps-display', timestamps ? 'inline' : 'none');
document.body.style.setProperty('--chatroom-font-size', size + 'px'); }; setPage(false, 16);</script></body></html>"""


async def look_scenario(page):
    """Chat timestamps, text size and compact chat override the page's own settings, whenever it sets them."""
    await page.call("Page.enable")
    await page.call("Fetch.enable", patterns=[{"urlPattern": "*"}])
    page.html = LOOK_PAGE
    measure = """[getComputedStyle(document.querySelector('.timestamp')).display,
        getComputedStyle(document.querySelector('.message-content')).fontSize,
        getComputedStyle(document.getElementById('app')).rowGap,
        getComputedStyle(document.querySelector('.message-container')).paddingTop]"""
    try:
        await page.go(PAGE)
        check(await page.apply({}) == "nothing" and await page.eval(measure) == ["none", "16px", "2px", "4px"],
              "control: without the switches the page's own settings apply")
        await page.go(PAGE)
        check(await page.apply({"timestamps": True}) == "timestamps", "reports timestamps")
        check((await page.eval(measure))[:2] == ["inline", "16px"], "timestamps show; the text size is the page's")
        await page.go(PAGE)
        check(await page.apply({"timestamps": True, "textSize": 20, "compact": True}) == "timestamps, text size 20, compact",
              "reports timestamps, text size and compact")
        check(await page.eval(measure) == ["inline", "20px", "0px", "1px"], "all three apply")
        await page.eval("setPage(false, 12)")
        check(await page.eval(measure) == ["inline", "20px", "0px", "1px"], "and still apply after the page sets its own")
        await page.go(PAGE)
        await page.apply({"textSize": 99})
        check((await page.eval(measure))[1] == "16px", "a text size outside 10 to 32 px is ignored")
        await clock_checks(page)
    finally:
        page.html = HTML


async def clock_checks(page):
    """Chat timestamps clock: the page's own times ("03:10 PM", written with toLocaleTimeString in the config's
    locale) become 15:10 or 3:10, for lines already there and lines added later; text the page's format can't have
    written, and the clock without Chat timestamps, are left alone."""
    times = "Array.from(document.querySelectorAll('.timestamp')).map(e => e.textContent)"
    add = """(() => { for (const text of ['11:59 PM', 'soon']) { const line = document.createElement('div');
        line.className = 'message-container'; line.innerHTML = '<span class="timestamp"></span>';
        line.firstChild.textContent = text; document.getElementById('app').appendChild(line); } })()"""
    await page.go(PAGE)
    check(await page.apply({"timestamps": True, "clock": 0}) == "timestamps, 24-hour clock", "reports the 24-hour clock")
    await page.eval(add)
    await asyncio.sleep(0.1)
    check(await page.eval(times) == ["15:10", "23:59", "soon"], "24-hour clock: 03:10 PM is 15:10, a later 11:59 PM 23:59")
    await page.go(PAGE)
    check(await page.apply({"timestamps": True, "clock": 1}) == "timestamps, 12-hour clock", "reports the 12-hour clock")
    await page.eval(add)
    await asyncio.sleep(0.1)
    check(await page.eval(times) == ["3:10", "11:59", "soon"], "12-hour clock: 3:10 and 11:59")
    german = "https://chat.mobile.kick.com/?config=" + urllib.parse.quote(json.dumps({"channelId": 668, "locale": "de"}))
    await page.go(german)
    await page.eval("document.querySelector('.timestamp').textContent = '15:10'")
    await page.apply({"timestamps": True, "clock": 1})
    check(await page.eval(times) == ["3:10"], "the config's locale: German 15:10 is 3:10 on the 12-hour clock")
    await page.go(PAGE)
    check(await page.apply({"clock": 1}) == "nothing" and await page.eval(times) == ["03:10 PM"],
          "the clock without Chat timestamps changes nothing")


async def resilient_scenario(page):
    await page.call("Page.enable")
    await page.call("Fetch.enable", patterns=[{"urlPattern": "*"}])
    # A hung owner must not hold the independently successful global catalog hostage.
    await page.go(PAGE)
    await page.eval("""window.fetch = ((original) => (url, opts) => url.includes('/users/')
        ? new Promise(() => {}) : original(url, opts))(window.fetch);
        window.WebSocket = class { close() {} };""")
    await page.apply({"sevenTv": True, "sevenTvChannel": "xqc", "sevenTvUser": "676"})
    await page.until("document.querySelector('img[alt=EZ]')")
    check(True, "successful globals render while owner request never settles")

    await page.go(PAGE)
    await page.eval("""window.events = [];
        window.ReactNativeWebView = {postMessage: s => events.push(JSON.parse(s))};
        window.WebSocket = class {
            constructor(url) { this.url=url; window.socket=this; this.sent=[]; setTimeout(()=>this.onopen(),0); }
            send(s) { this.sent.push(JSON.parse(s)); }
            close() { this.closed=true; if(this.onclose) this.onclose(); }
        };
        window.liveSet = {id:'555555555555555555555555', emotes:[
            {id:'333333333333333333333333',name:'EZ'},
            {id:'666666666666666666666666',name:'hat',flags:1},
            {id:'777777777777777777777777',name:'spark',data:{flags:256}}
        ]};
        window.fetch = (url, opts) => Promise.resolve(new Response(JSON.stringify(liveSet),{status:200}));
        document.querySelector('.message-content').textContent = 'EZ hat spark | hat EZ\\nhat EZ link hat';""")
    await page.eval("""const nativeMessage = document.createElement('span'); nativeMessage.className='message-content';
        nativeMessage.innerHTML='<img class="emote" id="native-base" src="https://files.kick.com/emotes/1/fullsize"> hat';
        window.nativeClicks=0; nativeMessage.firstChild.addEventListener('click',()=>nativeClicks++);
        document.getElementById('app').appendChild(nativeMessage);""")
    await page.apply({"sevenTv": True, "generation": "document-one", "channelId": "668"})
    await page.until("document.querySelector('[data-lurk-layer]')")
    check(await page.eval("document.querySelector('[data-lurk-layer]').querySelectorAll('img').length") == 3,
          "active-set and emote-data zero-width flags layer in order")
    check(await page.eval("document.querySelectorAll('[data-lurk-layer]').length") == 2,
          "standalone overlays and newline/text boundaries do not attach to unrelated bases")
    check(await page.eval("socket.sent[0].d.condition.object_id") == '555555555555555555555555',
          "EventAPI subscription is limited to the active set")
    check(await page.eval("events[events.length-1].emotes.length") == 3,
          "catalog crosses the existing WebView bridge without draft or message data")
    await page.eval("""liveSet.emotes = [{id:'333333333333333333333333',name:'hat'}];
        socket.onmessage({data:JSON.stringify({op:0,s:1,d:{type:'emote_set.update',body:{id:liveSet.id}}})});""")
    await page.until("document.querySelectorAll('img[data-lurk-emote]').length === 5")
    check(await page.eval("document.querySelectorAll('[data-lurk-layer]').length") == 0,
          "live removal unwraps old layers and re-renders existing words")
    check(await page.eval("document.querySelector('.message-content').textContent.includes('EZ')"),
          "removed emote becomes readable original text")
    await page.eval("document.querySelector('img[data-lurk-emote]').dispatchEvent(new Event('error'))")
    await asyncio.sleep(0.05)
    check(await page.eval("document.querySelector('.message-content').firstElementChild === null"),
          "failed image stays readable instead of observer retrying forever")
    await page.eval("document.getElementById('native-base').click()")
    check(await page.eval("nativeClicks") == 1, "native base image and its listener survive overlay refresh")
    await page.eval("window.dispatchEvent(new Event('pagehide'))")
    check(await page.eval("socket.closed"), "page teardown closes EventAPI")

    # A page initially hidden has no set IDs to refetch when it becomes visible.
    await page.go(PAGE)
    await page.eval("""Object.defineProperty(document,'hidden',{configurable:true,value:true});
        window.fetch=(url,opts)=>Promise.resolve(new Response(JSON.stringify({id:'555555555555555555555555',emotes:[
            {id:'333333333333333333333333',name:'EZ',data:{animated:true}},
            {id:'444444444444444444444444',name:'OMEGALUL',data:{animated:false}}
        ]}),{status:200}));window.WebSocket=class {close(){}};""")
    await page.apply({"sevenTv":True})
    await page.eval("Object.defineProperty(document,'hidden',{value:false});document.dispatchEvent(new Event('visibilitychange'))")
    await page.until("document.querySelector('img[alt=EZ]')")
    check(await page.eval("document.querySelector('img[alt=EZ]').src.endsWith('/2x.webp') && "
                          "document.querySelector('img[alt=OMEGALUL]').src.endsWith('/2x.webp')"),
          "visible resume loads the missing catalog; chat images keep 7TV's animated file")

    # Header and body stalls share the same deadline, with exactly three transient attempts.
    await page.go(PAGE)
    await page.eval("""window.attempts=0; window.delays=[];
        const timer=window.setTimeout;
        window.setTimeout=(fn,ms,...args)=>{delays.push(ms);return timer(fn,ms/1000,...args);};
        window.fetch=(url,opts)=>{
            attempts++;
            if(url.includes('/global')) return Promise.resolve(new Response(new ReadableStream({start(){}}),{status:200}));
            return Promise.resolve(new Response('',{status:429,headers:{'Retry-After':'2'}}));
        };""")
    await page.apply({"sevenTv":True,"sevenTvUser":"676"})
    await asyncio.sleep(0.15)
    check(await page.eval("attempts") == 6, "body stall and 429 each stop after three attempts")
    check(await page.eval("delays.includes(2000)"), "429 Retry-After is honored within the cap")
    await page.eval("window.dispatchEvent(new Event('pagehide'))")
    attempts = await page.eval("attempts")
    await asyncio.sleep(0.05)
    check(await page.eval("attempts") == attempts, "no work after teardown")


BADGE_LINES = """const app = document.getElementById('app');
    window.line = (sender, name) => { const line = document.createElement('div');
        line.className = 'message-container'; line.dataset.senderId = sender;
        line.innerHTML = '<span class="user-wrapper"><span class="timestamp">01:05 PM</span><span><img class="badge" '
            + 'src="/badges/vip.png" alt="VIP"></span><span class="username">' + name + '</span></span>'
            + '<span class="message-content">hi</span>';
        app.appendChild(line); return line; };
    line('101', 'holder'); line('202', 'plain');"""


def badge_event(kind, body):
    return {"op": 0, "d": {"type": kind, "body": {"object": body}}}


def cosmetic(badge_id, files=None, url=None):
    return badge_event("cosmetic.create", {"kind": "BADGE", "data": {"id": badge_id, "tooltip": "Subscriber", "host": {
        "url": url or f"//cdn.7tv.app/badge/{badge_id}",
        "files": files or [{"name": "1x.webp", "static_name": "1x_static.webp", "width": 18, "frame_count": 10},
                           {"name": "3x.webp", "static_name": "3x_static.webp", "width": 54, "frame_count": 10},
                           {"name": "4x.webp", "width": 72}]}}})


def entitlement(kind, badge_id, kick_id):
    return badge_event(kind, {"kind": "BADGE", "ref_id": badge_id, "user": {"connections": [
        {"platform": "TWITCH", "id": "999"}, {"platform": "KICK", "id": kick_id}]}})


async def badges_scenario(page):
    """7TV badges: the subscription, badges drawn after Kick's own on lines already shown and new ones, changes and
    removals, untrusted images refused, and teardown."""
    await page.go(PAGE)
    page.requests.clear()
    await page.eval("""window.sockets = [];
        window.WebSocket = class {
            constructor(url) { this.url = url; this.sent = []; sockets.push(this); setTimeout(() => this.onopen(), 0); }
            send(s) { this.sent.push(JSON.parse(s)); }
            close() { this.closed = true; if (this.onclose) this.onclose(); }
        };
        window.deliver = (m) => sockets[sockets.length - 1].onmessage({data: JSON.stringify(m)});""" + BADGE_LINES)
    applied = await page.apply({"sevenTvBadges": True, "sevenTvUser": "676"})
    check(applied == "7tv badges 676", f"7TV badges applies with the channel owner: {applied}")
    await page.until("sockets.length === 1 && sockets[0].sent.length === 2")
    check(await page.eval("sockets[0].url") == "wss://events.7tv.io/v3" and
          await page.eval("sockets[0].sent.map(s => s.op + ' ' + s.d.type + ' ' + JSON.stringify(s.d.condition))") ==
          ['35 cosmetic.* {"platform":"KICK","ctx":"channel","id":"676"}',
           '35 entitlement.* {"platform":"KICK","ctx":"channel","id":"676"}'],
          "one socket to events.7tv.io subscribes to the channel owner's cosmetics and entitlements on Kick")
    check(not any("7tv" in r["url"] for r in page.requests), "no chatter or channel is looked up over HTTP")
    holder = "document.querySelector('[data-sender-id=\"101\"] .user-wrapper')"
    plain = "document.querySelector('[data-sender-id=\"202\"] .user-wrapper')"
    await page.eval(f"deliver({json.dumps(entitlement('entitlement.create', 'BADGEA', '101'))})")
    check(await page.eval(f"{holder}.querySelectorAll('img').length") == 1,
          "a holder whose badge isn't defined yet gets nothing")
    await page.eval(f"deliver({json.dumps(cosmetic('BADGEA'))})")
    check(await page.eval(f"Array.from({holder}.children).map(e => e.className || (e.dataset.lurkBadge ? 'lurk' : 'kick'))") ==
          ["timestamp", "kick", "lurk", "username"], "the badge goes after Kick's own badges, before the name")
    check(await page.eval(f"{holder}.querySelector('[data-lurk-badge] img').src") ==
          "https://cdn.7tv.app/badge/BADGEA/3x_static.webp",
          "the largest file up to 3x, its still copy for an animated badge")
    check(await page.eval(f"{holder}.querySelector('[data-lurk-badge] img').className") == "badge" and
          await page.eval(f"{holder}.querySelector('[data-lurk-badge] img').title") == "Subscriber",
          "drawn with Kick's badge class and 7TV's tooltip")
    check(await page.eval(f"{plain}.querySelectorAll('img').length") == 1, "other chatters keep Kick's badges only")
    await page.eval("line('101', 'holder again'); line('202', 'plain again')")
    await page.until("document.querySelectorAll('[data-lurk-badge]').length === 2")
    check(await page.eval("document.querySelectorAll('[data-sender-id=\"202\"] [data-lurk-badge]').length") == 0,
          "new lines of the holder get the badge as they arrive")
    await page.eval(f"deliver({json.dumps(cosmetic('BADGEB', files=[{'name': '2x.png', 'width': 36}]))});"
                    f"deliver({json.dumps(entitlement('entitlement.create', 'BADGEB', '101'))})")
    check(await page.eval("Array.from(document.querySelectorAll('[data-lurk-badge] img')).map(i => i.src)") ==
          ["https://cdn.7tv.app/badge/BADGEB/2x.png"] * 2, "a newer badge replaces the old one on every line")
    await page.eval(f"deliver({json.dumps(entitlement('entitlement.delete', 'BADGEA', '101'))})")
    check(await page.eval("document.querySelectorAll('[data-lurk-badge]').length") == 2,
          "removing a badge the chatter no longer holds changes nothing")
    await page.eval(f"deliver({json.dumps(entitlement('entitlement.delete', 'BADGEB', '101'))})")
    check(await page.eval("document.querySelectorAll('[data-lurk-badge]').length") == 0, "a removed badge goes")
    await page.eval(f"deliver({json.dumps(cosmetic('BADGEC', url='//evil.example/badge/BADGEC'))});"
                    f"deliver({json.dumps(cosmetic('BADGED', files=[{'name': '../x.webp', 'width': 18}]))});"
                    f"deliver({json.dumps(entitlement('entitlement.create', 'BADGEC', '202'))});"
                    f"deliver({json.dumps(entitlement('entitlement.create', 'BADGED', '101'))})")
    check(await page.eval("document.querySelectorAll('[data-lurk-badge]').length") == 0,
          "images from anywhere but cdn.7tv.app, or with odd file names, are refused")
    await page.eval("window.dispatchEvent(new Event('pagehide'))")
    check(await page.eval("sockets[0].closed === true"), "page teardown closes the socket")
    await asyncio.sleep(0.1)
    check(await page.eval("sockets.length") == 1, "and nothing reconnects afterwards")

    await page.go(PAGE)
    await page.eval("window.sockets = []; window.WebSocket = class { constructor() { sockets.push(this); } };")
    check(await page.apply({"sevenTvBadges": True, "sevenTvUser": None}) == "7tv badges: channel owner unknown" and
          await page.eval("sockets.length") == 0, "without the channel's owner nothing connects")


async def native_scenario(page, captures):
    """Run exactly the strings captured from production WebView.evaluateJavascript on ART."""
    expected = {"full", "info", "unknown", "provider-off", "malformed", "provider-only",
                "missing-config", "invalid-id", "clears-only", "subs-only", "hosts-only", "rewards-only",
                "moderator-only"}
    check(set(captures) == expected, "complete native capture scenarios")
    for name, script in captures.items():
        page.requests.clear()
        await page.go(PAGE)
        await page.eval(script)
        single = name in ("clears-only", "subs-only", "hosts-only", "rewards-only", "moderator-only")
        provider = name != "provider-off" and not single
        clears = name not in ("provider-only", "subs-only", "hosts-only", "rewards-only", "moderator-only")
        display = ["block", "none", "none", "none", "none"]
        if name in ("provider-only", "clears-only"):
            display = ["block"] * 5
        elif single:
            display = ["block"] * 5
            for index in {"subs-only": [1, 2], "hosts-only": [3], "rewards-only": [4]}.get(name, []):
                display[index] = "none"
        if provider:
            expected_count = [0, 3] if name in ("unknown", "malformed", "missing-config", "invalid-id") else [2, 3]
            await page.until("JSON.stringify(window.lurkChat.sevenTvCount) === " + json.dumps(json.dumps(expected_count, separators=(",", ":"))))
            check(await page.eval("window.lurkChat.sevenTvCount") == expected_count,
                  f"native {name}: actual response/config selects expected emotes")
        else:
            check(not any("7tv" in r["url"] for r in page.requests),
                  f"native {name}: no provider requests")
        hidden = await page.eval("Array.from(document.querySelectorAll('#app > div')).map(e => getComputedStyle(e).display)")
        check(hidden == display,
              f"native {name}: independent hide switches")
        remaining = await page.eval("(() => {const app=document.getElementById('app'); app.innerHTML=''; return app.children.length;})()")
        check(remaining == (5 if clears else 0), f"native {name}: independent clear switch")
        check(not any(r["url"].startswith("https://kick.com/") for r in page.requests),
              f"native {name}: known owner or globals require no owner lookup")
    check(not page.unexpected, "native captures make no unexpected requests")


async def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--native-captures", type=Path, help="bin/test-kick-chat ART capture log")
    args = parser.parse_args()
    contract_check()
    work = Path(os.environ.get("MORPHE_WORK", Path.home() / "build/lurk-morphe-patches"))
    work.mkdir(parents=True, exist_ok=True)
    profile = Path(tempfile.mkdtemp(prefix="chat-page-", dir=work))
    with socket.socket() as s:
        s.bind(("127.0.0.1", 0))
        port = s.getsockname()[1]
    command = [chrome(), "--headless=new", f"--remote-debugging-port={port}", f"--user-data-dir={profile}",
               "--no-first-run", "--disable-gpu", "about:blank"]
    stderr = profile / "chrome.log"
    processes = []
    try:
        # A loaded CI runner can take well over ten seconds to bring up headless Chrome; wait up to a
        # minute, and launch once more if the first process dies, keeping its stderr for the message.
        url = None
        for attempt in range(2):
            # Its own process group, so stop_chrome can wait for the helpers Chrome starts.
            with stderr.open("ab") as log:
                process = subprocess.Popen(command, stdout=subprocess.DEVNULL, stderr=log, start_new_session=True)
            processes.append(process)
            for _ in range(600):
                if process.poll() is not None:
                    break
                try:
                    targets = json.load(urllib.request.urlopen(f"http://127.0.0.1:{port}/json/list"))
                    url = next(t["webSocketDebuggerUrl"] for t in targets if t["type"] == "page")
                    break
                except (OSError, StopIteration):
                    await asyncio.sleep(0.1)
            if url:
                break
            stop_chrome(process)
        if not url:
            sys.exit("FAIL: Chrome didn't start: " + stderr.read_text(errors="replace")[-2000:])
        async with websockets.connect(url, max_size=None) as ws:
            page = Page(ws)
            reader = asyncio.create_task(page.run())
            try:
                await moderator_scenario(page)
                await keywords_scenario(page)
                await look_scenario(page)
                await resilient_scenario(page)
                await badges_scenario(page)
                await scenario(page)
                if args.native_captures:
                    captures = {}
                    for line in args.native_captures.read_text().splitlines():
                        if line.startswith("CAPTURE "):
                            _, name, encoded = line.split()
                            check(name not in captures, f"unique native capture {name}")
                            captures[name] = base64.b64decode(encoded).decode()
                    await native_scenario(page, captures)
            finally:
                reader.cancel()
    finally:
        for process in processes:
            stop_chrome(process)
        shutil.rmtree(profile, ignore_errors=True)
    print("PASS: chat page script")


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except AssertionError as e:
        sys.exit(f"FAIL: {e}")
