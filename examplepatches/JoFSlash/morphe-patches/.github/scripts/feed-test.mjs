// Signs in to Quora with a test account in the patched app on an emulator and checks that the page
// patches work on the feed and on an answer page. Run after check_quora_version.py --install, with a
// bundle whose page scripts turn WebView debugging on (the feed test workflow builds one).
//
// Usage: QUORA_TEST_EMAIL=… QUORA_TEST_PASSWORD=… node .github/scripts/feed-test.mjs
// Optional: ADB (path to adb), QUORA_PACKAGE (default com.quora.android), DRY_RUN=1 (fills the
// sign-in form but doesn't send it), FEED_TEST_RESULT (a file to write the outcome to, one line:
// "passed", "skipped: <why>" or "failed: <why>"; the workflow opens or closes an issue from it).
//
// Exit codes: 0 every check passed, or the test was skipped (no account, or Quora clearly asked for more
// than a password: a captcha or a code); 1 a check failed; 2 the app or its pages couldn't be reached.
// The account's email and password are never printed.
import { execFileSync } from 'node:child_process';
import { writeFileSync } from 'node:fs';

const ADB = process.env.ADB || 'adb';
const PACKAGE = process.env.QUORA_PACKAGE || 'com.quora.android';
const PORT = 9222;
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

const adb = (...args) => {
  try {
    return execFileSync(ADB, args, { encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] }).trim();
  } catch {
    return '';
  }
};
const notice = (msg) => console.log(`::notice title=Feed test::${msg}`);
// A skipped run is yellow in the summary, so a test that keeps skipping gets noticed.
const warning = (msg) => console.log(`::warning title=Feed test::${msg}`);
// What the run ends with, for FEED_TEST_RESULT.
let outcome = 'failed: the test stopped before saying why';
const report = (line) => { outcome = line.replace(/\s+/g, ' ').trim(); };

async function connect() {
  const pid = adb('shell', 'pidof', PACKAGE).split(/\s+/)[0];
  if (!pid) return false;
  adb('forward', '--remove-all');
  adb('forward', `tcp:${PORT}`, `localabstract:webview_devtools_remote_${pid}`);
  return true;
}

async function pages() {
  try {
    const list = await (await fetch(`http://localhost:${PORT}/json`)).json();
    // An answer opened from the feed is a modal page that reports about:blank.
    return list.filter((p) => p.type === 'page' && p.webSocketDebuggerUrl
      && (p.url === 'about:blank' || /^https:\/\/([a-z]+\.)?quora\.com\//.test(p.url)));
  } catch {
    return [];
  }
}

/** Runs an expression in one page and returns its value (promises are awaited). */
function evaluate(page, expression, timeout = 30000) {
  return new Promise((resolve) => {
    const ws = new WebSocket(page.webSocketDebuggerUrl);
    const timer = setTimeout(() => { try { ws.close(); } catch {} resolve(undefined); }, timeout);
    ws.onerror = () => { clearTimeout(timer); resolve(undefined); };
    ws.onopen = () => ws.send(JSON.stringify({
      id: 1, method: 'Runtime.evaluate', params: { expression, returnByValue: true, awaitPromise: true },
    }));
    ws.onmessage = (m) => {
      const d = JSON.parse(m.data);
      if (d.id !== 1) return;
      clearTimeout(timer);
      try { ws.close(); } catch {}
      resolve(d.result?.result?.value);
    };
  });
}

/** Waits until one of the pages returns something truthy for the expression. */
async function waitFor(expression, seconds) {
  const end = Date.now() + seconds * 1000;
  while (Date.now() < end) {
    for (const page of await pages()) {
      const value = await evaluate(page, expression, 10000);
      if (value) return { page, value };
    }
    await sleep(3000);
  }
  return null;
}

const VISIBLE = 'function vis(e){for(;e&&e.nodeType===1;e=e.parentElement){var s=getComputedStyle(e);'
  + "if(s.display==='none'||s.visibility==='hidden')return false;}return true;}";
const FEED = '[class*="dom_annotate_multifeed_bundle_"]';
const feedCount = `document.querySelectorAll('${FEED}').length>=3&&location.pathname==='/'`;
const clickText = (labels) => `(function(){var want=${JSON.stringify(labels)};${VISIBLE}`
  + "var b=[].slice.call(document.querySelectorAll('button,[role=button],a')).find(function(e){"
  + 'return want.indexOf((e.innerText||"").trim())>=0&&vis(e)&&e.getClientRects().length;});'
  + 'if(!b)return false;b.click();return true;})()';

/** Sends one DevTools command to a page. */
function command(page, method, params = {}, timeout = 20000) {
  return new Promise((resolve) => {
    const ws = new WebSocket(page.webSocketDebuggerUrl);
    const timer = setTimeout(() => { try { ws.close(); } catch {} resolve(undefined); }, timeout);
    ws.onerror = () => { clearTimeout(timer); resolve(undefined); };
    ws.onopen = () => ws.send(JSON.stringify({ id: 1, method, params }));
    ws.onmessage = (m) => {
      const d = JSON.parse(m.data);
      if (d.id !== 1) return;
      clearTimeout(timer);
      try { ws.close(); } catch {}
      resolve(d.result);
    };
  });
}

// The cookies that hold a Quora session; the rest the app sets itself.
const SESSION_COOKIES = ['m-b', 'm-b_lax', 'm-b_strict', 'm-s', 'm-lat', 'm-uid', 'm-login'];
const HTTP_ONLY = ['m-b', 'm-b_lax', 'm-b_strict', 'm-s', 'm-lat'];

/**
 * Signs in with a saved session ("m-b=…; m-s=…" as a browser sends them) instead of the password:
 * puts the cookies into the app's WebView and reloads the feed. Returns 'signed-in' or why not.
 */
async function useSession(cookieText) {
  const cookies = cookieText.split(';').map((c) => c.trim()).filter(Boolean).map((c) => {
    const i = c.indexOf('=');
    return { name: c.slice(0, i).trim(), value: c.slice(i + 1).trim() };
  }).filter((c) => SESSION_COOKIES.includes(c.name) && c.value);
  if (!cookies.some((c) => c.name === 'm-b')) return 'session-without-m-b';
  const page = (await pages()).find((p) => p.url.startsWith('https://www.quora.com/'));
  if (!page) return 'no-page-for-session';
  const expires = Math.floor(Date.now() / 1000) + 30 * 24 * 3600;
  for (const c of cookies) {
    const set = await command(page, 'Network.setCookie', {
      name: c.name, value: c.value, domain: '.quora.com', path: '/', secure: true,
      httpOnly: HTTP_ONLY.includes(c.name), expires,
    });
    if (!set || set.success === false) return `cookie-not-set:${c.name}`;
  }
  await command(page, 'Page.navigate', { url: 'https://www.quora.com/' });
  if (!(await waitFor(feedCount, 60))) return 'session-not-accepted';
  // The app itself still shows its signed-out screen over that page. Opening its start screen
  // again, in a new task, makes it look at the cookies again and show the feed. The process keeps
  // running, so the cookies don't have to be on disk yet (the WebView writes them only now and then).
  const launcher = adb('shell', 'cmd', 'package', 'resolve-activity', '--brief', '-c',
    'android.intent.category.LAUNCHER', PACKAGE).split('\n').pop().trim();
  if (!launcher.includes('/')) return 'no-launcher-activity';
  adb('shell', 'am', 'start', '-n', launcher, '-f', '0x10008000');
  let connected = false;
  for (let i = 0; i < 20 && !connected; i++) {
    await sleep(3000);
    connected = (await connect()) && (await pages()).length > 0;
  }
  if (!connected) return 'app-not-back';
  if (!(await waitFor(feedCount, 60))) return 'session-lost-on-restart';
  // In the EU the cookie dialog shows again over the feed after the restart.
  await waitFor(clickText(['Reject All']), 8);
  return 'signed-in';
}

/** Taps the visible button with this text with adb, at its place on the screen. */
async function tapText(label) {
  for (const page of await pages()) {
    const spot = await evaluate(page, `(function(){
      var b=[].slice.call(document.querySelectorAll('button,[role=button],a')).find(function(e){
        return (e.innerText||'').trim()===${JSON.stringify(label)}&&e.getClientRects().length;});
      if(!b)return null;b.scrollIntoView({block:'center'});var r=b.getBoundingClientRect();
      return {x:r.left+r.width/2,y:r.top+r.height/2,dpr:window.devicePixelRatio};})()`);
    const view = spot && webViewBounds();
    if (!spot || !view) continue;
    adb('shell', 'input', 'tap', String(Math.round(view.l + spot.x * spot.dpr)), String(Math.round(view.t + spot.y * spot.dpr)));
    return true;
  }
  return false;
}

/** What the pages show, for a failed sign-in: addresses, buttons and field types, never values. */
async function describePages() {
  try {
    const all = await (await fetch(`http://localhost:${PORT}/json`)).json();
    console.log(`  all pages: ${JSON.stringify(all.map((p) => `${p.type} ${p.url.split('?')[0]}`))}`);
  } catch {
    console.log('  all pages: DevTools not reachable');
  }
  for (const page of await pages()) {
    const info = await evaluate(page, `(function(){
      function vis(e){return e.getClientRects().length>0;}
      return {url:location.href.split('?')[0],title:document.title,
        buttons:[].slice.call(document.querySelectorAll('button,[role=button],a')).filter(vis)
          .map(function(e){return (e.innerText||'').trim().replace(/\\s+/g,' ').slice(0,40);}).filter(Boolean).slice(0,20),
        fields:[].slice.call(document.querySelectorAll('input')).filter(vis)
          .map(function(i){return i.type+(i.id?'#'+i.id:'')+(i.name?'['+i.name+']':'')+(i.value?' (filled)':' (empty)');}),
        // The page's own messages, such as a sign-in error; lines with an address are left out.
        text:((document.body&&document.body.innerText)||'').split('\\n').map(function(l){return l.trim();})
          .filter(function(l){return l&&l.indexOf('@')<0;}).slice(0,25)};})()`, 8000);
    console.log(`  page: ${JSON.stringify(info)}`);
  }
}

async function signIn(email, password) {
  // The cookie dialog shows in the EU only.
  await waitFor(clickText(['Reject All']), 10);
  if (await waitFor(feedCount, 5)) return 'signed-in';
  const hasForm = "!!document.querySelector('input#email')&&!!document.querySelector('input#password')";
  // The start page's Login button opens the form; "Log in" would send it, so only Login is tapped.
  if (!(await waitFor(hasForm, 3))) {
    if (!(await waitFor(clickText(['Login']), 60))) return 'no-login-button';
    // Some WebViews only open the form on a real tap, so tap the button when the click did nothing.
    if (!(await waitFor(hasForm, 10)) && !(await tapText('Login'))) return 'no-login-button';
  }
  const form = await waitFor(hasForm, 30);
  if (!form) return 'no-form';
  const fill = `(function(){var set=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set;
    function put(id,v){var i=document.querySelector('input#'+id);i.focus();set.call(i,v);
      i.dispatchEvent(new Event('input',{bubbles:true}));i.dispatchEvent(new Event('change',{bubbles:true}));}
    put('email',${JSON.stringify(email)});put('password',${JSON.stringify(password)});
    return document.querySelector('input#email').value.length>0&&document.querySelector('input#password').value.length>0;})()`;
  if (!(await evaluate(form.page, fill))) return 'fill-failed';
  if (process.env.DRY_RUN === '1') return 'dry-run';
  await sleep(1000);
  if (!(await evaluate(form.page, clickText(['Log in'])))) return 'no-submit';
  // As with Login: tap the button when the click did nothing and the form is still there.
  if (!(await waitFor(feedCount, 12)) && (await waitFor(hasForm, 2))) await tapText('Log in');
  if (await waitFor(feedCount, 90)) return 'signed-in';
  // Say why, without printing the page (it may show the address). Only clear signs of a captcha or
  // a code count as "Quora wants more"; anything else fails the test, so it can't pass by skipping.
  // Quora can ask in another page than the form (its "Help Us Protect Your Account" code dialog).
  const reasons = [];
  for (const page of await pages()) {
    reasons.push(await evaluate(page, '(function(){var t=(document.body&&document.body.innerText||"").toLowerCase();'
      + "if(document.querySelector('iframe[src*=\"recaptcha\"],iframe[src*=\"hcaptcha\"],iframe[src*=\"captcha\"]')"
      + "||/i'm not a robot|complete the captcha/.test(t))return 'captcha';"
      + "if(document.querySelector('input[autocomplete=\"one-time-code\"],input[name*=\"code\" i]')"
      + "||/help us protect your account|resend code|verification code|enter the code|we (just )?sent (you )?(a|an|the) (code|email|link)|confirm (it's|it is) you/.test(t))"
      + "return 'verification';"
      + "if(/please confirm your email address/.test(t))return 'email-not-confirmed';"
      + "if(/incorrect password|wrong password|no account|isn't associated|not associated/.test(t))return 'rejected';"
      + "return null;})()", 8000));
  }
  const why = ['captcha', 'verification', 'email-not-confirmed', 'rejected'].find((r) => reasons.includes(r));
  return `not-signed-in:${why || 'unknown'}`;
}

const FEED_CHECKS = `(async function(){${VISIBLE}
  window.scrollBy(0,1500);await new Promise(function(r){setTimeout(r,4000);});window.scrollTo(0,0);
  await new Promise(function(r){setTimeout(r,2000);});
  var out={};
  out.bridge=typeof window.JoFSlashPatches==='object';
  out.feedItems=document.querySelectorAll('${FEED}').length;
  out.askBoxVisible=[].slice.call(document.querySelectorAll('[class*="dom_annotate_multifeed_bundle_AskQ"]')).filter(vis).length;
  var bars=[].slice.call(document.querySelectorAll('.dom_annotate_answer_action_bar_share'));
  out.shareBars=bars.length;
  out.copyButtons=document.querySelectorAll('[data-jofslash-clone] [aria-label="Copy text"],[data-jofslash-clone][aria-label="Copy text"]').length;
  out.shareTextButtons=document.querySelectorAll('[data-jofslash-clone] [aria-label="Share text"],[data-jofslash-clone][aria-label="Share text"]').length;
  out.mostCopiesInOneBar=bars.reduce(function(m,b){var p=b.parentElement;
    var n=p?p.querySelectorAll('[aria-label="Copy text"]').length:0;return Math.max(m,n);},0);
  out.promotedVisible=[].slice.call(document.querySelectorAll('${FEED}')).filter(function(u){
    return vis(u)&&/(^|\\n)(Promoted by|Sponsored)\\b/.test(u.innerText||'');}).length;
  var url='https://www.quora.com/jofslash-feed-test-bookmark';var J=window.JoFSlashPatches;
  if(J){var before=J.isBookmarked(url);J.toggleBookmark(url,'Feed test','');var saved=J.isBookmarked(url);
    J.toggleBookmark(url,'Feed test','');out.bookmarkStore=!before&&saved&&!J.isBookmarked(url);}
  return out;})()`;

// Where to tap to open the first answer in the feed, in page pixels: a part of it such as its title.
const spotScript = (part) => `(async function(){${VISIBLE}
  var t=[].slice.call(document.querySelectorAll('[class*="dom_annotate_multifeed_bundle_AnswersBundle"] ${part}')).find(vis);
  if(!t)return null;t.scrollIntoView({block:'center'});await new Promise(function(r){setTimeout(r,1500);});
  var r=t.getBoundingClientRect();if(r.width<10||r.height<5||r.top<0||r.bottom>window.innerHeight)return null;
  return {x:r.left+Math.min(r.width/2,100),y:r.top+r.height/2,dpr:window.devicePixelRatio};})()`;

const IS_ANSWER = "/AnswerModal|\\/answer\\//.test(location.href)&&document.readyState==='complete'";

// The bookmark script waits up to 20 s for the page's data, so give it 25 s. Without a button,
// say what the page had, to tell a slow page from a changed one.
const ANSWER_CHECKS = `(async function(){
  function count(s){return document.querySelectorAll(s).length;}
  for(var i=0;i<50&&!count('[aria-label="Bookmark"],[aria-label="Remove bookmark"]');i++)
    await new Promise(function(r){setTimeout(r,500);});
  var out={bookmarkButton:count('[aria-label="Bookmark"],[aria-label="Remove bookmark"]'),
    copyButtons:count('[aria-label="Copy text"]')};
  if(!out.bookmarkButton){var m=/rootCls=(\\w+)/.exec(location.href);out.page=m?m[1]:location.pathname;
    out.shareButtons=count('.dom_annotate_answer_action_bar_share')+count('button [aria-label="Share"]');
    out.bridgeReady=!!(window.JoFSlashPatches&&window.JoFSlashPatches.ready());
    out.questionTitle=!!document.querySelector('.puppeteer_test_question_title');
    var p=/[?&]props=([^&#]+)/.exec(location.href),props=null;try{props=JSON.parse(decodeURIComponent(p[1]));}catch(e){}
    var R=window.__RELAY_RECORDS__||{},found=false;
    for(var k in R){var x=R[k];if(x&&props&&((props.aid&&x.aid===props.aid)||(props.pid&&x.pid===props.pid))){found=!!(x.permaUrl||x.url);break;}}
    out.addressInData=found;}
  return out;})()`;

/** The screen position of the biggest WebView, from uiautomator. */
function webViewBounds() {
  adb('shell', 'uiautomator', 'dump', '/sdcard/window.xml');
  const xml = adb('shell', 'cat', '/sdcard/window.xml');
  let best = null;
  for (const m of xml.matchAll(/class="android\.webkit\.WebView"[^>]*bounds="\[(\d+),(\d+)\]\[(\d+),(\d+)\]"/g)) {
    const [l, t, r, b] = m.slice(1).map(Number);
    if (!best || (r - l) * (b - t) > (best.r - best.l) * (best.b - best.t)) best = { l, t, r, b };
  }
  return best;
}

async function main() {
  const email = process.env.QUORA_TEST_EMAIL;
  const password = process.env.QUORA_TEST_PASSWORD;
  const session = process.env.QUORA_TEST_COOKIES;
  if (!session && (!email || !password)) {
    notice('QUORA_TEST_COOKIES, or QUORA_TEST_EMAIL and QUORA_TEST_PASSWORD, aren\'t set, so the feed test is skipped.');
    report('skipped: no test account in the secrets');
    return 0;
  }
  let connected = false;
  for (let i = 0; i < 20 && !connected; i++) {
    connected = (await connect()) && (await pages()).length > 0;
    if (!connected) await sleep(3000);
  }
  if (!connected) {
    console.error('No Quora page to inspect: the app isn\'t running, or WebView debugging is off in this build.');
    report('failed: no Quora page to inspect (the app isn\'t running, or WebView debugging is off)');
    return 2;
  }

  // A saved session skips the sign-in, where Quora asks a new device for a code sent by email.
  let state = session ? await useSession(session) : 'no-session';
  if (session) console.log(`Saved session: ${state}`);
  if (state !== 'signed-in' && email && password) state = await signIn(email, password);
  else if (state !== 'signed-in') state = `not-signed-in:${state}`;
  console.log(`Sign-in: ${state}`);
  if (state === 'dry-run') {
    report('skipped: dry run');
    return 0;
  }
  if (state.startsWith('not-signed-in:captcha') || state.startsWith('not-signed-in:verification')) {
    warning(`Quora asked for more than a password (${state.split(':')[1]}), so the feed test is skipped. `
      + 'A new emulator is a new device to Quora: save a signed-in session in the QUORA_TEST_COOKIES secret '
      + '(see docs/quora/CONTRIBUTING.md) so the test doesn\'t sign in at all.');
    report(`skipped: ${session ? 'the saved session in QUORA_TEST_COOKIES no longer works' : 'no saved session'}, `
      + `and Quora asked for a ${state.split(':')[1]} when signing in with the password. `
      + 'Save a new session in QUORA_TEST_COOKIES (see docs/quora/CONTRIBUTING.md) and run the Feed test by hand.');
    return 0;
  }
  if (state === 'not-signed-in:email-not-confirmed') {
    console.log('::error title=Feed test::Quora says the test account\'s email address isn\'t confirmed. '
      + 'Open the confirmation email Quora sent to it (or sign in once by hand and tap Resend Confirmation Link), then run this again.');
    report('failed: Quora says the test account\'s email address isn\'t confirmed');
    return 2;
  }
  if (state !== 'signed-in') {
    await describePages();
    console.log(`::error title=Feed test::Couldn't sign in (${state}). A changed sign-in page, `
      + 'a wrong password in the secrets, or a locked test account.');
    report(`failed: couldn't sign in (${state}). A changed sign-in page, an expired session in `
      + 'QUORA_TEST_COOKIES, a wrong password in the secrets, or a locked test account.');
    return 2;
  }

  // The feed on the screen: a page left from the signed-out screen can still be there, hidden.
  // When none says it is on the screen, check any feed page; the answer taps then can't work.
  let feed = await waitFor(`${feedCount}&&document.visibilityState==='visible'&&window.innerWidth>0`, 20);
  if (!feed) {
    feed = await waitFor(feedCount, 30);
    if (feed) {
      for (const page of await pages()) {
        console.log(`  page ${page.url.split('?')[0]}: ${JSON.stringify(await evaluate(page,
          '({visibility:document.visibilityState,width:window.innerWidth,height:window.innerHeight})', 8000))}`);
      }
      adb('shell', 'uiautomator', 'dump', '/sdcard/window.xml');
      const screen = adb('shell', 'cat', '/sdcard/window.xml');
      const texts = [...screen.matchAll(/(?:text|content-desc)="([^"]+)"/g)].map((m) => m[1]).filter((t) => t.trim());
      console.log(`  on screen: ${texts.slice(0, 25).join(' | ') || 'no text'}`);
    }
  }
  const result = feed ? await evaluate(feed.page, FEED_CHECKS, 60000) : null;
  if (!result) {
    console.error('The feed didn\'t load after signing in.');
    report('failed: the feed didn\'t load after signing in');
    return 2;
  }
  console.log('Feed:', JSON.stringify(result));

  const failures = [];
  const expect = (ok, msg) => { if (!ok) failures.push(msg); };
  expect(result.bridge, 'The patches\' JavaScript bridge is missing.');
  expect(result.feedItems >= 3, 'The feed has fewer than 3 items.');
  expect(result.askBoxVisible === 0, 'The ask box still shows (Hide ask box).');
  expect(result.shareBars > 0, 'No Share buttons in the feed (Quora may have renamed them).');
  expect(result.copyButtons > 0, 'No Copy buttons in the feed (Copy answer text).');
  expect(result.shareTextButtons > 0, 'No Share text buttons in the feed (Share answer text).');
  expect(result.mostCopiesInOneBar <= 1, 'A Share bar has more than one Copy button.');
  expect(result.promotedVisible === 0, 'A promoted item still shows (Remove ads).');
  expect(result.bookmarkStore === true, 'Saving and removing a bookmark through the bridge didn\'t work.');

  // Quora opens answers only on a real tap: tap the first answer's question title, then its text.
  let opened = null;
  const tried = [];
  for (const target of ['.puppeteer_test_question_title', '.puppeteer_test_answer_content']) {
    const spot = await evaluate(feed.page, spotScript(target));
    const view = spot && webViewBounds();
    if (!spot || !view) {
      tried.push(`${target}: not on screen`);
      continue;
    }
    const x = Math.round(view.l + spot.x * spot.dpr);
    const y = Math.round(view.t + spot.y * spot.dpr);
    adb('shell', 'input', 'tap', String(x), String(y));
    opened = await waitFor(IS_ANSWER, 30);
    if (opened) break;
    const now = (await pages()).map((p) => p.url.split('?')[0]);
    tried.push(`${target}: tapped ${x},${y} in a WebView at ${view.l},${view.t}; pages then: ${JSON.stringify(now)}`);
    // Back to the feed before the next try, if the tap opened something else.
    if (!(await waitFor(feedCount, 3))) adb('shell', 'input', 'keyevent', 'BACK');
    await sleep(2000);
  }
  if (opened) {
    const checks = await evaluate(opened.page, ANSWER_CHECKS);
    console.log('Answer page:', JSON.stringify(checks));
    expect(checks && checks.bookmarkButton > 0, 'No bookmark button on the answer page (Bookmarks).');
    expect(checks && checks.copyButtons > 0, 'No Copy button on the answer page.');
    adb('shell', 'input', 'keyevent', 'BACK');
  } else {
    // A failure, not a skip: otherwise the answer patches are never checked and the test still passes.
    for (const line of tried) console.log(`  ${line}`);
    expect(false, 'No answer opened from the feed, so the answer page wasn\'t checked (the taps are listed above).');
  }

  if (failures.length) {
    for (const f of failures) console.log(`::error title=Feed test::${f}`);
    report(`failed: ${failures.join(' ')}`);
    return 1;
  }
  console.log('Every feed check passed.');
  report('passed');
  return 0;
}

const code = await main();
if (process.env.FEED_TEST_RESULT) writeFileSync(process.env.FEED_TEST_RESULT, `${outcome}\n`);
process.exit(code);
