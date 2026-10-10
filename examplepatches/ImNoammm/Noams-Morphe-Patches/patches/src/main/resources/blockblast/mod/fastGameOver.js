// Faster game over: GameOver_Splash_Proxy waits getGameOverEventDelayTime() after the board fills before
// E_GameOver_GameEnd opens the result screen; with the toggle on the result screen comes straight after.
bb.feature('fastGameOver', {
    title: 'Game over',
    settings: [
        { key: 'enabled', type: 'toggle', label: 'Skip the game-over wait', def: true },
    ],
    start: function () {
        bb.on('GameOver_Splash_Proxy', function (exports) {
            bb.wrap(exports.GameOver_Splash_Proxy.prototype, 'getGameOverEventDelayTime', function (original) {
                return function () {
                    return bb.get('fastGameOver', 'enabled') ? 0 : original.apply(this, arguments);
                };
            });
        });
    },
});
