(function() {
  var mraid = window.mraid = {};

  var bridge = window.mraidbridge = {
    nativeSDKFiredReady: false,
    nativeCallQueue: [],
    nativeCallInFlight: false,
    lastSizeChangeProperties: null
  };

  bridge.fireChangeEvent = function(properties) {
    for (var p in properties) {
      if (properties.hasOwnProperty(p)) {
        var handler = changeHandlers[p];
        handler(properties[p]);
      }
    }
  };

  bridge.nativeCallComplete = function(command) {
    if (this.nativeCallQueue.length === 0) {
      this.nativeCallInFlight = false;
      return;
    }

    var nextCall = this.nativeCallQueue.pop();
    window.location = nextCall;
  };

  bridge.executeNativeCall = function(args) {
    var command = args.shift();

    if (!this.nativeSDKFiredReady) {
        console.log('rejecting ' + command + ' because mraid is not ready');
        bridge.notifyErrorEvent('mraid is not ready', command);
        return;
    }

    var call = 'mraid://' + command;

    var key, value;
    var isFirstArgument = true;

    for (var i = 0; i < args.length; i += 2) {
      key = args[i];
      value = args[i + 1];

      if (value === null) continue;

      if (isFirstArgument) {
        call += '?';
        isFirstArgument = false;
      } else {
        call += '&';
      }

      call += encodeURIComponent(key) + '=' + encodeURIComponent(value);
    }

    if (this.nativeCallInFlight) {
      this.nativeCallQueue.push(call);
    } else {
      this.nativeCallInFlight = true;
      window.location = call;
    }
  };


  bridge.setCurrentPosition = function(x, y, width, height) {
    currentPosition = {
      x: x,
      y: y,
      width: width,
      height: height
    };
    broadcastEvent(EVENTS.INFO, 'Set current position to ' + stringify(currentPosition));
  };

  bridge.setDefaultPosition = function(x, y, width, height) {
    defaultPosition = {
      x: x,
      y: y,
      width: width,
      height: height
    };
    broadcastEvent(EVENTS.INFO, 'Set default position to ' + stringify(defaultPosition));
  };
  
  bridge.setMaxSize = function(width, height) {
    maxSize = {
      width: width,
      height: height
    };

    expandProperties.width = width;
    expandProperties.height = height;

    broadcastEvent(EVENTS.INFO, 'Set max size to ' + stringify(maxSize));
  };

  bridge.setPlacementType = function(_placementType) {
    placementType = _placementType;
    broadcastEvent(EVENTS.INFO, 'Set placement type to ' + stringify(placementType));
  };

  bridge.setScreenSize = function(width, height) {
    screenSize = {
      width: width,
      height: height
    };
    broadcastEvent(EVENTS.INFO, 'Set screen size to ' + stringify(screenSize));
  };

  bridge.setState = function(_state) {
    state = _state;
    broadcastEvent(EVENTS.INFO, 'Set state to ' + stringify(state));
    broadcastEvent(EVENTS.STATECHANGE, state);
  };

  bridge.setIsViewable = function(_isViewable) {
    isViewable = _isViewable;
    broadcastEvent(EVENTS.INFO, 'Set isViewable to ' + stringify(isViewable));
    broadcastEvent(EVENTS.VIEWABLECHANGE, isViewable);
  };

  bridge.setSupports = function(sms, tel, calendar, storePicture, inlineVideo) {
    supportProperties = {
      sms: sms,
      tel: tel,
      calendar: calendar,
      storePicture: storePicture,
      inlineVideo: inlineVideo
    };
  };

  bridge.notifyReadyEvent = function() {
    this.nativeSDKFiredReady = true;
    broadcastEvent(EVENTS.READY);
  };

  bridge.notifyErrorEvent = function(message, action) {
    broadcastEvent(EVENTS.ERROR, message, action);
  };

  bridge.fireReadyEvent = bridge.notifyReadyEvent;
  bridge.fireErrorEvent = bridge.notifyErrorEvent;

  bridge.notifySizeChangeEvent = function(width, height) {
    if (this.lastSizeChangeProperties &&
          width == this.lastSizeChangeProperties.width && height == this.lastSizeChangeProperties.height) {
      return;
    }

    this.lastSizeChangeProperties = {
        width: width,
        height: height
    };
    broadcastEvent(EVENTS.SIZECHANGE, width, height);
  };

  bridge.notifyStateChangeEvent = function() {
    if (state === STATES.LOADING) {
      broadcastEvent(EVENTS.INFO, 'Native SDK initialized.');
    }

    broadcastEvent(EVENTS.INFO, 'Set state to ' + stringify(state));
    broadcastEvent(EVENTS.STATECHANGE, state);
  };

  bridge.notifyViewableChangeEvent = function() {
    broadcastEvent(EVENTS.INFO, 'Set isViewable to ' + stringify(isViewable));
    broadcastEvent(EVENTS.VIEWABLECHANGE, isViewable);
  };

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

  var lastSizeChangeProperties;

  var maxSize = {};

  var currentPosition = {};

  var defaultPosition = {};

  var screenSize = {};

  var hasSetCustomClose = false;

  var listeners = {};

  var state = STATES.LOADING;

  var isViewable = false;

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

  var clone = function(obj) {
    if (obj === null) return null;
    var f = function() {};
    f.prototype = obj;
    return new f();
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

  var trim = function(str) {
    return str.replace(/^\s+|\s+$/g, '');
  };

  var changeHandlers = {
    state: function(val) {
      if (state === STATES.LOADING) {
        broadcastEvent(EVENTS.INFO, 'Native SDK initialized.');
      }
      state = val;
      broadcastEvent(EVENTS.INFO, 'Set state to ' + stringify(val));
      broadcastEvent(EVENTS.STATECHANGE, state);
    },

    viewable: function(val) {
      isViewable = val;
      broadcastEvent(EVENTS.INFO, 'Set isViewable to ' + stringify(val));
      broadcastEvent(EVENTS.VIEWABLECHANGE, isViewable);
    },

    placementType: function(val) {
      broadcastEvent(EVENTS.INFO, 'Set placementType to ' + stringify(val));
      placementType = val;
    },

    sizeChange: function(val) {
      broadcastEvent(EVENTS.INFO, 'Set screenSize to ' + stringify(val));
      for (var key in val) {
        if (val.hasOwnProperty(key)) screenSize[key] = val[key];
      }
    },

    supports: function(val) {
      broadcastEvent(EVENTS.INFO, 'Set supports to ' + stringify(val));
      supportProperties = val;
    }
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

  var expandPropertyValidators = {
    useCustomClose: function(v) { return (typeof v === 'boolean'); },
  };

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
      broadcastEvent(EVENTS.ERROR, 'Ad cannot be closed when it is already hidden.',
        'close');
    } else bridge.executeNativeCall(['close']);
  };

  mraid.expand = function(URL) {
    if (!(this.getState() === STATES.DEFAULT || this.getState() === STATES.RESIZED)) {
      broadcastEvent(EVENTS.ERROR, 'Ad can only be expanded from the default or resized state.', 'expand');
    } else {
      var args = ['expand',
        'shouldUseCustomClose', expandProperties.useCustomClose
      ];

      if (URL) {
        args = args.concat(['url', URL]);
      }

      bridge.executeNativeCall(args);
    }
  };

  mraid.getExpandProperties = function() {
    var properties = {
      width: expandProperties.width,
      height: expandProperties.height,
      useCustomClose: expandProperties.useCustomClose,
      isModal: expandProperties.isModal
    };
    return properties;
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
    if (!URL) broadcastEvent(EVENTS.ERROR, 'URL is required.', 'open');
    else bridge.executeNativeCall(['open', 'url', URL]);
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

  // Deprecated. Not supported on js side anymore. SDK side should take care of the UI close button.
  mraid.useCustomClose = function(shouldUseCustomClose) {
    expandProperties.useCustomClose = shouldUseCustomClose;
    hasSetCustomClose = true;
    bridge.executeNativeCall(['usecustomclose', 'shouldUseCustomClose', shouldUseCustomClose]);
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

  mraid.setOrientationProperties = function(properties) {

    if (properties.hasOwnProperty('allowOrientationChange')) {
      orientationProperties.allowOrientationChange = properties.allowOrientationChange;
    }

    if (properties.hasOwnProperty('forceOrientation')) {
      orientationProperties.forceOrientation = properties.forceOrientation;
    }

    var args = ['setOrientationProperties',
      'allowOrientationChange', orientationProperties.allowOrientationChange,
      'forceOrientation', orientationProperties.forceOrientation
    ];
    bridge.executeNativeCall(args);
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
      var args = ['resize',
        'width', resizeProperties.width,
        'height', resizeProperties.height,
        'offsetX', resizeProperties.offsetX || 0,
        'offsetY', resizeProperties.offsetY || 0,
        'customClosePosition', resizeProperties.customClosePosition,
        'allowOffscreen', !!resizeProperties.allowOffscreen
        ];

      bridge.executeNativeCall(args);
    } 
  };

  mraid.getResizeProperties = function() {
    var properties = {
      width: resizeProperties.width,
      height: resizeProperties.height,
      offsetX: resizeProperties.offsetX,
      offsetY: resizeProperties.offsetY,
      customClosePosition: resizeProperties.customClosePosition,
      allowOffscreen: resizeProperties.allowOffscreen
    };
    return properties;
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
}());