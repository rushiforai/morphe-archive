"""Exercise the actual Java URL/bootstrap policy without an Android runtime."""
import json
import re
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
POLICY = ROOT / 'extensions/atv/src/main/java/patches/atv/KijkPolicy.java'


class AtvPolicyTests(unittest.TestCase):
    def test_request_policy_and_early_bootstrap_keep_functional_content(self):
        self.assertTrue(POLICY.is_file(), 'KIJK ATV policy is not implemented')
        with tempfile.TemporaryDirectory() as temporary:
            out = Path(temporary)
            harness = out / 'AtvPolicyProbe.java'
            harness.write_text('''
import patches.atv.KijkPolicy;
public class AtvPolicyProbe {
  static void check(boolean value) { if (!value) throw new AssertionError(); }
  public static void main(String[] args) throws Exception {
    check(KijkPolicy.action("https://7b936.v.fwmrm.net/ad/g/1?resp=vmap1", true, false)==1);
    check(KijkPolicy.action("https://7b936.v.fwmrm.net/ad/g/1", false, true)==0);
    check(KijkPolicy.action("https://api.id5-sync.com/gc/v1", false, true)==3);
    check(KijkPolicy.action("https://static.kijk.nl/prod/js/tva.min.js", false, true)==2);
    check(KijkPolicy.action("https://cdn.cookielaw.org/scripttemplates/otSDKStub.js", true, true)==0);
    for(String url: new String[]{"https://api.prd.video.talpa.network/graphql",
        "https://prd.pvx.talpa.network/media/token", "https://da.auth.talpa.network/oauth/token",
        "https://static.kijk.nl/features-smarttv.json", "https://cdn.media.test/movie.mpd",
        "https://api.id5-sync.com.evil.test/gc/v1", "https://evil.test/?next=api.id5-sync.com",
        "https://id5-sync.com@content.test/video", "not a URL"})
      check(KijkPolicy.action(url,true,true)==0);
    String html="<html><script>window.__env = {ADS_ENABLED:true,ID5_ENABLED:true,CONVIVA_CUSTOMER_KEY:'publisher',AUTH_ENDPOINT:'auth'};window.__build={package:'test'};window.process={env:{}}</script><script src='player.js'></script></html>";
    String rewritten=KijkPolicy.rewriteHtml(html,true,true);
    check(rewritten.indexOf("__morpheAtv") > rewritten.indexOf("window.__build"));
    check(rewritten.indexOf("__morpheAtv") < rewritten.indexOf("src='player.js'"));
    check(KijkPolicy.rewriteHtml(rewritten,true,true).equals(rewritten));
    check(KijkPolicy.rewriteHtml("<html>unrecognized</html>",true,true).equals("<html>unrecognized</html>"));
    check(KijkPolicy.rewriteHtml(html,false,false).equals(html));
    String js="var N=[];i&&i.adConfig&&!i.adConfig.disableAds&&(N.push('ad'));player.source={sources:[source],ads:N.length?N:void 0};";
    String patched=KijkPolicy.rewriteScript("https://prd.smarttv.talpavideo.nl/android/assets/theo-player-legacy-test.js",js,true,false);
    check(!patched.equals(js));
    check(patched.contains("player.source={sources:[source]"));
    check(KijkPolicy.rewriteScript("https://content.test/player.js",js,true,false).equals(js));
    System.out.print(rewritten);
  }
}''')
            subprocess.run(['javac', '-d', str(out), str(POLICY), str(harness)], check=True, capture_output=True)
            result = subprocess.run(['java', '-cp', str(out), 'AtvPolicyProbe'], check=True, capture_output=True, text=True)
            script = re.findall(r'<script>(.*?)</script>', result.stdout, re.S)[0]
            node = r'''
const vm=require('node:vm'),assert=require('node:assert/strict');
let removed=[];
const window={__env:{ADS_ENABLED:true,ID5_ENABLED:true,CONVIVA_CUSTOMER_KEY:'publisher',AUTH_ENDPOINT:'auth'},
localStorage:{removeItem(k){removed.push(k)}}};
const styles=[];const document={createElement(){return {}},head:{appendChild(x){styles.push(x)}},getElementById(){return null}};
let registrations=[],unregistered=[];
const worker=(key,state,url)=>({[state]:{scriptURL:url},unregister(){unregistered.push(key);return Promise.resolve(true)}});
const navigator={serviceWorker:{register(url){registrations.push(url);return Promise.resolve('original')},
getRegistrations(){return Promise.resolve([
worker('owned-active','active','https://prd.smarttv.talpavideo.nl/android/sw.js'),
worker('owned-waiting','waiting','https://prd.smarttv.talpavideo.nl/android/sw.js?v=2'),
worker('other','active','https://other.test/sw.js')])}}};
vm.runInNewContext(SCRIPT,{window,document,navigator,URL,Promise});
assert.equal(window.__env.ADS_ENABLED,false);assert.equal(window.__env.ID5_ENABLED,false);
assert.equal(window.__env.CONVIVA_CUSTOMER_KEY,'');assert.equal(window.__env.AUTH_ENDPOINT,'auth');
window.__env.ADS_ENABLED=true;window.__env.ID5_ENABLED=true;
assert.equal(window.__env.ADS_ENABLED,false);assert.equal(window.__env.ID5_ENABLED,false);
for(let i=0;i<10000;i++)window.TVA.push(['view',{private:'data'}]);
assert.equal(window.TVA.length,0);assert.ok(removed.includes('ID5_CACHE_V1'));
assert.ok(styles[0].textContent.includes('.pause-ad-container'));
(async()=>{
await assert.rejects(navigator.serviceWorker.register('/android/sw.js'), /cache interception/);
await assert.rejects(navigator.serviceWorker.register('/android/sw.js?v=updated'), /cache interception/);
assert.equal(await navigator.serviceWorker.register('https://other.test/sw.js'),'original');
assert.deepEqual(registrations,['https://other.test/sw.js']);
assert.deepEqual(unregistered,['owned-active','owned-waiting']);
})().catch(e=>{console.error(e);process.exitCode=1});
'''.replace('SCRIPT', json.dumps(script))
            evaluated = subprocess.run(['node', '-e', node], capture_output=True, text=True)
            self.assertEqual(evaluated.returncode, 0, evaluated.stderr)


if __name__ == '__main__':
    unittest.main()
