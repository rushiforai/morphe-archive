// Illustrations for the switches of our settings section, in the style of YouTube TV's own setting
// pictures (cyan, red, yellow and teal shapes on the dark background).
// A setting thumbnail must be an http(s) image (a data: URL is not drawn), so runtime.js gives each
// switch a gstatic picture with "?farotv=<icon>" appended, and a constructed stylesheet replaces
// that picture with the SVG below. Sub-switches use their feature's icon unless they have their own.
(function () {
    if (!window.youtv || !youtv.setIcons) return;

    var C = "#0598C9", L = "#3FD3FF", R = "#FF4E45", Y = "#FFE27A", T = "#19E3B1", W = "#F1F1F1";
    var STROKE = ' fill="none" stroke-linecap="round" stroke-linejoin="round" ';

    function doodle(x, y, color) {
        return '<path d="M' + x + ' ' + y + ' c4 -6 8 6 12 0 s8 6 12 0 s8 6 12 0"' + STROKE + 'stroke="' + color + '" stroke-width="3"/>';
    }
    function star(x, y, color) {
        return '<path d="M' + x + ' ' + (y - 7) + ' V' + (y + 7) + ' M' + (x - 7) + ' ' + y + ' H' + (x + 7) +
            ' M' + (x - 5) + ' ' + (y - 5) + ' L' + (x + 5) + ' ' + (y + 5) + ' M' + (x + 5) + ' ' + (y - 5) +
            ' L' + (x - 5) + ' ' + (y + 5) + '"' + STROKE + 'stroke="' + color + '" stroke-width="2.5"/>';
    }
    function slash(x1, y1, x2, y2) {
        return '<path d="M' + x1 + ' ' + y1 + ' L' + x2 + ' ' + y2 + '"' + STROKE + 'stroke="' + R + '" stroke-width="10"/>' +
            '<path d="M' + x1 + ' ' + y1 + ' L' + (x1 + (x2 - x1) * 0.18) + ' ' + (y1 + (y2 - y1) * 0.18) + '"' + STROKE + 'stroke="' + Y + '" stroke-width="10"/>';
    }

    var ICONS = {
        // "AD" badge, crossed out.
        ads: '<rect x="30" y="22" width="84" height="60" rx="14" fill="' + C + '"/>' +
            '<text x="72" y="64" text-anchor="middle" font-family="Roboto, Arial, sans-serif" font-weight="700" font-size="30" fill="' + W + '">AD</text>' +
            slash(26, 18, 118, 88) + star(126, 20, L) + doodle(20, 96, R),
        // Screen with a play button and two sliders.
        player: '<rect x="24" y="16" width="96" height="62" rx="10" fill="' + C + '"/>' +
            '<path d="M64 33 L84 47 L64 61 Z" fill="' + Y + '"/>' +
            '<path d="M30 90 H114 M30 100 H114"' + STROKE + 'stroke="' + L + '" stroke-width="4"/>' +
            '<circle cx="56" cy="90" r="6" fill="' + T + '"/><circle cx="94" cy="100" r="6" fill="' + R + '"/>' + star(128, 14, L),
        // Row of video tiles, the last ones hidden.
        related: '<rect x="14" y="34" width="36" height="26" rx="5" fill="' + C + '"/>' +
            '<rect x="54" y="34" width="36" height="26" rx="5" fill="' + T + '"/>' +
            '<rect x="94" y="34" width="36" height="26" rx="5" fill="' + Y + '"/>' +
            '<path d="M14 72 H50 M54 72 H90 M94 72 H130"' + STROKE + 'stroke="' + L + '" stroke-width="4"/>' +
            slash(40, 18, 104, 90) + doodle(98, 98, R),
        // Crown, crossed out.
        premium: '<path d="M34 76 L28 34 L52 52 L72 24 L92 52 L116 34 L110 76 Z" fill="' + Y + '"/>' +
            '<rect x="34" y="80" width="76" height="10" rx="4" fill="' + C + '"/>' +
            '<circle cx="72" cy="58" r="7" fill="' + C + '"/>' + slash(28, 20, 116, 92) + star(22, 18, L),
        // Vertical phone video, crossed out.
        shorts: '<rect x="50" y="12" width="44" height="80" rx="10" fill="' + C + '"/>' +
            '<path d="M66 40 L82 52 L66 64 Z" fill="' + Y + '"/>' +
            '<path d="M102 30 c10 6 10 30 0 44"' + STROKE + 'stroke="' + T + '" stroke-width="4"/>' +
            slash(36, 20, 108, 88) + doodle(14, 96, R),
        // Topic chips.
        topics: '<rect x="18" y="20" width="58" height="22" rx="11" fill="' + C + '"/>' +
            '<rect x="82" y="20" width="44" height="22" rx="11" fill="' + T + '"/>' +
            '<rect x="30" y="50" width="44" height="22" rx="11" fill="' + Y + '"/>' +
            '<rect x="80" y="50" width="34" height="22" rx="11" fill="' + L + '"/>' +
            slash(20, 82, 124, 14) + doodle(50, 96, R),
        // Progress bar with a segment jumped over.
        sponsorblock: '<path d="M18 74 H126"' + STROKE + 'stroke="' + L + '" stroke-width="6"/>' +
            '<path d="M52 74 H92"' + STROKE + 'stroke="' + R + '" stroke-width="10"/>' +
            '<path d="M40 52 C52 18 92 18 104 52"' + STROKE + 'stroke="' + Y + '" stroke-width="5"/>' +
            '<path d="M96 46 L104 54 L112 44"' + STROKE + 'stroke="' + Y + '" stroke-width="5"/>' +
            '<circle cx="40" cy="74" r="8" fill="' + T + '"/><circle cx="104" cy="74" r="8" fill="' + T + '"/>' + star(126, 22, L),
        // Thumb down with a counter.
        ryd: '<path d="M44 24 H86 C94 24 98 28 99 34 L104 62 C105 68 101 72 95 72 H76 L80 88 C81 94 77 98 72 96 L54 72 H44 Z" fill="' + C + '"/>' +
            '<rect x="24" y="22" width="16" height="50" rx="4" fill="' + L + '"/>' +
            '<rect x="100" y="78" width="34" height="20" rx="10" fill="' + Y + '"/>' +
            '<path d="M108 88 H126"' + STROKE + 'stroke="' + C + '" stroke-width="4"/>' + doodle(12, 96, R) + star(120, 18, T)
    };

    // Author picture for Settings > Acerca de: the black cat, in a FaroTV amber ring.
    function eye(cx, flip) {
        var s = flip ? -1 : 1;
        // Lid slanted down towards the nose (inner side, -x before flipping): an annoyed look.
        return '<g transform="translate(' + cx + ' 50) scale(' + (0.78 * s) + ' 0.78)">' +
            '<ellipse cx="0" cy="2" rx="14" ry="11" fill="#FFFFFF"/>' +
            '<circle cx="-3" cy="5" r="6" fill="#000"/><circle cx="-1" cy="3" r="1.8" fill="#FFF"/>' +
            '<path d="M-18 4 L18 -6 L18 -14 L-18 -14 Z" fill="#000"/></g>';
    }
    ICONS.creator = '<circle cx="72" cy="54" r="49" fill="#FFB43A"/>' +
        '<circle cx="72" cy="54" r="44.5" fill="#1b1b1b"/><circle cx="72" cy="54" r="43" fill="#000"/>' +
        eye(57, true) + eye(87, false);

    function url(name) {
        return "data:image/svg+xml," + encodeURIComponent(
            '<svg xmlns="http://www.w3.org/2000/svg" viewBox="' + (name === "creator" ? "21 3 102 102" : "0 0 144 108") + '">' +
            ICONS[name] + '</svg>');
    }

    var rules = Object.keys(ICONS).map(function (name) {
        return '[style*="farotv=' + name + '"] { background-image: url("' + url(name) + '") !important;' +
            " background-size: contain !important; background-repeat: no-repeat !important;" +
            " background-position: center !important; background-color: transparent !important; }";
    });
    try {
        var sheet = new CSSStyleSheet();
        sheet.replaceSync(rules.join("\n"));
        document.adoptedStyleSheets = document.adoptedStyleSheets.concat([sheet]);
    } catch (e) {
        youtv.report("icons failed: " + e);
    }
    youtv.setIcons({
        ads: "ads", player: "player", "player.related": "related", "premium-promos": "premium",
        shorts: "shorts", topics: "topics", sponsorblock: "sponsorblock", ryd: "ryd"
    });
    // For the preview page (branding/icons-preview.html).
    youtv.iconUrls = Object.keys(ICONS).map(url);
})();
