/**!
  * MWC-JavaScriptSDK v1.0.10
  * (c) 2021-2022 MWC
  * Released under the MIT License.
  * @Build Thu Feb 17 2022 18:32:58 GMT+0800 (GMT+08:00)
  */
const global = {
    __local__: true
};

const MWC_KEY_GLOBAL_LOG_ID = "1002065";

const console = {
    log: (workerId, ...log) => {
        workerId && log && log.join && (log = (log = log.join(" ")) && log.replace(/%/g, "％"), 
        native_console.log("" + workerId, log));
    },
    error: (workerId, ...log) => {
        workerId && log && log.join && (log = (log = log.join(" ")) && log.replace(/%/g, "％"), 
        native_console.error("" + workerId, log));
    },
    info: (workerId, ...log) => {
        workerId && log && log.join && (log = (log = log.join(" ")) && log.replace(/%/g, "％"), 
        native_console.info ? native_console.info("" + workerId, log) : native_console.log("" + workerId, log));
    }
};

class WorkerManager {
    constructor() {
        this.workers = {};
    }
    checkWorkerExistByWorkerId(workerId) {
        return !!this.workers[workerId];
    }
    addWorker(worker) {
        var workerId = worker.workerId;
        this.workers[workerId] ? console.error(worker.workerId, "当前已经存在worker，不能重复添加") : this.workers[workerId] = worker;
    }
    trigger(event) {
        var eventName = event.name;
        var workerId = event.workerId;
        if (eventName) if (workerId) try {
            const worker = this.workers[workerId];
            if (!worker) throw new Error(`js:${eventName}找不到对应的worker对象`);
            var serviceId;
            worker._trigger(event), "mk.destroy" == eventName && (serviceId = worker.serviceId, 
            worker._finalize(), this.workers[workerId] = null, g_mwc_api._trigger({
                workerId: workerId,
                serviceId: serviceId
            }, "mk.destroy", {
                workerId: workerId
            }));
        } catch (e) {
            throw e.type = "worker_error", e.workerId = workerId, e;
        } else console.error(MWC_KEY_GLOBAL_LOG_ID, "js接收到事件, 没有workerId"); else console.error(workerId, "js接收到事件, 没有eventName");
    }
}

global._workers = new WorkerManager();

class WorkerSelf {
    constructor(workerId, serviceId) {
        this._events = {}, this._fnCache = new Map(), this._onDestroy = null, this._env = null, 
        this.workerId = workerId, this.serviceId = serviceId, Object.keys(console || {}).forEach(fn => {
            this.console || (this.console = {}), this.console[fn] = (...args) => {
                console[fn](workerId, ...args);
            };
        });
    }
    get env() {
        if (!this._env) {
            const env = {};
            var ua = g_mwc_api.getUa();
            env.ua = ua, this._env = env;
        }
        return this._env;
    }
    fetch(options, callback) {
        g_mwc_api.fetch({
            workerId: this.workerId,
            serviceId: this.serviceId
        }, options || {}, (error, content) => {
            if ("function" == typeof callback) try {
                callback(error, content);
            } catch (e) {
                throw e.type = "worker_error", e.workerId = this.workerId, e;
            }
        });
    }
    _trigger(event) {
        var eventName = event.name;
        this._events[eventName] && this._events[eventName].forEach(callback => {
            if ("function" == typeof callback) try {
                callback.call(this, event.data || {});
            } catch (e) {
                throw e.type = "worker_error", e.workerId = this.workerId, e;
            }
        });
    }
    _finalize() {
        "function" == typeof this._onDestroy && (this._onDestroy(), this._onDestroy = null), 
        this.workerId = null, this.serviceId = null, this._events = null, this._fnCache = null;
    }
    addEventListener(eventName, callback) {
        "function" == typeof callback && (this._events[eventName] || (this._events[eventName] = []), 
        -1 == this._events[eventName].findIndex(item => item === callback) && this._events[eventName].push(callback));
    }
    post(type) {
        "ADD_WORKER" == type && global._workers.addWorker(this);
    }
    onDestroy(cb) {
        this._onDestroy || (this._onDestroy = cb);
    }
}

WorkerSelf.create = function(workerId, self) {
    const worker = new WorkerSelf(workerId, self);
    self = new Proxy({}, {
        get: function(obj, prop) {
            if (!("" + prop).startsWith("_")) {
                if (worker._fnCache && worker._fnCache.has(prop)) return worker._fnCache.get(prop);
                if (worker && prop in worker) {
                    const value = worker[prop];
                    if ("function" != typeof value) return value;
                    {
                        const wrap = value.bind(worker);
                        return worker._fnCache.set(prop, wrap), wrap;
                    }
                }
                if (g_mwc_api && prop in g_mwc_api) {
                    const value = g_mwc_api[prop];
                    if ("function" != typeof value) return value;
                    {
                        const {
                            workerId,
                            serviceId
                        } = worker;
                        function wrap(...args) {
                            return value.apply(g_mwc_api, [ {
                                workerId: workerId,
                                serviceId: serviceId
                            }, ...args ]);
                        }
                        return worker._fnCache.set(prop, wrap), wrap;
                    }
                }
            }
        }
    });
    return Object.freeze(self), self;
};
