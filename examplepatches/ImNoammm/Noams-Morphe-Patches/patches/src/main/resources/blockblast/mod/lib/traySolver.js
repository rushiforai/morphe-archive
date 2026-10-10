// Three-piece Classic solver. BinaryConfig row masks use the leftmost cell as the high bit.
// Placements clear all completed rows and columns simultaneously, just like BlocksProducerTouch.
// The returned moves are a witness, not a suggestion that every order/placement will work.
(function () {
    function boardRows(board) {
        if (!Array.isArray(board) || board.length !== 8) return null;
        var rows = [];
        for (var r = 0; r < 8; r++) {
            if (!Array.isArray(board[r]) || board[r].length !== 8) return null;
            var bits = 0;
            for (var c = 0; c < 8; c++) {
                if (typeof board[r][c] !== 'number' || !isFinite(board[r][c])) return null;
                if (board[r][c] !== -1 && board[r][c] !== 10) bits |= 1 << (7 - c);
            }
            rows.push(bits);
        }
        return rows;
    }

    function placements(shape) {
        var result = [];
        if (!shape || !shape.shape || !(shape.width > 0 && shape.width <= 8 && shape.height > 0 && shape.height <= 8)) return result;
        for (var r = 0; r <= 8 - shape.height; r++) for (var c = 0; c <= 8 - shape.width; c++) {
            result.push({ row: r, col: c, bits: shape.shape.map(function (bits) { return bits << (8 - shape.width - c); }) });
        }
        return result;
    }

    function put(rows, p) {
        for (var r = 0; r < p.bits.length; r++) if (rows[p.row + r] & p.bits[r]) return null;
        var next = rows.slice(), cols = 255;
        for (r = 0; r < p.bits.length; r++) next[p.row + r] |= p.bits[r];
        for (r = 0; r < 8; r++) cols &= next[r];
        for (r = 0; r < 8; r++) next[r] = next[r] === 255 ? 0 : next[r] & ~cols;
        return next;
    }

    function search(rows, tray, shapes) {
        var options = tray.map(function (id) { return placements(shapes[id]); });
        var failed = Object.create(null);
        function visit(board, remaining) {
            if (!remaining.length) return [];
            var key = board.join(',') + '|' + remaining.map(function (i) { return tray[i]; }).sort().join(',');
            if (failed[key]) return null;
            var seen = {};
            for (var i = 0; i < remaining.length; i++) {
                var slot = remaining[i], id = tray[slot];
                if (seen[id]) continue;
                seen[id] = true;
                var rest = remaining.slice();
                rest.splice(i, 1);
                for (var j = 0; j < options[slot].length; j++) {
                    var p = options[slot][j], next = put(board, p);
                    if (!next) continue;
                    var tail = visit(next, rest);
                    if (tail) return [{ slot: slot, row: p.row, col: p.col }].concat(tail);
                }
            }
            failed[key] = true;
            return null;
        }
        return visit(rows, [0, 1, 2]);
    }

    function full(tray) {
        return Array.isArray(tray) && tray.length === 3 && tray.every(function (id) { return typeof id === 'number' && id > 0 && id % 1 === 0; });
    }

    bb.traySolver = {
        solve: function (board, tray, shapes) {
            var rows = boardRows(board);
            return rows && full(tray) ? search(rows, tray, shapes) : null;
        },
        repair: function (board, tray, shapes, random) {
            var rows = boardRows(board);
            if (!rows || !full(tray)) return null;
            var moves = search(rows, tray, shapes);
            if (moves) return { tray: tray.slice(), moves: moves, changed: false };

            // Construct a legal sequence, retaining original pieces where possible. Single cells belong to
            // the normal pool too: whenever any space remains they guarantee a next move. This is bounded
            // (three slots x the 51 normal shapes x at most 64 positions), never an unbounded random retry.
            random = random || Math.random;
            var pool = Object.keys(shapes).map(Number).filter(function (id) { return id >= 1 && id <= 51; });
            var result = [];
            moves = [];
            for (var slot = 0; slot < 3; slot++) {
                var candidates = pool.slice();
                for (var i = candidates.length - 1; i > 0; i--) {
                    var j = Math.floor(random() * (i + 1)), tmp = candidates[i];
                    candidates[i] = candidates[j]; candidates[j] = tmp;
                }
                candidates.unshift(tray[slot]);
                var found = false;
                for (i = 0; i < candidates.length && !found; i++) {
                    var options = placements(shapes[candidates[i]]), offset = Math.floor(random() * options.length);
                    for (j = 0; j < options.length; j++) {
                        var p = options[(j + offset) % options.length], next = put(rows, p);
                        if (!next) continue;
                        result.push(candidates[i]);
                        moves.push({ slot: slot, row: p.row, col: p.col });
                        rows = next;
                        found = true;
                        break;
                    }
                }
                if (!found) return null; // no physical placement exists; leave game-over handling to the game
            }
            return { tray: result, moves: moves, changed: true };
        },
    };
})();
