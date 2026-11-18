// Execute the shipped plugin selector before any plugin can block content.
'use strict';
const assert = require('node:assert/strict');
const fs = require('node:fs');
const vm = require('node:vm');
const path = require('node:path');
const [root, mode = 'original'] = process.argv.slice(2);
const text = fs.readFileSync(path.join(root, 'assets/jwplayer/jwplayer.js'), 'utf8');
const selectorStart = text.indexOf('k=function(e){var t=Object.assign({},e.plugins),n=');
const selectorEnd = text.indexOf(';let _=function(e,t)', selectorStart);
assert(selectorStart > 0 && selectorEnd > selectorStart, 'VI plugin selector boundary');
const bStart = text.lastIndexOf('B=function(e,t,n)', selectorStart);
const bEnd = text.indexOf(',k=function(e)', bStart);
const normalizerStart = text.indexOf('var r=function(e){var t=/\\/');
const normalizerEnd = text.indexOf(',u=function(e)', normalizerStart);
assert(normalizerStart > 0 && normalizerEnd > normalizerStart, 'VI actual plugin-name normalizer');
const normalize = vm.runInNewContext('(' + text.slice(normalizerStart + 6, normalizerEnd) + ')');
const context = {D: {A: () => () => true}, y: {
    dB: normalize,
    Gv: name => ['vast','googima','dai','jwpsrv','bidding','freewheel'].includes(name)
      ? 'https://ssl.p.jwpcdn.com/player/v/8.49.3/' + name + '.js' : undefined,
}};
context.B = vm.runInNewContext('(' + text.slice(bStart + 2, bEnd) + ')', context);
const select = vm.runInNewContext('(' + text.slice(selectorStart + 2, selectorEnd) + ')', context);
const ads = /^(vast|googima|imaPluginSdk|dai|daiPluginSdk|bidding|freewheel|ssai|cnx|jwx)$/i;
const isAd = name => ads.test(normalize(name));
const hideAds = mode === 'ads' || mode === 'tracking';
const tracking = mode === 'tracking';
for (const schedule of [{pre:{offset:'pre'}},{mid:{offset:12}},{post:{offset:'post'}},'https://ads.invalid/vmap.xml']) {
    for (const client of ['vast','googima','imaPluginSdk','dai','daiPluginSdk','freewheel','ssai']) {
        const input = {edition:'fixture', advertising:{client,schedule}, playlist:[{file:'https://content.invalid/video.mp4',adschedule:schedule}], plugins:{related:{}}};
        const result = select(input);
        assert.equal(Object.keys(result).some(isAd), !hideAds, 'VI schedule activated an ad plugin');
        assert(result.related, 'functional plugin lost');
        assert.equal(input.playlist[0].file, 'https://content.invalid/video.mp4');
    }
}
for (const key of ['vast','googima','imaPluginSdk','dai','daiPluginSdk','bidding','freewheel','ssai','cnx','jwx',
                   'https://remote.invalid/vast.js?v=1','https://remote.invalid/googima.js',
                   'https://remote.invalid/imaPluginSdk.js','https://remote.invalid/daiPluginSdk.js']) {
    const result = select({edition:'fixture',plugins:{[key]:{},related:{}},analytics:false});
    assert.equal(Object.keys(result).some(isAd), !hideAds, 'VI explicit plugin escaped filtering');
    assert(result.related);
}
for (const key of ['jwpsrv','jwpsrv-dnt','https://remote.invalid/jwpsrv.js','https://remote.invalid/jwpsrv-dnt.js']) {
    const result = select({edition:'fixture',plugins:{[key]:{},related:{}},analytics:false});
    assert.equal(Object.keys(result).some(k => normalize(k) === 'jwpsrv'), !tracking, 'VI analytics activation escaped filtering');
    assert(result.related);
}
console.log('PASS VI player selector:', mode, '(pre/mid/post/VMAP, explicit/remote plugins, functional retention)');
