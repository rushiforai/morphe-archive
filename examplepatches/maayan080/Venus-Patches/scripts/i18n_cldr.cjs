// Fills in, for every Venus language file, the texts the Unicode CLDR data (Node's Intl) already has right:
// language names ("Translated from Spanish"), time units in their "... ago" form with every plural form, "ago",
// and "and". A hand-made fix in scripts/i18n_overrides/<code>.json always wins.
// Developer-only: node scripts/i18n_cldr.cjs   (after hand-reviewed translations are loaded)
const fs = require('node:fs'), path = require('node:path');
const ROOT = path.join(__dirname, '..'), FOLDER = path.join(ROOT, 'patches/src/main/resources/venus/i18n');
const source = fs.readFileSync(path.join(ROOT, 'patches/src/main/resources/venus/bootstrap.js'), 'utf8');
// LANGUAGE_NAMES in bootstrap.js: English name -> code.
const NAMES = {};
for (const m of /const LANGUAGE_NAMES = \{([\s\S]*?)\};/.exec(source)[1].matchAll(/(\w+):"([^"]+)"/g)) if (!NAMES[m[2]]) NAMES[m[2]] = m[1];
// The plural forms each language file uses, matching pluralKind() in bootstrap.js.
const FORMS = {};
'bg da de el es fi hu it nl no sv tr fr pt-BR hi'.split(' ').forEach(c => FORMS[c] = ['one', 'other']);
'ja ko zh-CN zh-TW th vi id'.split(' ').forEach(c => FORMS[c] = ['other']);
'ru uk pl'.split(' ').forEach(c => FORMS[c] = ['one', 'few', 'many']);
'hr cs lt ro'.split(' ').forEach(c => FORMS[c] = ['one', 'few', 'other']);
const SAMPLE = {one: 1, few: 2, many: 5}, OTHER = {cs: 5, hr: 5, lt: 10, ro: 20};
const JUST_NOW = {bg:'току-що', cs:'právě teď', da:'lige nu', de:'gerade eben', el:'μόλις τώρα', es:'justo ahora', fi:'juuri nyt', fr:'à l’instant',
    hi:'अभी-अभी', hr:'upravo sada', hu:'épp most', id:'baru saja', it:'proprio ora', ja:'たった今', ko:'방금', lt:'ką tik', nl:'zojuist', no:'akkurat nå',
    pl:'przed chwilą', 'pt-BR':'agora mesmo', ro:'chiar acum', ru:'только что', sv:'just nu', th:'เมื่อสักครู่', tr:'az önce', uk:'щойно', vi:'vừa xong',
    'zh-CN':'刚刚', 'zh-TW':'剛剛'};
// "and" between two parts: CLDR's list pattern, except where it only has a comma.
const AND = {ja:'と', ko:'및', 'zh-CN':'和', 'zh-TW':'和'};
// Units CLDR words differently from everyday speech ("døgn" for days in Norwegian).
const UNIT_FIX = {no: {day: ['{n} dag', '{n} dager']}};
const PLAIN_AGO = {th: '{time}ที่ผ่านมา', ja: '{time}前', 'zh-CN': '{time}前', 'zh-TW': '{time}前'};
const norm = text => text.replace(/[\u00a0\u202f]/g, ' ');
for (const code of Object.keys(FORMS)) {
    const file = path.join(FOLDER, code + '.json');
    if (!fs.existsSync(file)) continue;
    const pack = JSON.parse(fs.readFileSync(file, 'utf8'));
    const overridesFile = path.join(ROOT, 'scripts/i18n_overrides', code + '.json');
    const overrides = fs.existsSync(overridesFile) ? JSON.parse(fs.readFileSync(overridesFile, 'utf8')) : {};
    const locale = code === 'no' ? 'nb' : code, forms = FORMS[code], out = {};
    const names = new Intl.DisplayNames([locale], {type: 'language'});
    for (const [english, iso] of Object.entries(NAMES)) out[english] = names.of(iso);
    const rtf = new Intl.RelativeTimeFormat(locale, {numeric: 'always'});
    // The words every "N units ago" shares ("vor ", " назад"), whole words only.
    const all = [];
    for (const unit of ['year', 'month', 'day', 'hour', 'minute', 'second']) for (const n of [1, 2, 3, 5, 11, 21, 22, 25, 100]) all.push(norm(rtf.format(-n, unit)));
    let pre = all[0], suf = all[0];
    for (const text of all) { while (!text.startsWith(pre)) pre = pre.slice(0, -1); while (!text.endsWith(suf)) suf = suf.slice(1); }
    pre = pre.includes(' ') ? pre.slice(0, pre.lastIndexOf(' ') + 1) : '';
    suf = suf.includes(' ') ? suf.slice(suf.indexOf(' ')) : '';
    // Thai, Japanese and Chinese put "ago" on every unit with no space: their units are the plain ones,
    // so "8 days, 7 hours and 7 minutes ago" says "ago" once.
    const plainUnits = PLAIN_AGO[code] !== undefined;
    const sample = kind => kind === 'other' ? OTHER[code] || 5 : SAMPLE[kind];
    const make = fn => { const o = {}; for (const kind of forms) { const n = sample(kind), text = norm(fn(n)); if (text.split(String(n)).length !== 2) throw new Error(code + ': ' + text); o[kind] = text.replace(String(n), '{n}'); } return o; };
    const put = (plural, singular, fn) => { const o = make(fn); out[singular] = o.one || o.other; out[plural] = forms.length <= 2 ? o.other : o; };
    for (const unit of ['year', 'month', 'day', 'hour', 'minute']) {
        put('{n} ' + unit + 's', '{n} ' + unit, plainUnits ? n => new Intl.NumberFormat(locale, {style: 'unit', unit, unitDisplay: 'long'}).format(n) :
            n => { const text = norm(rtf.format(-n, unit)); return text.slice(pre.length, text.length - suf.length); });
        const fix = UNIT_FIX[code] && UNIT_FIX[code][unit];
        if (fix) { out['{n} ' + unit] = fix[0]; out['{n} ' + unit + 's'] = fix[1]; }
    }
    put('{n} seconds ago', '{n} second ago', n => rtf.format(-n, 'second'));
    out['{time} ago'] = plainUnits ? PLAIN_AGO[code] : pre + '{time}' + suf;
    out['just now'] = JUST_NOW[code];
    out['and'] = AND[code] || norm(new Intl.ListFormat(locale, {type: 'conjunction'}).format(['A', 'B'])).replace(/^A\s*/, '').replace(/\s*B$/, '');
    let changed = 0;
    for (const [english, value] of Object.entries(out)) {
        if (value === undefined || english in overrides) continue;
        if (JSON.stringify(pack.strings[english]) !== JSON.stringify(value)) { pack.strings[english] = value; changed++; }
    }
    fs.writeFileSync(file, JSON.stringify(pack, null, 1) + '\n');
    console.log(code, changed, 'from CLDR');
}
