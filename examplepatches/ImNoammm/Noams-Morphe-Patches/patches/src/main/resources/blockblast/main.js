
// Patched boot: hot updates are never applied (bbmod.js switches the updater off); any downloaded update
// in <writable>/patch is removed, since the native side loads that folder first on the next launch. The
// folder stays: the app writes its base-version markers (baseV, baseM) there and the login checks them.
(function () {
    if (typeof window.jsb !== 'object') return;
    var fileUtils = jsb.fileUtils;
    var root = fileUtils.getWritablePath() + 'patch';
    if (fileUtils.isDirectoryExist(root + '_temp/')) fileUtils.removeDirectory(root + '_temp/');
    ['main.js', 'project.manifest', 'version.manifest'].forEach(function (name) {
        if (fileUtils.isFileExist(root + '/' + name)) fileUtils.removeFile(root + '/' + name);
    });
    ['src/', 'assets/', 'jsb-adapter/'].forEach(function (name) {
        if (fileUtils.isDirectoryExist(root + '/' + name)) fileUtils.removeDirectory(root + '/' + name);
    });
})();
//多链路兜底策略
function muitiLinkFallbackStrategy()
{
    if (!window.jsb) return false;

    globalThis["muitiLinkVersion"] = "muitiLink1.0.0";
    let clearState = localStorage.getItem(globalThis["muitiLinkVersion"]);
    let hotUpdateSearchPath = jsb.fileUtils.getWritablePath()  + 'patch';
    if(localStorage.getItem(`${globalThis["muitiLinkVersion"]}Clear`))
    {
        console.log("清理完成直接进入游戏");
        globalThis[globalThis["muitiLinkVersion"]] = true;
    }else if(clearState)
    {
        console.log("清理资源");
        /**
         * 清理搜索路径
         */
        globalThis[globalThis["muitiLinkVersion"]] = true;
        let getSearchPathsArr = jsb.fileUtils.getSearchPaths();
        console.log(getSearchPathsArr);
        let totalNum = getSearchPathsArr.length - 1;
        for(let i = totalNum ;i >= 0 ;i --)
        {
            if(getSearchPathsArr[i].indexOf(hotUpdateSearchPath) != -1)
            {
                getSearchPathsArr.splice(-1,1);
            }
        }
        console.log(getSearchPathsArr);
        jsb.fileUtils.setSearchPaths(getSearchPathsArr);
        jsb.fileUtils.removeDirectory(hotUpdateSearchPath);
        localStorage.setItem(`${globalThis["muitiLinkVersion"]}Clear`,"true");
        cc.game.pause();
        setTimeout(() => {
            __restartVM();
        }, 0);
        return true;
    }else
    {
        console.log("未走大兜底逻辑");
        console.log(jsb.fileUtils.getSearchPaths());
        let url = `https://bband1.afafb.com/blockblast/remote/${globalThis["muitiLinkVersion"]}.json?${Date.now()}`;
        cc.assetManager.loadRemote(url, cc.JsonAsset, (err, asset) => {
            if (err) {
                console.log(err);
                return;
            }
            console.log(asset);
            if(asset?.json?.state)
            {
                localStorage.setItem(globalThis["muitiLinkVersion"],"true");
                globalThis[globalThis["muitiLinkVersion"]] = true;
            }
            cc.assetManager.cacheManager.removeCache(url);
        });
    }
    return false;
}

// ========== 远程服务器地址变更 - 缓存兼容 ==========
function setupRemoteCacheCompat(settings) {
    if (!window.jsb) return;
    const mergeTagKey = "__CacheCompat__"
    const isMigrated = localStorage.getItem(mergeTagKey);
    if (isMigrated) {
        console.log("缓存兼容已执行过，不再执行");
        return;
    }
    const cacheManager = cc.assetManager.cacheManager;
    if (!cacheManager || !cacheManager.cachedFiles) return;
    let newServer = settings.server || '';
    let oldServer = "https://bband1.afafb.com/blockblast/remote/android/prod/";
    if (G_Cfg.publishPlatform.includes("_test")) {
        oldServer = "http://inner-package1.youxi123.com:8820/remote/android/test/";
    }
    // 统一末尾斜杠
    if (oldServer && !oldServer.endsWith('/')) oldServer += '/';
    if (newServer && !newServer.endsWith('/')) newServer += '/';
    newServer += "remote/";
    
    const toMigrate = [];
    cacheManager.cachedFiles.forEach((entry, key) => {
        if (key.startsWith(oldServer)) {
            const newUrl = newServer + key.substring(oldServer.length);
            toMigrate.push({ oldKey: key, newKey: newUrl, entry });
        }
    });

    console.log(`[CacheCompat] 迁移 ${toMigrate.length} 个缓存条目: ${oldServer} -> ${newServer}`);
    
    for (const { oldKey, newKey, entry } of toMigrate) {
        cacheManager.cachedFiles.add(newKey, entry);
    }

    cacheManager.writeCacheFile();
    localStorage.setItem(mergeTagKey, "true");
}

window.boot = function () {
    var settings = window._CCSettings;
    window._CCSettings = undefined;
    var onProgress = null;
    window.__click_point__ = [];
    var RESOURCES = cc.AssetManager.BuiltinBundleName.RESOURCES;
    var INTERNAL = cc.AssetManager.BuiltinBundleName.INTERNAL;
    var MAIN = cc.AssetManager.BuiltinBundleName.MAIN;

    function setLoadingDisplay () {
        // Loading splash scene
        var splash = document.getElementById('splash');
        var progressBar = splash.querySelector('.progress-bar span');
        onProgress = function (finish, total) {
            var percent = 100 * finish / total;
            if (progressBar) {
                progressBar.style.width = percent.toFixed(2) + '%';
            }
        };
        splash.style.display = 'block';
        progressBar.style.width = '0%';

        cc.director.once(cc.Director.EVENT_AFTER_SCENE_LAUNCH, function () {
            splash.style.display = 'none';
        });
    }

    var onStart = function () {
        cc.view.enableRetina(true);
        cc.view.resizeWithBrowserSize(true);

        if (cc.sys.isBrowser) {
            setLoadingDisplay();
        }

        if (cc.sys.isMobile) {
            if (settings.orientation === 'landscape') {
                cc.view.setOrientation(cc.macro.ORIENTATION_LANDSCAPE);
            }
            else if (settings.orientation === 'portrait') {
                cc.view.setOrientation(cc.macro.ORIENTATION_PORTRAIT);
            }
            cc.view.enableAutoFullScreen([
                cc.sys.BROWSER_TYPE_BAIDU,
                cc.sys.BROWSER_TYPE_BAIDU_APP,
                cc.sys.BROWSER_TYPE_WECHAT,
                cc.sys.BROWSER_TYPE_MOBILE_QQ,
                cc.sys.BROWSER_TYPE_MIUI,
                cc.sys.BROWSER_TYPE_HUAWEI,
                cc.sys.BROWSER_TYPE_UC,
            ].indexOf(cc.sys.browserType) < 0);
        }

        // Limit downloading max concurrent task to 2,
        // more tasks simultaneously may cause performance draw back on some android system / browsers.
        // You can adjust the number based on your own test result, you have to set it before any loading process to take effect.
        if (cc.sys.isBrowser && cc.sys.os === cc.sys.OS_ANDROID) {
            cc.assetManager.downloader.maxConcurrency = 2;
            cc.assetManager.downloader.maxRequestsPerFrame = 2;
        }

        var launchScene = settings.launchScene;
        var bundle = cc.assetManager.bundles.find(function (b) {
            return b.getSceneInfo(launchScene);
        });

        bundle.loadScene(launchScene, null, onProgress,
            function (err, scene) {
                if (!err) {
                    cc.director.runSceneImmediate(scene);
                    if (cc.sys.isBrowser) {
                        // show canvas
                        var canvas = document.getElementById('GameCanvas');
                        canvas.style.visibility = '';
                        var div = document.getElementById('GameDiv');
                        if (div) {
                            div.style.backgroundImage = '';
                        }
                        console.log('Success to load scene: ' + launchScene);
                    }
                }else{
                    console.error(err.toString())
                }
            }
        );
    };

    var option = {
        id: 'GameCanvas',
        debugMode: settings.debug ? cc.debug.DebugMode.INFO : cc.debug.DebugMode.ERROR,
        showFPS: settings.debug,
        frameRate: 60,
        groupList: settings.groupList,
        collisionMatrix: settings.collisionMatrix,
    };

    cc.assetManager.init({ 
        bundleVers: settings.bundleVers,
        remoteBundles: settings.remoteBundles,
        server: settings.server
    });

   
    var bundleRoot = [INTERNAL];
    settings.hasResourcesBundle && bundleRoot.push(RESOURCES);

    var count = 0;
    function cb (err, bundle) {
        if (err) {
            return console.error(err.message, err.stack);
        }
        count++;
        if (count === bundleRoot.length + 1) {
            cc.assetManager.loadBundle(MAIN, function (err) {
                if (!err) {
                    cc.game.run(option, onStart)
                }else{
                    console.error(err.toString())
                };
            });
        }
    }
    
    cc.assetManager.loadScript(settings.jsList.map(function (x) { return 'src/' + x;}), cb);

     // ========== 远程服务器地址变更 - 缓存兼容 ==========
    setupRemoteCacheCompat(settings);
    // if(muitiLinkFallbackStrategy())
    // {
    //     return;
    // }
    for (var i = 0; i < bundleRoot.length; i++) {
        cc.assetManager.loadBundle(bundleRoot[i], cb);
    }
};

//以下内容会进行md5构建替换，不可更改，否则不生效
if (window.jsb) {
    var isRuntime = (typeof loadRuntime === 'function');
    if (isRuntime) {
        require('src/settings.23530.js');
        require('src/cocos2d-runtime.js');
        if (CC_PHYSICS_BUILTIN || CC_PHYSICS_CANNON) {
            require('src/physics.js');
        }
        require('jsb-adapter/engine/index.js');
    }
    else {
        require('src/settings.23530.js');
        require('src/cocos2d-jsb.caa45.js');
        if (CC_PHYSICS_BUILTIN || CC_PHYSICS_CANNON) {
            require('src/physics.js');
        }
        require('jsb-adapter/jsb-engine.js');
    }

    cc.macro.CLEANUP_IMAGE_CACHE = true;
    try { require('src/bbmod.js'); } catch (e) {}
    window.boot();
}