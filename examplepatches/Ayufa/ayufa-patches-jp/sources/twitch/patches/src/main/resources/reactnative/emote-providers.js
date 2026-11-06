(function (runtime) {
    'use strict';
    function safeURL(url) {
        return typeof url === 'string' && url.length < 512 &&
            /^https:\/\/(cdn\.betterttv\.net|cdn\.7tv\.(app|io)|cdn\.frankerfacez\.com)\/[A-Za-z0-9_./-]+$/.test(url);
    }
    function ffzValues(data, channel) {
        var selected = channel ? (data.room ? [data.room.set] : []) : data.default_sets;
        if (!Array.isArray(selected) || !data.sets) return [];
        return selected.slice(0, 64).reduce(function (values, id) {
            var set = data.sets[String(id)];
            return values.concat(set && Array.isArray(set.emoticons) ? set.emoticons : []);
        }, []);
    }
    function ffzURL(urls, animated) {
        if (!urls || typeof urls !== 'object') return null;
        for (var size of (animated ? ['1', '2', '4'] : ['2', '1', '4'])) {
            var url = urls[size];
            if (typeof url !== 'string') continue;
            if (url.indexOf('//') === 0) url = 'https:' + url;
            if (safeURL(url) && url.indexOf('https://cdn.frankerfacez.com/') === 0) return url;
        }
        return null;
    }
    function sevenFile(files, extension) {
        return files.find(function (file) { return file && file.name === '2x.' + extension; }) ||
            files.find(function (file) { return file && new RegExp('^[1-4]x[.]' + extension + '$').test(file.name); });
    }
    function parse(provider, data, channel) {
        var result = new Map();
        var values = provider === 'ffz' ? ffzValues(data, channel) : provider === 'bttv' ? (channel ?
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
                format = item.animated === true || item.imageType === 'gif' ? 'gif' : 'webp';
                url = 'https://cdn.betterttv.net/emote/' + item.id + '/2x.' + format;
                staticURL = url;
            } else if (provider === 'ffz') {
                staticURL = ffzURL(item.urls);
                var animationURL = ffzURL(item.animated, true);
                url = animationURL ? animationURL + '.gif' : staticURL;
                format = animationURL ? 'gif' : 'png';
                if (item.width > 0 && item.height > 0) ratio = Math.min(4, Math.max(0.25, item.width / item.height));
            } else {
                var host = item.data && item.data.host;
                if (!host || typeof host.url !== 'string' || !Array.isArray(host.files)) return;
                var gif = item.data.animated === true && sevenFile(host.files, 'gif');
                var file = gif || sevenFile(host.files, 'webp');
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
