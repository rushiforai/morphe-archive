// Shared synchronous pass for response filters. Mutate before YouTube consumes the result.
(function () {
    if (!window.youtv || youtv.applyTreeFilters) return;
    youtv.applyTreeFilters = function (response, filters) {
        var visited = 0;
        var itemFilters = filters.filter(function (f) { return !!f.rule.item; });
        var keyFilters = filters.filter(function (f) { return !!f.rule.key; });
        function walk(node, depth) {
            if (!node || typeof node !== "object" || depth > 30) return;
            visited++;
            if (Array.isArray(node)) {
                var write = 0;
                for (var read = 0; read < node.length; read++) {
                    var item = node[read];
                    var remove = false;
                    for (var f = 0; f < itemFilters.length; f++) {
                        if (itemFilters[f].rule.item(item)) {
                            itemFilters[f].removed++; remove = true; break;
                        }
                    }
                    if (remove) continue;
                    if (item && typeof item === "object") walk(item, depth + 1);
                    if (write !== read) {
                        if (read in node) node[write] = item;
                        else delete node[write];
                    }
                    write++;
                }
                if (write !== node.length) node.length = write;
                return;
            }
            for (var key in node) {
                if (!Object.prototype.hasOwnProperty.call(node, key)) continue;
                var remove = false;
                for (var f = 0; f < keyFilters.length; f++) {
                    if (keyFilters[f].rule.key(key)) {
                        delete node[key]; keyFilters[f].removed++; remove = true; break;
                    }
                }
                if (!remove) {
                    var child = node[key];
                    if (child && typeof child === "object") walk(child, depth + 1);
                }
            }
        }
        walk(response, 0);
        return visited;
    };
})();
