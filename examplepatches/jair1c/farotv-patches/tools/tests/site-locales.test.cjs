const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { test } = require('node:test');
const docs = path.resolve(__dirname, '../../docs');
const files = fs.readdirSync(path.join(docs, 'locales')).filter(file => file.endsWith('.json'));
const catalogs = Object.fromEntries(files.map(file => [file.slice(0, -5), JSON.parse(fs.readFileSync(path.join(docs, 'locales', file), 'utf8'))]));
const keys = Object.keys(catalogs.en).sort();
const html = fs.readFileSync(path.join(docs, 'index.html'), 'utf8');
const tokens = text => [...text.matchAll(/\{([a-zA-Z0-9_]+)\}/g)].map(match => match[1]).sort();
test('all ten website catalogs have complete keys, placeholders and safe formatting', () => {
    assert.equal(files.length, 10);
    for (const [locale, catalog] of Object.entries(catalogs)) {
        assert.deepEqual(Object.keys(catalog).sort(), keys, locale);
        for (const [key, value] of Object.entries(catalog)) {
            assert.ok(typeof value === 'string' && value.trim(), locale + '/' + key);
            assert.deepEqual(tokens(value), tokens(catalogs.en[key]), locale + '/' + key);
            for (const tag of value.matchAll(/<\/?([a-zA-Z0-9]+)\b/g)) {
                assert.ok(['a', 'b', 'span', 'code', 'br'].includes(tag[1]), locale + '/' + key);
            }
            assert.ok(!/\bon[a-z]+\s*=|javascript:/i.test(value), locale + '/' + key);
        }
    }
});
test('every translated page element has an English and Spanish entry', () => {
    for (const match of html.matchAll(/data-i18n(?:-aria|-alt)?="([^"]+)"/g)) {
        assert.ok(catalogs.en[match[1]], match[1]);
        assert.ok(catalogs.es[match[1]], match[1]);
    }
    for (const match of html.matchAll(/<option[^>]+value="([^"]+)"/g)) assert.ok(catalogs[match[1]], match[1]);
});
