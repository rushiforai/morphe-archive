'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const resources = process.argv[2];
assert.ok(resources, 'Pass the patched resource directory.');
const web = path.join(resources, 'assets/public');
const scripts = fs.readdirSync(web).filter(file => file.endsWith('.js'));
for (const file of scripts) {
  new vm.Script(fs.readFileSync(path.join(web, file), 'utf8'), { filename: file });
}

const main = fs.readFileSync(path.join(web, 'main.cc733f880f9d5201.js'), 'utf8');
const adMethods = main.slice(main.indexOf('showAdMobAd(){'), main.indexOf('getAdId(){'));
const helperMethod = main.slice(main.indexOf('interstitialAllowed(){'), main.indexOf('presentAlert('));
const scheduled = [];
const app = { style: { marginBottom: '100px' } };
const context = {
  document: { querySelector(selector) { assert.equal(selector, 'ion-app'); return app; } },
  setTimeout(callback, delay) { scheduled.push({ callback, delay }); },
};
const User = vm.runInNewContext(`(class User { ${adMethods} })`, context);
const Helper = vm.runInNewContext(`(class Helper { ${helperMethod} })`, context);

(async () => {
  const user = new User();
  user.premium = false;
  user.consentMode = true;
  user.pushNotificationsDelayed = true;
  user.own_shipments_tracked = 1;
  let pushCalls = 0;
  user.initPushNotification = () => { pushCalls++; };
  await user.showAdMobAd();
  assert.equal(user.premium, false, 'Ad removal must not unlock premium.');
  assert.equal(user.consentMode, false);
  assert.equal(app.style.marginBottom, '0px');
  assert.equal(scheduled.length, 1, 'Delayed push initialization must be preserved.');
  assert.equal(scheduled[0].delay, 5000);
  scheduled[0].callback();
  assert.equal(pushCalls, 1);
  await user.showInterstitial();
  assert.equal(await new Helper().interstitialAllowed(100), false);

  user.pushNotificationsDelayed = false;
  await user.showAdMobAd();
  assert.equal(scheduled.length, 1, 'Do not initialize push when it was not delayed.');
  user.pushNotificationsDelayed = true;
  user.own_shipments_tracked = 0;
  await user.showAdMobAd();
  assert.equal(scheduled.length, 1, 'Do not initialize push without tracked shipments.');

  const html = fs.readFileSync(path.join(web, 'index.html'), 'utf8');
  assert.ok(!html.includes('cdns.symplr.de') && !html.includes('privacy-mgmt.com'));
  const inlineScripts = [...html.matchAll(/<script\b([^>]*)>([\s\S]*?)<\/script>/gi)]
    .filter(match => !/\bsrc\s*=/.test(match[1]));
  const htmlContext = {
    localStorage: { getItem() { return null; } },
    window: {},
    document: {
      createElement() { return {}; },
      documentElement: { appendChild() {} },
      body: { classList: { add() {} } },
    },
  };
  vm.createContext(htmlContext);
  inlineScripts.forEach(match => vm.runInContext(match[2], htmlContext));
  assert.equal(htmlContext.window.symplrScriptLoaded, false);
  assert.ok(html.includes('.horizontal-ad-space-dash'));
  assert.ok(html.includes('app-promo-slides'));
  assert.ok(html.includes('.buyPremium:not(.activateNotify)'));
  assert.ok(!html.includes('window.__con = true'), 'Do not fabricate advertising consent.');

  for (const file of ['347.a8a18d21f27b5a2d.js', '3589.f7f862dd6fc46c66.js']) {
    const source = fs.readFileSync(path.join(web, file), 'utf8');
    assert.ok(!source.includes('drinkcheck.de') && !source.includes('a-final.webp'));
    assert.equal((source.match(/data:image\/gif;base64/g) || []).length, 4);
  }
  console.log(`JavaScript syntax (${scripts.length} scripts), ad promises, push notification startup, and sponsor removal passed.`);
})().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
