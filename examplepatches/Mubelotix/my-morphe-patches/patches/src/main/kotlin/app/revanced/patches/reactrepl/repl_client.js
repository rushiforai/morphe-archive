(function() {
    // Capture original JSON.stringify to avoid infinite recursion if user hooks it
    const safeStringify = JSON.stringify;

    const SERVER_URL = 'REPLACED_BY_CODE';

    function serialize(obj) {
        if (typeof obj === 'function') {
            return obj.toString();
        } else if (obj === undefined) {
             return 'undefined';
        }
        try {
             let result = safeStringify(obj, null, 2);
             if (result === undefined) return String(obj);
             return result;
        } catch (e) {
             if (typeof obj === 'object' && obj !== null) {
                const type = obj.constructor ? obj.constructor.name : 'Object';
                const keys = Object.keys(obj);
                return `[${type}] (Circular/Complex)\nKeys: ${keys.join(', ')}`;
             } else {
                return String(obj);
             }
        }
    }

    function connect() {
        console.log('REPL: Connecting to ' + SERVER_URL);
        try {
            const ws = new WebSocket(SERVER_URL);

            // Expose log function globally
            window.replLog = function(msg) {
                if (ws.readyState === WebSocket.OPEN) {
                    ws.send(safeStringify({ type: 'log', payload: serialize(msg) }));
                }
            };

            ws.onopen = function() {
                console.log('REPL: Connected');
                ws.send(safeStringify({ type: 'status', payload: 'REPL Session Started' }));
            };

            ws.onmessage = function(event) {
                const command = event.data;
                let result;
                try {
                    // Execute command globally
                    const evalResult = (0, eval)(command);
                    result = serialize(evalResult);
                } catch (e) {
                    result = 'Error: ' + e.toString();
                }
                ws.send(safeStringify({ type: 'result', payload: result }));
            };            ws.onclose = function() {
                console.log('REPL: Disconnected. Retrying in 5 seconds...');
                setTimeout(connect, 5000);
            };

            ws.onerror = function(e) {
                console.log('REPL: Error: ' + e.message);
                ws.close();
            };
        } catch (e) {
            console.log('REPL: Fatal connection error: ' + e.message);
            setTimeout(connect, 5000);
        }
    }

    connect();
})();
