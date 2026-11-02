/* Cordly media: offline regression checks with no external modules needed. */
const assert = require('node:assert/strict');
const fs = require('node:fs');
const source = fs.readFileSync('patches/src/main/resources/venus/bootstrap.js', 'utf8');
const extract = (begin, end) => {
    const start = source.indexOf('    ' + begin), stop = source.indexOf('    ' + end, start);
    assert.ok(start >= 0 && stop > start, 'source function ' + begin);
    return source.slice(start, stop);
};
const code = [
    extract('function serverIconUri(', 'function serverAcronym('),
    extract('function serverMediaUrl(', 'function serverMediaBinary('),
    extract('function serverMediaBinary(', 'async function serverMediaFetch('),
    extract('function serverMediaZip(', 'function serverGuildEmojis('),
    extract('function serverGuildEmojis(', 'async function serverDownloadItems(')
].join('\n');
const api = new Function('serverStore','serverCall', 'const SERVER_MEDIA_LIMIT=32*1024*1024; const SERVER_EDIT_ICON="venus-icon:"; const serverEdit={icons:new Map()}; const tr=(s)=>s; const serverDate=(ms)=>new Date(ms).toISOString().slice(0,10); const serverNumber=String; const serverVerification=(n)=>["None","Low","Medium","High","Highest"][n];\n' + code + '\nreturn {' +
    'serverMediaUrl,serverMediaBinary,serverMediaZip,serverGuildStickers,serverStickerUrl,serverStickerFormat,serverItemUrl,serverItemFormat,serverItemBadge,serverItemAnimated,serverGuildImage,serverBannerUri,serverSplashUri,serverDiscoverySplashUri,serverArtwork,serverSummary,serverMediaResults,serverEmojiCodes,serverMediaLinks};')(
    id => id === 6031 ? {st: [{id:'123456789012345678',name:'Test',format_type:3}]} : null,
    (store,fn) => fn === 'getStickersByGuildId' ? store.st : null
);
for (const n of [0,1,2,3,4,5,512,1025,65537]) {
    const src = Uint8Array.from({length:n}, (_,i) => (i*17+231)&255);
    assert.equal(api.serverMediaBinary(src), Buffer.from(src).toString('base64'), 'base64 '+n);
}
const entries=[{name:'static-123456789012345678.png',bytes:Uint8Array.of(137,80,78,71,0,255)},
    {name:'animated-123456789012345678.gif',bytes:Uint8Array.of(71,73,70,56,57,97,1,2)},
    {name:'lottie-123456789012345679.json',bytes:Uint8Array.of(123,34,97,34,58,49,125)}];
const zip=Buffer.from(api.serverMediaZip(entries));
assert.equal(zip.readUInt32LE(zip.length-22),0x06054b50);
assert.equal(zip.readUInt16LE(zip.length-22+10),entries.length);
assert.equal(zip.readUInt32LE(zip.length-22+12),entries.reduce((n,e)=>n+46+e.name.length,0));
const stickers=api.serverGuildStickers('456789012345678901');
assert.equal(stickers.length,1);
assert.equal(api.serverStickerUrl(stickers[0]),'https://cdn.discordapp.com/stickers/123456789012345678.json');
assert.equal(api.serverStickerFormat({format:2}), 'png');
assert.equal(api.serverStickerFormat({format:4}), 'gif');
assert.equal(api.serverStickerUrl({id:'123456789012345678',format:4}), 'https://media.discordapp.net/stickers/123456789012345678.gif');
assert.equal(api.serverItemBadge({format:3},'stickers'),'LOTTIE');
assert.equal(api.serverItemAnimated({format:2},'stickers'),true);
assert.equal(api.serverItemFormat({animated:true},'emojis'),'gif');
for (const url of [
    'https://cdn.discordapp.com/stickers/123456789012345678.json',
    'https://cdn.discordapp.com/emojis/123456789012345678.gif?size=128&quality=lossless',
    'https://media.discordapp.net/stickers/123456789012345678.gif',
    'https://cdn.discordapp.com/discovery-splashes/123456789012345678/aabbcc.png?size=1024',
]) assert.equal(api.serverMediaUrl(url),true, 'allow '+url);
for (const url of [
    'http://cdn.discordapp.com/stickers/123456789012345678.png',
    'https://evil.example/stickers/123456789012345678.json',
    'https://cdn.discordapp.com.evil.example/stickers/123456789012345678.png',
    'file:///etc/passwd',
]) assert.equal(api.serverMediaUrl(url),false, 'deny '+url);
const g={id:'123456789012345678',icon:'aa0011', banner:'a_abcd1234', splash:'000abc', discoverySplash:'001def'};
assert.match(api.serverBannerUri(g),/banners\/123456789012345678\/a_abcd1234\.gif/);
assert.match(api.serverSplashUri(g),/splashes\/123456789012345678\/000abc\.png/);
assert.match(api.serverDiscoverySplashUri(g),/discovery-splashes\/123456789012345678\/001def\.png/);
assert.equal(api.serverBannerUri({...g,banner:null}),null);
assert.deepEqual(api.serverArtwork(g).map(item => item.name),['icon','banner','invite-splash','discovery-splash']);
assert.equal(api.serverArtwork({...g,icon:null,banner:null,splash:null,discoverySplash:null}).length,0);
const media=[{id:'123456789012345678',name:'zebra',animated:true},{id:'123456789012345679',name:'Alpha',animated:false},
    {id:'123456789012345680',name:'beta',animated:true}];
assert.deepEqual(api.serverMediaResults(media,'emojis','','all',false).map(x=>x.name),['Alpha','beta','zebra']);
assert.deepEqual(api.serverMediaResults(media,'emojis','','all',true).map(x=>x.name),['zebra','beta','Alpha']);
assert.deepEqual(api.serverMediaResults(media,'emojis','','static',false).map(x=>x.name),['Alpha']);
assert.deepEqual(api.serverMediaResults(media,'emojis','','animated',false).map(x=>x.name),['beta','zebra']);
assert.deepEqual(api.serverMediaResults(media,'emojis','BE','all',false).map(x=>x.name),['beta']);
assert.equal(api.serverEmojiCodes(media.slice(0,2)), '<a:zebra:123456789012345678>\n<:Alpha:123456789012345679>');
assert.equal(api.serverMediaLinks(media.slice(0,2),'emojis').split('\n').length,2);
assert.ok(api.serverSummary({name:'Example',id:'123456789012345678',created:1740000000000,verification:2,
    members:100,online:10,channels:4,roles:3,emojis:5,stickers:2,boost:{level:1,boosts:5},
    joined:1740000000000,ownerId:'123456789012345678',vanity:'example'}).includes('Members: 100'));

assert.equal(fs.existsSync('patches/src/main/kotlin/app/venus/patches/BrandingPatches.kt'),false,
    'The actual Android app branding patch must be absent');
assert.equal(source.includes('const revision = "1.24.0"'),true);
console.log('Cordly media checks passed: ZIP, filters, sorting, emoji markup, server summaries/artwork, app identity.');
