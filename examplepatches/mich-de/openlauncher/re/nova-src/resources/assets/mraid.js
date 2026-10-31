(function() {

  var mraid = window.mraid = {};
  var VERSION = mraid.VERSION = '2.0';

  var STATES = mraid.STATES = {
    LOADING: 'loading',
    DEFAULT: 'default',
    EXPANDED: 'expanded',
    HIDDEN: 'hidden',
    RESIZED: 'resized'
  };

  var EVENTS = mraid.EVENTS = {
    ERROR: 'error',
    INFO: 'info',
    READY: 'ready',
    STATECHANGE: 'stateChange',
    VIEWABLECHANGE: 'viewableChange',
    SIZECHANGE: 'sizeChange'
  };

  var PLACEMENT_TYPES = mraid.PLACEMENT_TYPES = {
    UNKNOWN: 'unknown',
    INLINE: 'inline',
    INTERSTITIAL: 'interstitial'
  };

  var expandProperties = {
    width: false,
    height: false,
    useCustomClose: false,
    isModal: true
  };

  var resizeProperties = {
    width: false,
    height: false,
    offsetX: false,
    offsetY: false,
    customClosePosition: 'top-right',
    allowOffscreen: true
  };

  var orientationProperties = {
    allowOrientationChange: true,
    forceOrientation: "none"
  };

  var supportProperties = {
    sms: false,
    tel: false,
    calendar: false,
    storePicture: false,
    inlineVideo: false
  };

  var maxSize = {};
  var currentPosition = {};
  var defaultPosition = {};
  var screenSize = {};
  var hasSetCustomClose = false;
  var listeners = {};
  var state = STATES.LOADING;
  var isViewable = true;
  var placementType = PLACEMENT_TYPES.UNKNOWN;

  var EventListeners = function(event) {
    this.event = event;
    this.count = 0;
    var listeners = {};

    this.add = function(func) {
      var id = String(func);
      if (!listeners[id]) {
        listeners[id] = func;
        this.count++;
      }
    };

    this.remove = function(func) {
      var id = String(func);
      if (listeners[id]) {
        listeners[id] = null;
        delete listeners[id];
        this.count--;
        return true;
      } else {
        return false;
      }
    };

    this.removeAll = function() {
      for (var id in listeners) {
        if (listeners.hasOwnProperty(id)) this.remove(listeners[id]);
      }
    };

    this.broadcast = function(args) {
      for (var id in listeners) {
        if (listeners.hasOwnProperty(id)) listeners[id].apply(mraid, args);
      }
    };

    this.toString = function() {
      var out = [event, ':'];
      for (var id in listeners) {
        if (listeners.hasOwnProperty(id)) out.push('|', id, '|');
      }
      return out.join('');
    };
  };

  var broadcastEvent = function() {
    var args = new Array(arguments.length);
    var l = arguments.length;
    for (var i = 0; i < l; i++) args[i] = arguments[i];
    var event = args.shift();
    if (listeners[event]) listeners[event].broadcast(args);
  };

  var contains = function(value, array) {
    for (var i in array) {
      if (array[i] === value) return true;
    }
    return false;
  };

  var stringify = function(obj) {
    if (typeof obj === 'object') {
      var out = [];
      if (obj.push) {
        for (var p in obj) out.push(obj[p]);
        return '[' + out.join(',') + ']';
      } else {
        for (var p in obj) out.push("'" + p + "': " + obj[p]);
        return '{' + out.join(',') + '}';
      }
    } else return String(obj);
  };

  var validate = function(obj, validators, action, merge) {
    if (!merge) {
      if (obj === null) {
        broadcastEvent(EVENTS.ERROR, 'Required object not provided.', action);
        return false;
      } else {
        for (var i in validators) {
          if (validators.hasOwnProperty(i) && obj[i] === undefined) {
            broadcastEvent(EVENTS.ERROR, 'Object is missing required property: ' + i, action);
            return false;
          }
        }
      }
    }

    for (var prop in obj) {
      var validator = validators[prop];
      var value = obj[prop];
      if (validator && !validator(value)) {
        broadcastEvent(EVENTS.ERROR, 'Value of property ' + prop + ' is invalid: ' + value, action);
        return false;
      }
    }
    return true;
  };

  // Bridge communication
  var mraidToNativeBridge = {};

  mraidToNativeBridge.postToParentBridge = function(command, params) {
    window.parent.postMessage(JSON.stringify({
      command: command,
      params: params || {}
    }), '*');
  };

  window.addEventListener('message', function(event) {

      try {
        const message = JSON.parse(event.data);

        // Handle standard mraidbridge messages
        if (message.type && message.type.startsWith('mraidbridge:')) {
          const eventType = message.type.substring('mraidbridge:'.length);

          // Handle specific events
          switch (eventType) {
            case EVENTS.READY:
              state = STATES.DEFAULT;
              broadcastEvent(EVENTS.READY);
              break;

            case EVENTS.VIEWABLECHANGE:
              isViewable = message.args[0];
              broadcastEvent(EVENTS.VIEWABLECHANGE, isViewable);
              break;

            case EVENTS.STATECHANGE:
              state = message.args[0];
              broadcastEvent(EVENTS.STATECHANGE, state);
              break;

            case EVENTS.SIZECHANGE:
              broadcastEvent(EVENTS.SIZECHANGE, message.args[0], message.args[1]);
              break;

            case EVENTS.ERROR:
              broadcastEvent(EVENTS.ERROR, message.args[0], message.args[1]);
              break;

            case EVENTS.INFO:
              broadcastEvent(EVENTS.INFO, message.args[0]);
              break;
          }
        }

        // Handle property change messages
        if (message.type === 'mraidbridge:change') {
          if (message.properties) {
            for (const key in message.properties) {
              if (message.properties.hasOwnProperty(key)) {
                switch (key) {
                  case 'state':
                    state = message.properties[key];
                    break;
                  case 'currentPosition':
                    currentPosition = message.properties[key];
                    break;
                  case 'defaultPosition':
                    defaultPosition = message.properties[key];
                    break;
                  case 'maxSize':
                    maxSize = message.properties[key];
                    break;
                  case 'screenSize':
                    screenSize = message.properties[key];
                    break;
                  case 'isViewable':
                    isViewable = message.properties[key];
                    break;
                  case 'placementType':
                    placementType = message.properties[key];
                    break;
                  case 'supportProperties':
                    supportProperties = message.properties[key];
                    break;
                  default:
                    console.warn('Unknown property:', key);
                }
              }
            }
          }
        }
      } catch (e) {
        console.error('Error processing message:', e);
      }
    }, false);

  var expandPropertyValidators = {
    useCustomClose: function(v) { return (typeof v === 'boolean'); },
  };

  var resizePropertyValidators = {
    width: function(v) {
      return !isNaN(v) && v > 0;
    },
    height: function(v) {
      return !isNaN(v) && v > 0;
    },
    offsetX: function(v) {
      return !isNaN(v);
    },
    offsetY: function(v) {
      return !isNaN(v);
    },
    customClosePosition: function(v) {
      return (typeof v === 'string' &&
        ['top-right', 'bottom-right', 'top-left', 'bottom-left', 'center', 'top-center', 'bottom-center'].indexOf(v) > -1);
    },
    allowOffscreen: function(v) {
      return (typeof v === 'boolean');
    }
  };

  // MRAID API implementation
  mraid.addEventListener = function(event, listener) {
    if (!event || !listener) {
      broadcastEvent(EVENTS.ERROR, 'Both event and listener are required.', 'addEventListener');
    } else if (!contains(event, EVENTS)) {
      broadcastEvent(EVENTS.ERROR, 'Unknown MRAID event: ' + event, 'addEventListener');
    } else {
      if (!listeners[event]) {
        listeners[event] = new EventListeners(event);
      }
      listeners[event].add(listener);
    }
  };

  mraid.close = function() {
    if (state === STATES.HIDDEN) {
      broadcastEvent(EVENTS.ERROR, 'Ad cannot be closed when it is already hidden.', 'close');
    } else {
      mraidToNativeBridge.postToParentBridge('close');
    }
  };

  mraid.expand = function(URL) {
    if (!(this.getState() === STATES.DEFAULT || this.getState() === STATES.RESIZED)) {
      broadcastEvent(EVENTS.ERROR, 'Ad can only be expanded from the default or resized state.', 'expand');
    } else {
      var params = {
        shouldUseCustomClose: expandProperties.useCustomClose
      };

      if (URL) {
        params.url = URL;
      }

      mraidToNativeBridge.postToParentBridge('expand', params);
    }
  };

  mraid.getExpandProperties = function() {
    return {
      width: expandProperties.width,
      height: expandProperties.height,
      useCustomClose: expandProperties.useCustomClose,
      isModal: expandProperties.isModal
    };
  };

  mraid.getCurrentPosition = function() {
    return {
      x: currentPosition.x,
      y: currentPosition.y,
      width: currentPosition.width,
      height: currentPosition.height
    };
  };

  mraid.getDefaultPosition = function() {
    return {
      x: defaultPosition.x,
      y: defaultPosition.y,
      width: defaultPosition.width,
      height: defaultPosition.height
    };
  };

  mraid.getMaxSize = function() {
    return {
      width: maxSize.width,
      height: maxSize.height
    };
  };

  mraid.getPlacementType = function() {
    return placementType;
  };

  mraid.getScreenSize = function() {
    return {
      width: screenSize.width,
      height: screenSize.height
    };
  };

  mraid.getState = function() {
    return state;
  };

  mraid.isViewable = function() {
    return isViewable;
  };

  mraid.getVersion = function() {
    return mraid.VERSION;
  };

  mraid.open = function(URL) {
    if (!URL) {
      broadcastEvent(EVENTS.ERROR, 'URL is required.', 'open');
    } else {
      mraidToNativeBridge.postToParentBridge('open', { url: URL });
    }
  };

  mraid.removeEventListener = function(event, listener) {
    if (!event) {
      broadcastEvent(EVENTS.ERROR, 'Event is required.', 'removeEventListener');
      return;
    }

    if (listener) {
      var success = false;
      if (listeners[event]) {
        success = listeners[event].remove(listener);
      }

      if (!success) {
        broadcastEvent(EVENTS.ERROR, 'Listener not currently registered for event.', 'removeEventListener');
        return;
      }

    } else if (!listener && listeners[event]) {
      listeners[event].removeAll();
    }

    if (listeners[event] && listeners[event].count === 0) {
      listeners[event] = null;
      delete listeners[event];
    }
  };

  mraid.setExpandProperties = function(properties) {
    if (validate(properties, expandPropertyValidators, 'setExpandProperties', true)) {
      if (properties.hasOwnProperty('useCustomClose')) {
        expandProperties.useCustomClose = properties.useCustomClose;
      }
    }
  };

  mraid.useCustomClose = function(shouldUseCustomClose) {
    expandProperties.useCustomClose = shouldUseCustomClose;
    hasSetCustomClose = true;
    mraidToNativeBridge.postToParentBridge('usecustomclose', { shouldUseCustomClose: shouldUseCustomClose });
  };

  mraid.supports = function(feature) {
    return supportProperties[feature];
  };

  mraid.createCalendarEvent = function(parameters) {
    broadcastEvent(EVENTS.ERROR, 'calendar api is not supported', 'createCalendarEvent');
  };

  mraid.playVideo = function(uri) {
    broadcastEvent(EVENTS.ERROR, 'playVideo api is not supported', 'playVideo');
  };

  mraid.storePicture = function(uri) {
    broadcastEvent(EVENTS.ERROR, 'storePicture api is not supported', 'storePicture');
  };

  mraid.setOrientationProperties = function(properties) {
    if (properties.hasOwnProperty('allowOrientationChange')) {
      orientationProperties.allowOrientationChange = properties.allowOrientationChange;
    }

    if (properties.hasOwnProperty('forceOrientation')) {
      orientationProperties.forceOrientation = properties.forceOrientation;
    }

    mraidToNativeBridge.postToParentBridge('setOrientationProperties', {
      allowOrientationChange: orientationProperties.allowOrientationChange,
      forceOrientation: orientationProperties.forceOrientation
    });
  };

  mraid.getOrientationProperties = function() {
    return {
      allowOrientationChange: orientationProperties.allowOrientationChange,
      forceOrientation: orientationProperties.forceOrientation
    };
  };

  mraid.resize = function() {
    if (!(this.getState() === STATES.DEFAULT || this.getState() === STATES.RESIZED)) {
      broadcastEvent(EVENTS.ERROR, 'Ad can only be resized from the default or resized state.', 'resize');
    } else if (!resizeProperties.width || !resizeProperties.height) {
      broadcastEvent(EVENTS.ERROR, 'Must set resize properties before calling resize()', 'resize');
    } else {
      mraidToNativeBridge.postToParentBridge('resize', {
        width: resizeProperties.width,
        height: resizeProperties.height,
        offsetX: resizeProperties.offsetX || 0,
        offsetY: resizeProperties.offsetY || 0,
        customClosePosition: resizeProperties.customClosePosition,
        allowOffscreen: !!resizeProperties.allowOffscreen
      });
    }
  };

  mraid.getResizeProperties = function() {
    return {
      width: resizeProperties.width,
      height: resizeProperties.height,
      offsetX: resizeProperties.offsetX,
      offsetY: resizeProperties.offsetY,
      customClosePosition: resizeProperties.customClosePosition,
      allowOffscreen: resizeProperties.allowOffscreen
    };
  };

  mraid.setResizeProperties = function(properties) {
    if (validate(properties, resizePropertyValidators, 'setResizeProperties', true)) {
      var desiredProperties = ['width', 'height', 'offsetX', 'offsetY', 'customClosePosition', 'allowOffscreen'];
      var length = desiredProperties.length;

      for (var i = 0; i < length; i++) {
        var propname = desiredProperties[i];
        if (properties.hasOwnProperty(propname)) {
          resizeProperties[propname] = properties[propname];
        }
      }
    }
  };
})();
