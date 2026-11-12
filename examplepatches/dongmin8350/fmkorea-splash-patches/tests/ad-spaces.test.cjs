const assert = require('node:assert/strict');
const fs = require('node:fs');
const {JSDOM} = require('jsdom');

const script = fs.readFileSync('tests/ad-spaces.js', 'utf8').trim();
const kotlin = fs.readFileSync(
  'patches/src/main/kotlin/app/dongmin8350/patches/fmkorea/CollapseAdSpacesPatch.kt',
  'utf8'
);
assert.equal(
  kotlin.split('internal val FMKOREA_AD_SPACE_SCRIPT = """\n')[1].split('\n""".trimIndent()')[0],
  script
);

const wait = () => new Promise(resolve => setTimeout(resolve, 100));

(async () => {
  const dom = new JSDOM(`<html><head></head><body>
    <nav id="nav">Navigation</nav>

    <div id="spacer" style="display:block !important;visibility:hidden;height:80px;min-height:80px;margin:10px;padding:5px"></div>

    <div class="power_ad" id="class-ad">Advertisement</div>
    <div class="fmad_wrapper" id="fmad-wrapper">
      <div id="fmad_123"></div>
      <div id="fmad-spacer" class="slot" style="height:250px"></div>
    </div>
    <div class="adpost" id="adpost">Ad post</div>
    <ins class="adsbygoogle" id="adsbygoogle" style="height:100px">Google ad</ins>
    <div class="bd_mobile bd" id="ad-wrapper" style="margin:0px;padding:0px">
      <iframe id="ad-frame" src="https://ad.doubleclick.net/example"></iframe>
    </div>

    <div id="top-ad-shell" style="height:100px">
      <div id="top-ad-inner">
        <iframe id="top-loader-ad" src="https://loader.fmkorea.com/_loader/loader.php?slot=top"></iframe>
      </div>
    </div>
    <iframe id="adpage-frame" src="https://m.fmkorea.com/_adpage/top"></iframe>
    <iframe id="loader2-frame" src="https://loader2.fmkorea.com/_myphp/adpost/content_new.php"></iframe>

    <script></script>
    <div class="bd_mobile bd" id="mobile-ad-space" style="margin: 0px 5px; padding: 3px"></div>
    <section class="fmWidgetStyle2019 bd_mobile bd" id="widget-ad-space" style="margin: 2px; padding: 2px"></section>

    <div class="bd_mobile bd" id="normal-mobile" style="margin: 20px; padding: 12px">Real content</div>
    <div class="bd_mobile bd" id="comment-wrapper" style="margin:0;padding:0"><form action="./"><textarea></textarea></form></div>

    <div class="rd_ft" id="footer">
      <div id="footer-gap"></div>
      <div class="rd_vote" id="vote">Vote</div>
      <div class="footer_nav" id="footer-nav">Navigation</div>
    </div>

    <div id="post" style="height:80px"><p>Post body</p><video controls></video></div>
    <div id="comment" style="height:80px">Comment form<textarea></textarea></div>
    <div id="ordinary" style="height:80px"></div>
    <div id="hidden-ui" style="visibility:hidden;height:80px">Ordinary hidden UI</div>
  </body></html>`, {
    url: 'https://m.fmkorea.com/',
    runScripts: 'outside-only',
    pretendToBeVisual: true
  });

  const w = dom.window;
  const d = w.document;
  const observers = [];
  const NativeObserver = w.MutationObserver;
  w.MutationObserver = class extends NativeObserver {
    constructor(callback) {
      super(callback);
      observers.push(this);
    }
  };

  w.eval(script);
  await wait();

  assert.equal(typeof w._make_power_link_identifier, 'function', 'power-link factory replaced with noop');
  const assigned = function realPowerLinkFactory() {};
  w._make_power_link_identifier = assigned;
  assert.notEqual(w._make_power_link_identifier, assigned, 'later assignment cannot restore power-link factory');

  for (const id of [
    'spacer',
    'class-ad',
    'fmad-wrapper',
    'fmad-spacer',
    'adpost',
    'adsbygoogle',
    'ad-frame',
    'ad-wrapper',
    'top-loader-ad',
    'top-ad-inner',
    'top-ad-shell',
    'adpage-frame',
    'loader2-frame',
    'mobile-ad-space',
    'widget-ad-space',
    'footer-gap'
  ]) {
    assert.equal(w.getComputedStyle(d.getElementById(id)).display, 'none', id + ' must collapse');
  }

  assert.notEqual(w.getComputedStyle(d.getElementById('normal-mobile')).display, 'none');
  assert.notEqual(w.getComputedStyle(d.getElementById('comment-wrapper')).display, 'none');
  assert.notEqual(w.getComputedStyle(d.getElementById('vote')).display, 'none');
  assert.notEqual(w.getComputedStyle(d.getElementById('footer-nav')).display, 'none');

  for (const id of ['post', 'comment', 'ordinary', 'hidden-ui']) {
    assert.equal(d.getElementById(id).hasAttribute('data-dongmin-fmkorea-ad-space'), false, id);
  }
  assert.equal(d.querySelector('video').hasAttribute('controls'), true);

  const dynamic = d.createElement('div');
  dynamic.className = 'late_ad';
  dynamic.textContent = 'late ad';
  d.body.appendChild(dynamic);
  await wait();
  assert.equal(w.getComputedStyle(dynamic).display, 'none', 'late explicit ad must collapse');

  const dynamicSpacer = d.createElement('div');
  dynamicSpacer.style.cssText = 'visibility:hidden;height:120px;display:block!important';
  d.body.appendChild(dynamicSpacer);
  await wait();
  assert.equal(dynamicSpacer.style.display, 'none', 'late spacer must collapse');

  w.eval(script);
  assert.equal(d.querySelectorAll('#dongmin-fmkorea-ad-spaces-style-v134').length, 1, 'duplicate injection must be ignored');

  observers.forEach(observer => observer.disconnect());
  await wait();
  dom.window.close();

  const external = new JSDOM(
    '<div class="power_ad">Ad</div>',
    {url: 'https://fmkorea.com.example.org', runScripts: 'outside-only'}
  );
  external.window.eval(script);
  assert.notEqual(
    external.window.getComputedStyle(external.window.document.querySelector('.power_ad')).display,
    'none',
    'external domain excluded'
  );
  external.window.close();

  console.log('PASS: AdGuard-free ad removal, FMKorea top-loader ad collapse, mobile container collapse, power-link suppression, footer-gap cleanup, dynamic ads, protected content, and domain guard');
})().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
