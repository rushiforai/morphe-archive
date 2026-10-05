(function (runtime) {
    'use strict';
    function safeURL(url) {
        return typeof url === 'string' && url.length < 512 &&
            /^https:\/\/(cdn\.betterttv\.net|cdn\.7tv\.(app|io))\/[A-Za-z0-9_./-]+$/.test(url);
    }
    function parse(provider, data, channel) {
        var result = new Map();
        var values = provider === 'bttv' ? (channel ?
            [].concat(data.sharedEmotes || [], data.channelEmotes || []) : data) :
            ((channel ? data.emote_set : data) || {}).emotes;
        if (!Array.isArray(values)) return result;
        values.slice(0, 2000).forEach(function (item) {
            if (!item || typeof item !== 'object') return;
            var name = provider === 'bttv' ? item.code : item.name;
            if (typeof name !== 'string' || !name.length || name.length > 100 || /\s/.test(name)) return;
            var url, staticURL, ratio = 1, format = 'webp';
            if (provider === 'bttv') {
                if (typeof item.id !== 'string' || !/^[A-Za-z0-9]+$/.test(item.id)) return;
                url = 'https://cdn.betterttv.net/emote/' + item.id + '/2x';
                staticURL = url;
                format = item.imageType === 'gif' ? 'gif' : 'png';
            } else {
                var host = item.data && item.data.host;
                if (!host || typeof host.url !== 'string' || !Array.isArray(host.files)) return;
                var gif = item.data.animated === true && host.files.find(function (value) { return value && value.name === '2x.gif'; });
                var file = gif || host.files.find(function (value) { return value && value.name === '2x.webp'; });
                if (!file) return;
                var base = host.url.indexOf('//') === 0 ? 'https:' + host.url : host.url;
                format = gif ? 'gif' : 'webp';
                // Use GIF: bundled Fresco lacks animated WebP decoding.
                var fileName = !gif && item.data.animated === true ? file.static_name : file.name;
                if (typeof fileName !== 'string') return;
                url = base + '/' + fileName;
                staticURL = typeof file.static_name === 'string' ? base + '/' + file.static_name : url;
                if (file.height > 0 && file.width > 0) ratio = Math.min(4, Math.max(0.25, file.width / file.height));
            }
            if (!safeURL(url) || !safeURL(staticURL)) return;
            result.set(name, {name: name, channel: channel === true, url: url, staticURL: staticURL,
                ratio: ratio, provider: provider, format: format});
        });
        return result;
    }
    // Unicode code-point offsets; end is inclusive.
    function augment(body, nativeEmotes, catalog, failed) {
        if (typeof body !== 'string' || body.length > 8192 || !Array.isArray(nativeEmotes)) return nativeEmotes;
        var points = Array.from(body), additions = [], index = 0;
        while (index < points.length && additions.length < 32) {
            if (/[\s\u2066-\u2069]/.test(points[index])) { index++; continue; }
            var start = index;
            while (index < points.length && !/[\s\u2066-\u2069]/.test(points[index])) index++;
            var code = points.slice(start, index).join(''), emote = catalog.get(code);
            if (!emote || failed.has(emote.url) || nativeEmotes.some(function (value) {
                return value.start < index && value.end >= start;
            })) continue;
            additions.push({id: 'twitchpatches:' + encodeURIComponent(JSON.stringify(emote)), start: start, end: index - 1});
        }
        return additions.length ? nativeEmotes.concat(additions) : nativeEmotes;
    }
    runtime.emoteProviders = {parse: parse, augment: augment, safeURL: safeURL};
})(globalThis.__twitchPatchRuntime);
