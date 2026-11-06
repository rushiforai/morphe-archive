/*
 * md-math-preview.js
 *
 * TeX math support for Box's Markdown preview.
 *
 * Box renders Markdown previews with Showdown inside a WebView. This file
 * extracts TeX from the raw Markdown before Showdown sees it (otherwise
 * Showdown eats "_", "*", "\\" inside formulas), converts the Markdown, and
 * then replaces the placeholders with MathJax 3 SVG output.
 *
 * MathJax is bundled next to this file (math/tex-svg.js), so no network access
 * is needed.
 */
(function (global) {
    'use strict';

    var PH_OPEN = '\uE000';
    var PH_CLOSE = '\uE001';
    var PH_RE = new RegExp(PH_OPEN + '(\\d+)' + PH_CLOSE, 'g');

    var MATHJAX_TIMEOUT_MS = 15000;
    var MATHJAX_MISSING_MS = 1500;
    var FENCE_CHARS = '`~';

    /* ------------------------------------------------------------------ *
     * Extraction of math from the raw Markdown
     * ------------------------------------------------------------------ */

    function isLineStart(text, index) {
        return index === 0 || text.charAt(index - 1) === '\n';
    }

    function isWhitespace(ch) {
        return ch === ' ' || ch === '\t' || ch === '\n' || ch === '\r';
    }

    function countRun(text, index, ch) {
        var end = index;

        while (text.charAt(end) === ch) end++;

        return end - index;
    }

    /** Copy the fenced code block that starts at index, or return -1. */
    function skipFence(text, index) {
        var marker = text.charAt(index);
        var size = countRun(text, index, marker);

        if (size < 3) return -1;

        var lineEnd = text.indexOf('\n', index);
        var from = lineEnd === -1 ? text.length : lineEnd + 1;

        while (from < text.length) {
            if (isLineStart(text, from) && text.charAt(from) === marker) {
                var closingSize = countRun(text, from, marker);

                if (closingSize >= size) {
                    var closingLineEnd = text.indexOf('\n', from);

                    return closingLineEnd === -1 ? text.length : closingLineEnd + 1;
                }
            }

            var next = text.indexOf('\n', from);

            if (next === -1) break;

            from = next + 1;
        }

        return text.length;
    }

    /** Copy the inline code span that starts at index, or return -1. */
    function skipCodeSpan(text, index) {
        var size = countRun(text, index, '`');
        var from = index + size;

        while (from < text.length) {
            var found = text.indexOf('`', from);

            if (found === -1) return -1;

            var closingSize = countRun(text, found, '`');

            if (closingSize === size) {
                return found + closingSize;
            }

            from = found + closingSize;
        }

        return -1;
    }

    /** Find the end of a delimited formula, or -1. */
    function findClosing(text, from, delimiter) {
        var found = text.indexOf(delimiter, from);

        return found === -1 ? -1 : found;
    }

    function extractMath(source) {
        var maths = [];
        var out = [];
        var i = 0;
        var n = source.length;

        function addMath(tex, display) {
            maths.push({ tex: tex, display: display });
            out.push(PH_OPEN + (maths.length - 1) + PH_CLOSE);
        }

        while (i < n) {
            var ch = source.charAt(i);

            // Fenced code block: copy as it is.
            if (FENCE_CHARS.indexOf(ch) !== -1 && isLineStart(source, i)) {
                var fenceEnd = skipFence(source, i);

                if (fenceEnd > i) {
                    out.push(source.slice(i, fenceEnd));
                    i = fenceEnd;
                    continue;
                }
            }

            // Inline code span: copy as it is.
            if (ch === '`') {
                var codeEnd = skipCodeSpan(source, i);

                if (codeEnd > i) {
                    out.push(source.slice(i, codeEnd));
                    i = codeEnd;
                    continue;
                }
            }

            // Escaped dollar sign: literal "$".
            if (ch === '\\' && source.charAt(i + 1) === '$') {
                out.push('$');
                i += 2;
                continue;
            }

            // Display math with $$ ... $$.
            if (ch === '$' && source.charAt(i + 1) === '$') {
                var displayEnd = findClosing(source, i + 2, '$$');

                if (displayEnd !== -1 && displayEnd > i + 2) {
                    addMath(source.slice(i + 2, displayEnd), true);
                    i = displayEnd + 2;
                    continue;
                }
            }

            // Display math with \[ ... \].
            if (ch === '\\' && source.charAt(i + 1) === '[') {
                var bracketEnd = findClosing(source, i + 2, '\\]');

                if (bracketEnd !== -1 && bracketEnd > i + 2) {
                    addMath(source.slice(i + 2, bracketEnd), true);
                    i = bracketEnd + 2;
                    continue;
                }
            }

            // Inline math with \( ... \).
            if (ch === '\\' && source.charAt(i + 1) === '(') {
                var parenEnd = findClosing(source, i + 2, '\\)');

                if (parenEnd !== -1 && parenEnd > i + 2) {
                    addMath(source.slice(i + 2, parenEnd), false);
                    i = parenEnd + 2;
                    continue;
                }
            }

            // Inline math with $ ... $, following the Pandoc/Obsidian rules:
            // no space right after the opening or before the closing dollar,
            // and the closing dollar must not be followed by a digit (so
            // "$5 and $10" stays text).
            if (ch === '$' && i + 1 < n && !isWhitespace(source.charAt(i + 1))) {
                var inlineEnd = -1;

                for (var k = i + 1; k < n; k++) {
                    var current = source.charAt(k);

                    if (current === '\n') break;

                    if (current === '$' && !isWhitespace(source.charAt(k - 1))) {
                        if (!/[0-9]/.test(source.charAt(k + 1))) {
                            inlineEnd = k;
                        }

                        break;
                    }
                }

                if (inlineEnd !== -1 && inlineEnd > i + 1) {
                    addMath(source.slice(i + 1, inlineEnd), false);
                    i = inlineEnd + 1;
                    continue;
                }
            }

            out.push(ch);
            i++;
        }

        return { text: out.join(''), maths: maths };
    }

    /* ------------------------------------------------------------------ *
     * Rendering
     * ------------------------------------------------------------------ */

    function errorNode(math) {
        var span = document.createElement('span');

        span.className = 'md-math-error';
        span.textContent = (math.display ? '$$' : '$') + math.tex + (math.display ? '$$' : '$');

        return span;
    }

    function buildMath(math) {
        var container;

        try {
            container = global.MathJax.tex2svg(math.tex, { display: math.display });
        } catch (error) {
            return errorNode(math);
        }

        // MathJax embeds an accessibility copy of the formula as MathML.
        // Remove it: if its hiding CSS ever fails to apply (as in Box's
        // WebView), the duplicate text shows up next to the SVG rendering.
        var assistive = container.querySelector('mjx-assistive-mml');

        if (assistive && assistive.parentNode) {
            assistive.parentNode.removeChild(assistive);
        }
    
        var wrapper = document.createElement(math.display ? 'div' : 'span');
    
        wrapper.className = math.display ? 'md-math-display' : 'md-math-inline';
        wrapper.appendChild(container);
    
        return wrapper;
    }

    function replaceInTextNode(textNode, maths) {
        var text = textNode.nodeValue;
        var fragment = document.createDocumentFragment();
        var last = 0;
        var match;

        PH_RE.lastIndex = 0;

        while ((match = PH_RE.exec(text)) !== null) {
            if (match.index > last) {
                fragment.appendChild(document.createTextNode(text.slice(last, match.index)));
            }

            var math = maths[Number(match[1])];

            if (math) {
                fragment.appendChild(buildMath(math));
            } else {
                fragment.appendChild(document.createTextNode(match[0]));
            }

            last = match.index + match[0].length;
        }

        if (last === 0) return;

        if (last < text.length) {
            fragment.appendChild(document.createTextNode(text.slice(last)));
        }

        textNode.parentNode.replaceChild(fragment, textNode);
    }

    /** Move display formulas out of the paragraph that holds nothing else. */
    function liftDisplayBlocks(root) {
        var blocks = root.querySelectorAll('div.md-math-display');

        for (var index = 0; index < blocks.length; index++) {
            var block = blocks[index];
            var parent = block.parentNode;

            if (!parent || parent.tagName !== 'P') continue;

            var onlyChild = true;

            for (var child = parent.firstChild; child; child = child.nextSibling) {
                if (child === block) continue;

                if (child.nodeType === 3 && child.nodeValue.trim() === '') continue;

                onlyChild = false;
                break;
            }

            if (onlyChild && parent.parentNode) {
                parent.parentNode.replaceChild(block, parent);
            }
        }
    }

    // Replace placeholders with the original TeX, for when MathJax never loads.
    function showSource(root, maths) {
        var nodes = [];
        var walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, null, false);
        var node;

        while ((node = walker.nextNode())) {
            if (node.nodeValue.indexOf(PH_OPEN) !== -1) nodes.push(node);
        }

        nodes.forEach(function (textNode) {
            var text = textNode.nodeValue.replace(PH_RE, function (whole, index) {
                var math = maths[Number(index)];

                if (!math) return whole;

                return (math.display ? '$$' : '$') + math.tex + (math.display ? '$$' : '$');
            });

            textNode.nodeValue = text;
        });
    }

    var mathJaxReady = false;
    var pendingRender = null;

    function waitForMathJax() {
        return new Promise(function (resolve) {
            var deadline = Date.now() + MATHJAX_TIMEOUT_MS;
            var missingDeadline = Date.now() + MATHJAX_MISSING_MS;

            function poll() {
                if (global.MathJax && global.MathJax.startup && global.MathJax.startup.promise) {
                    global.MathJax.startup.promise.then(
                        function () {
                            resolve(true);
                        },
                        function () {
                            resolve(false);
                        }
                    );

                    return;
                }

                // The script is loaded before this file, so if MathJax never
                // appears it failed to load: show the TeX source right away.
                var limit = global.MathJax ? deadline : missingDeadline;

                if (Date.now() > limit) {
                    resolve(false);

                    return;
                }

                setTimeout(poll, 30);
            }

            poll();
        });
    }

    function paint() {
        var job = pendingRender;

        if (!job) return;

        pendingRender = null;

        var extracted = extractMath(job.code);
        var converter = new global.Showdown.converter({
            extensions: ['github', 'table', 'twitter']
        });
        var result = document.getElementById('result');

        result.innerHTML = converter.makeHtml(extracted.text);

        if (mathJaxReady) {
            var walker = document.createTreeWalker(result, NodeFilter.SHOW_TEXT, null, false);
            var nodes = [];
            var node;

            while ((node = walker.nextNode())) {
                if (node.nodeValue.indexOf(PH_OPEN) !== -1) nodes.push(node);
            }

            nodes.forEach(function (textNode) {
                replaceInTextNode(textNode, extracted.maths);
            });

            liftDisplayBlocks(result);
        } else {
            showSource(result, extracted.maths);
        }

        if (job.lockSelection && typeof global.lockSelectionAndCallouts === 'function') {
            global.lockSelectionAndCallouts();
        }
    }

    function render(code, lockSelection) {
        pendingRender = { code: code, lockSelection: lockSelection };

        if (mathJaxReady) {
            paint();

            return;
        }

        waitForMathJax().then(function (ready) {
            mathJaxReady = ready;
            paint();
        });
    }

    global.MdMathPreview = {
        render: render,
        extractMath: extractMath
    };
})(window);
