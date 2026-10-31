(() => {
  // web/node_modules/@kawarp/core/dist/index.js
  var BLUR_SIZE = 128;
  var DEFAULT_VIDEO_OPTIONS = {
    sampleWidth: 128,
    sampleHeight: 72,
    downsampleFactor: 2,
    frameRate: 0,
    smoothing: 0
  };
  var VIDEO_SEEK_THRESHOLD_SECONDS = 0.25;
  var VIDEO_SMOOTHING_SETTLE_RESPONSES = 8;
  var boundedOption = (value, fallback, min, max) => typeof value === "number" && Number.isFinite(value) ? Math.min(max, Math.max(min, value)) : fallback;
  var textureSourceSize = (source) => {
    if ("naturalWidth" in source)
      return [source.naturalWidth, source.naturalHeight];
    if ("videoWidth" in source)
      return [source.videoWidth, source.videoHeight];
    if ("displayWidth" in source)
      return [source.displayWidth, source.displayHeight];
    return [source.width, source.height];
  };
  var VERTEX_SHADER = `
  attribute vec2 a_position;
  attribute vec2 a_texCoord;
  varying vec2 v_texCoord;
  void main() {
    gl_Position = vec4(a_position, 0.0, 1.0);
    v_texCoord = a_texCoord;
  }
`;
  var KAWASE_BLUR_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform vec2 u_resolution;
  uniform float u_offset;
  varying vec2 v_texCoord;

  void main() {
    highp vec2 texelSize = 1.0 / u_resolution;
    highp vec4 color = vec4(0.0);

    color += texture2D(u_texture, v_texCoord + vec2(-u_offset, -u_offset) * texelSize);
    color += texture2D(u_texture, v_texCoord + vec2(u_offset, -u_offset) * texelSize);
    color += texture2D(u_texture, v_texCoord + vec2(-u_offset, u_offset) * texelSize);
    color += texture2D(u_texture, v_texCoord + vec2(u_offset, u_offset) * texelSize);

    gl_FragColor = color * 0.25;
  }
`;
  var BLEND_SHADER = `
  precision highp float;
  uniform sampler2D u_texture1;
  uniform sampler2D u_texture2;
  uniform float u_blend;
  varying vec2 v_texCoord;

  void main() {
    vec4 color1 = texture2D(u_texture1, v_texCoord);
    vec4 color2 = texture2D(u_texture2, v_texCoord);
    gl_FragColor = mix(color1, color2, u_blend);
  }
`;
  var TINT_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform vec3 u_tintColor;
  uniform float u_tintIntensity;
  varying vec2 v_texCoord;

  void main() {
    vec4 color = texture2D(u_texture, v_texCoord);
    float luma = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // darkMask: 1.0 for black, 0.0 for luma >= 0.5
    float darkMask = 1.0 - smoothstep(0.0, 0.5, luma);

    // Blend dark areas toward tint color
    color.rgb = mix(color.rgb, u_tintColor, darkMask * u_tintIntensity);

    gl_FragColor = color;
  }
`;
  var DOMAIN_WARP_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform float u_time;
  uniform float u_intensity;
  varying vec2 v_texCoord;

  vec3 mod289(vec3 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
  vec2 mod289(vec2 x) { return x - floor(x * (1.0 / 289.0)) * 289.0; }
  vec3 permute(vec3 x) { return mod289(((x*34.0)+1.0)*x); }

  float snoise(vec2 v) {
    const vec4 C = vec4(0.211324865405187, 0.366025403784439,
                        -0.577350269189626, 0.024390243902439);
    vec2 i  = floor(v + dot(v, C.yy));
    vec2 x0 = v - i + dot(i, C.xx);
    vec2 i1 = (x0.x > x0.y) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    vec4 x12 = x0.xyxy + C.xxzz;
    x12.xy -= i1;
    i = mod289(i);
    vec3 p = permute(permute(i.y + vec3(0.0, i1.y, 1.0)) + i.x + vec3(0.0, i1.x, 1.0));
    vec3 m = max(0.5 - vec3(dot(x0,x0), dot(x12.xy,x12.xy), dot(x12.zw,x12.zw)), 0.0);
    m = m*m; m = m*m;
    vec3 x = 2.0 * fract(p * C.www) - 1.0;
    vec3 h = abs(x) - 0.5;
    vec3 ox = floor(x + 0.5);
    vec3 a0 = x - ox;
    m *= 1.79284291400159 - 0.85373472095314 * (a0*a0 + h*h);
    vec3 g;
    g.x = a0.x * x0.x + h.x * x0.y;
    g.yz = a0.yz * x12.xz + h.yz * x12.yw;
    return 130.0 * dot(m, g);
  }

  void main() {
    vec2 uv = v_texCoord;
    float t = u_time * 0.05;

    vec2 center = uv - 0.5;
    float centerWeight = 1.0 - smoothstep(0.0, 0.7, length(center));

    // Large-scale movement (slow, big blobs)
    float n1 = snoise(uv * 0.35 + vec2(t, t * 0.7));
    float n2 = snoise(uv * 0.35 + vec2(-t * 0.8, t * 0.5) + vec2(50.0, 50.0));

    // Medium-scale detail (adds organic movement)
    float n3 = snoise(uv * 0.9 + vec2(t * 1.2, -t) + vec2(100.0, 0.0));
    float n4 = snoise(uv * 0.9 + vec2(-t, t * 1.1) + vec2(0.0, 100.0));

    // Combine two octaves
    vec2 warp = vec2(
      n1 * 0.65 + n3 * 0.35,
      n2 * 0.65 + n4 * 0.35
    ) * centerWeight;

    vec2 warpedUV = uv + warp * u_intensity;
    warpedUV = clamp(warpedUV, 0.0, 1.0);

    gl_FragColor = texture2D(u_texture, warpedUV);
  }
`;
  var OUTPUT_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform float u_saturation;
  uniform float u_dithering;
  uniform float u_time;
  uniform float u_scale;
  uniform vec2 u_resolution;
  varying vec2 v_texCoord;

  highp float hash(highp vec3 p) {
    p = fract(p * 0.1031);
    p += dot(p, p.zyx + 31.32);
    return fract((p.x + p.y) * p.z);
  }

  void main() {
    vec2 uv = (v_texCoord - 0.5) / u_scale + 0.5;
    uv = clamp(uv, 0.0, 1.0);

    vec4 color = texture2D(u_texture, uv);

    vec2 center = v_texCoord - 0.5;
    float vignette = 1.0 - dot(center, center) * 0.3;
    color.rgb *= vignette;

    float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    color.rgb = mix(vec3(gray), color.rgb, u_saturation);

    highp vec2 pixelPos = floor(v_texCoord * u_resolution);
    highp float noise = hash(vec3(pixelPos, floor(u_time * 60.0)));
    color.rgb += (noise - 0.5) * u_dithering;

    gl_FragColor = color;
  }
`;
  var DOWNSAMPLE_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform vec2 u_texelSize;
  varying vec2 v_texCoord;

  void main() {
    vec2 offset = u_texelSize * 0.25;
    gl_FragColor = 0.25 * (
      texture2D(u_texture, v_texCoord + vec2(-offset.x, -offset.y)) +
      texture2D(u_texture, v_texCoord + vec2(offset.x, -offset.y)) +
      texture2D(u_texture, v_texCoord + vec2(-offset.x, offset.y)) +
      texture2D(u_texture, v_texCoord + vec2(offset.x, offset.y))
    );
  }
`;
  var SMOOTHING_SHADER = `
  precision highp float;
  uniform sampler2D u_texture;
  uniform sampler2D u_history;
  uniform float u_response;
  uniform float u_minStep;
  varying vec2 v_texCoord;

  void main() {
    vec4 history = texture2D(u_history, v_texCoord);
    vec4 current = texture2D(u_texture, v_texCoord);
    vec4 blended = mix(history, current, u_response);
    vec4 remaining = current - history;
    vec4 minimal = history + sign(remaining) * min(abs(remaining), vec4(u_minStep));
    gl_FragColor = mix(
      minimal,
      blended,
      step(abs(minimal - history), abs(blended - history))
    );
  }
`;
  var Kawarp = class {
    canvas;
    gl;
    halfFloatExt = null;
    halfFloatLinearExt = null;
    // Shader programs
    blurProgram;
    blendProgram;
    tintProgram;
    warpProgram;
    outputProgram;
    // Buffers
    positionBuffer;
    texCoordBuffer;
    // Source texture (original image)
    sourceTexture;
    // Small FBOs for blur (BLUR_SIZE x BLUR_SIZE)
    blurFBO1;
    blurFBO2;
    // Album FBOs for crossfade (BLUR_SIZE x BLUR_SIZE)
    currentAlbumFBO;
    nextAlbumFBO;
    // Full-res FBO for warp output
    warpFBO;
    // Animation state
    animationId = null;
    lastFrameTime = 0;
    accumulatedTime = 0;
    isPlaying = false;
    disposed = false;
    // Transition state
    isTransitioning = false;
    transitionStartTime = 0;
    _transitionDuration;
    // Options
    _warpIntensity;
    _blurPasses;
    _animationSpeed;
    _targetAnimationSpeed;
    _saturation;
    _tintColor;
    _tintIntensity;
    _dithering;
    _scale;
    hasImage = false;
    // WebGL2 high-precision state (null/false on the default WebGL1 path)
    gl2;
    halfFloatRenderTargets = false;
    float32RenderTargets = false;
    floatLinearFiltering = false;
    _highPrecisionOutput = false;
    highPrecisionInputRequested;
    // Texture the blur reads from: the image source or the latest video frame
    activeSourceTexture;
    imageSourceWidth = 0;
    imageSourceHeight = 0;
    videoFrameWidth = 0;
    videoFrameHeight = 0;
    // Video source state
    video = null;
    // An in-flight image load is dropped only when a later loadVideo call has
    // since put a video frame on screen
    videoLoadCount = 0;
    // videoLoadCount of the last video that put a frame on screen
    shownVideoLoad = 0;
    videoOptions = { ...DEFAULT_VIDEO_OPTIONS };
    videoCallbackId = null;
    videoUploadTexture = null;
    videoStages = [];
    videoHistory = [];
    videoHistoryIndex = 0;
    hasVideoHistory = false;
    // Latest downsampled frame the history is easing toward, null once settled
    videoSmoothingTarget = null;
    videoSmoothingTargetAt = 0;
    videoSmoothedAt = 0;
    // Smallest change the history format can store; 0 for float32
    videoHistoryStep = 0;
    // Ideal time of the last sample on the frameRate cadence
    videoSampleSlot = Number.NEGATIVE_INFINITY;
    videoTargetsStale = true;
    videoSourceWidth = 0;
    videoSourceHeight = 0;
    videoFrameTime = 0;
    videoMediaTime = 0;
    videoFrameShown = false;
    videoFramePending = false;
    retainedVideoFrame = null;
    samplingPrograms = null;
    sampleTargets = [];
    sampleTargetsLayout = [0, 0, 0];
    pendingSampleSize = 0;
    samplePixelBuffer = null;
    pendingSample = null;
    // Cached attribute locations
    attribs;
    // Cached uniform locations
    uniforms;
    constructor(canvas2, options = {}) {
      this.canvas = canvas2;
      const contextAttributes = {
        alpha: true,
        antialias: false,
        depth: false,
        stencil: false,
        preserveDrawingBuffer: true,
        powerPreference: "high-performance"
      };
      const gl2 = options.highPrecisionInput || options.highPrecisionOutput ? canvas2.getContext("webgl2", contextAttributes) : null;
      const gl = gl2 ?? canvas2.getContext("webgl", contextAttributes);
      if (!gl)
        throw new Error("WebGL not supported");
      this.gl = gl;
      this.gl2 = gl2;
      this.highPrecisionInputRequested = !!gl2 && !!options.highPrecisionInput;
      this.halfFloatExt = gl.getExtension("OES_texture_half_float");
      this.halfFloatLinearExt = gl.getExtension("OES_texture_half_float_linear");
      if (gl2) {
        this.float32RenderTargets = !!gl2.getExtension("EXT_color_buffer_float");
        this.halfFloatRenderTargets = this.float32RenderTargets || !!gl2.getExtension("EXT_color_buffer_half_float");
        this.floatLinearFiltering = !!gl2.getExtension("OES_texture_float_linear");
      }
      this._warpIntensity = options.warpIntensity ?? 1;
      this._blurPasses = options.blurPasses ?? 8;
      this._animationSpeed = options.animationSpeed ?? 1;
      this._targetAnimationSpeed = this._animationSpeed;
      this._transitionDuration = options.transitionDuration ?? 1e3;
      this._saturation = options.saturation ?? 1.5;
      this._tintColor = options.tintColor ?? [0.157, 0.157, 0.235];
      this._tintIntensity = options.tintIntensity ?? 0.15;
      this._dithering = options.dithering ?? 8e-3;
      this._scale = options.scale ?? 1;
      this.blurProgram = this.createProgram(VERTEX_SHADER, KAWASE_BLUR_SHADER);
      this.blendProgram = this.createProgram(VERTEX_SHADER, BLEND_SHADER);
      this.tintProgram = this.createProgram(VERTEX_SHADER, TINT_SHADER);
      this.warpProgram = this.createProgram(VERTEX_SHADER, DOMAIN_WARP_SHADER);
      this.outputProgram = this.createProgram(VERTEX_SHADER, OUTPUT_SHADER);
      this.attribs = {
        position: gl.getAttribLocation(this.blurProgram, "a_position"),
        texCoord: gl.getAttribLocation(this.blurProgram, "a_texCoord")
      };
      this.uniforms = {
        blur: {
          resolution: gl.getUniformLocation(this.blurProgram, "u_resolution"),
          texture: gl.getUniformLocation(this.blurProgram, "u_texture"),
          offset: gl.getUniformLocation(this.blurProgram, "u_offset")
        },
        blend: {
          texture1: gl.getUniformLocation(this.blendProgram, "u_texture1"),
          texture2: gl.getUniformLocation(this.blendProgram, "u_texture2"),
          blend: gl.getUniformLocation(this.blendProgram, "u_blend")
        },
        warp: {
          texture: gl.getUniformLocation(this.warpProgram, "u_texture"),
          time: gl.getUniformLocation(this.warpProgram, "u_time"),
          intensity: gl.getUniformLocation(this.warpProgram, "u_intensity")
        },
        tint: {
          texture: gl.getUniformLocation(this.tintProgram, "u_texture"),
          tintColor: gl.getUniformLocation(this.tintProgram, "u_tintColor"),
          tintIntensity: gl.getUniformLocation(this.tintProgram, "u_tintIntensity")
        },
        output: {
          texture: gl.getUniformLocation(this.outputProgram, "u_texture"),
          saturation: gl.getUniformLocation(this.outputProgram, "u_saturation"),
          dithering: gl.getUniformLocation(this.outputProgram, "u_dithering"),
          time: gl.getUniformLocation(this.outputProgram, "u_time"),
          scale: gl.getUniformLocation(this.outputProgram, "u_scale"),
          resolution: gl.getUniformLocation(this.outputProgram, "u_resolution")
        }
      };
      this.positionBuffer = this.createBuffer(new Float32Array([-1, -1, 1, -1, -1, 1, -1, 1, 1, -1, 1, 1]));
      this.texCoordBuffer = this.createBuffer(new Float32Array([0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1]));
      this.sourceTexture = this.createTexture();
      this.activeSourceTexture = this.sourceTexture;
      this.blurFBO1 = this.createFramebuffer(BLUR_SIZE, BLUR_SIZE, true);
      this.blurFBO2 = this.createFramebuffer(BLUR_SIZE, BLUR_SIZE, true);
      this.currentAlbumFBO = this.createFramebuffer(BLUR_SIZE, BLUR_SIZE, true);
      this.nextAlbumFBO = this.createFramebuffer(BLUR_SIZE, BLUR_SIZE, true);
      const initW = Math.max(1, canvas2.width || 640);
      const initH = Math.max(1, canvas2.height || 360);
      this.warpFBO = this.createFramebuffer(initW, initH, true);
      if (options.highPrecisionOutput)
        this.applyFloatDrawingBuffer();
    }
    /** Whether the drawing buffer is float16 (requested via highPrecisionOutput) */
    get highPrecisionOutput() {
      return this._highPrecisionOutput;
    }
    /** Whether smoothed video keeps float32 color history (requested via highPrecisionInput) */
    get highPrecisionInput() {
      return this.highPrecisionInputRequested && this.float32RenderTargets;
    }
    // Getters and setters
    get warpIntensity() {
      return this._warpIntensity;
    }
    set warpIntensity(value) {
      this._warpIntensity = Math.max(0, Math.min(1, value));
    }
    get blurPasses() {
      return this._blurPasses;
    }
    set blurPasses(value) {
      const newValue = Math.max(0, Math.min(40, Math.floor(value)));
      if (newValue !== this._blurPasses) {
        this._blurPasses = newValue;
        if (this.hasImage) {
          this.reblurCurrentImage();
        }
      }
    }
    get animationSpeed() {
      return this._targetAnimationSpeed;
    }
    set animationSpeed(value) {
      this._targetAnimationSpeed = Math.max(0, Math.min(16, value));
    }
    get transitionDuration() {
      return this._transitionDuration;
    }
    set transitionDuration(value) {
      this._transitionDuration = Math.max(0, Math.min(5e3, value));
    }
    get saturation() {
      return this._saturation;
    }
    set saturation(value) {
      this._saturation = Math.max(0, Math.min(3, value));
    }
    get tintColor() {
      return this._tintColor;
    }
    set tintColor(value) {
      const newValue = value.map((v) => Math.max(0, Math.min(1, v)));
      const changed = newValue.some((v, i) => v !== this._tintColor[i]);
      if (changed) {
        this._tintColor = newValue;
        if (this.hasImage) {
          this.reblurCurrentImage();
        }
      }
    }
    get tintIntensity() {
      return this._tintIntensity;
    }
    set tintIntensity(value) {
      const newValue = Math.max(0, Math.min(1, value));
      if (newValue !== this._tintIntensity) {
        this._tintIntensity = newValue;
        if (this.hasImage) {
          this.reblurCurrentImage();
        }
      }
    }
    get dithering() {
      return this._dithering;
    }
    set dithering(value) {
      this._dithering = Math.max(0, Math.min(0.1, value));
    }
    get scale() {
      return this._scale;
    }
    set scale(value) {
      this._scale = Math.max(0.01, Math.min(4, value));
    }
    setOptions(options) {
      if (options.warpIntensity !== void 0)
        this.warpIntensity = options.warpIntensity;
      if (options.blurPasses !== void 0)
        this.blurPasses = options.blurPasses;
      if (options.animationSpeed !== void 0)
        this.animationSpeed = options.animationSpeed;
      if (options.transitionDuration !== void 0)
        this.transitionDuration = options.transitionDuration;
      if (options.saturation !== void 0)
        this.saturation = options.saturation;
      if (options.tintColor !== void 0)
        this.tintColor = options.tintColor;
      if (options.tintIntensity !== void 0)
        this.tintIntensity = options.tintIntensity;
      if (options.dithering !== void 0)
        this.dithering = options.dithering;
      if (options.scale !== void 0)
        this.scale = options.scale;
    }
    getOptions() {
      return {
        warpIntensity: this._warpIntensity,
        blurPasses: this._blurPasses,
        animationSpeed: this._targetAnimationSpeed,
        transitionDuration: this._transitionDuration,
        saturation: this._saturation,
        tintColor: this._tintColor,
        tintIntensity: this._tintIntensity,
        dithering: this._dithering,
        scale: this._scale
      };
    }
    // Image loading methods
    async loadImage(src) {
      if (!src)
        return;
      const videoLoadsAtStart = this.videoLoadCount;
      let bitmap = null;
      try {
        const res = await fetch(src, { mode: "cors" });
        if (res.ok) {
          const blob = await res.blob();
          bitmap = await createImageBitmap(blob);
        }
      } catch {
      }
      if (!bitmap) {
        bitmap = await new Promise((resolve, reject) => {
          const img = new Image();
          img.crossOrigin = "anonymous";
          img.onload = () => resolve(img);
          img.onerror = () => reject(new Error(`Failed to load image: ${src}`));
          img.src = src;
        });
      }
      if (this.disposed || this.shownVideoLoad > videoLoadsAtStart) {
        if ("close" in bitmap)
          bitmap.close();
        return;
      }
      const posterForVideo = !!this.video && this.videoLoadCount !== videoLoadsAtStart;
      const gl = this.gl;
      gl.bindTexture(gl.TEXTURE_2D, this.sourceTexture);
      gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, 0);
      gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, bitmap);
      [this.imageSourceWidth, this.imageSourceHeight] = textureSourceSize(bitmap);
      if ("close" in bitmap && typeof bitmap.close === "function") {
        bitmap.close();
      }
      this.processNewImage(this.sourceTexture, posterForVideo);
    }
    loadImageElement(source) {
      this.showImageElement(source, false);
    }
    showImageElement(source, posterForVideo) {
      this.gl.bindTexture(this.gl.TEXTURE_2D, this.sourceTexture);
      this.gl.texImage2D(this.gl.TEXTURE_2D, 0, this.gl.RGBA, this.gl.RGBA, this.gl.UNSIGNED_BYTE, source);
      [this.imageSourceWidth, this.imageSourceHeight] = textureSourceSize(source);
      this.processNewImage(this.sourceTexture, posterForVideo);
    }
    loadImageData(data, width, height) {
      this.gl.bindTexture(this.gl.TEXTURE_2D, this.sourceTexture);
      this.gl.texImage2D(this.gl.TEXTURE_2D, 0, this.gl.RGBA, width, height, 0, this.gl.RGBA, this.gl.UNSIGNED_BYTE, data instanceof Uint8ClampedArray ? new Uint8Array(data.buffer) : data);
      this.imageSourceWidth = width;
      this.imageSourceHeight = height;
      this.processNewImage();
    }
    loadFromImageData(imageData) {
      this.loadImageData(imageData.data, imageData.width, imageData.height);
    }
    async loadBlob(blob) {
      const videoLoadsAtStart = this.videoLoadCount;
      const bitmap = await createImageBitmap(blob);
      if (this.disposed || this.shownVideoLoad > videoLoadsAtStart) {
        bitmap.close();
        return;
      }
      const posterForVideo = !!this.video && this.videoLoadCount !== videoLoadsAtStart;
      this.showImageElement(bitmap, posterForVideo);
      bitmap.close();
    }
    loadBase64(base64) {
      const src = base64.startsWith("data:") ? base64 : `data:image/png;base64,${base64}`;
      return this.loadImage(src);
    }
    async loadArrayBuffer(buffer, mimeType = "image/png") {
      const blob = new Blob([buffer], { type: mimeType });
      return this.loadBlob(blob);
    }
    loadGradient(colors, angle = 135) {
      const size = 512;
      const canvas2 = document.createElement("canvas");
      canvas2.width = size;
      canvas2.height = size;
      const ctx = canvas2.getContext("2d");
      if (!ctx)
        return;
      const angleRad = angle * Math.PI / 180;
      const x1 = size / 2 - Math.cos(angleRad) * size;
      const y1 = size / 2 - Math.sin(angleRad) * size;
      const x2 = size / 2 + Math.cos(angleRad) * size;
      const y2 = size / 2 + Math.sin(angleRad) * size;
      const gradient = ctx.createLinearGradient(x1, y1, x2, y2);
      colors.forEach((color, i) => {
        gradient.addColorStop(i / (colors.length - 1), color);
      });
      ctx.fillStyle = gradient;
      ctx.fillRect(0, 0, size, size);
      this.loadImageElement(canvas2);
    }
    /**
     * Use a playing video as the source. Each decoded frame is imported on the
     * GPU, downsampled in stages, optionally smoothed over time, and blurred in
     * place. The first frame crossfades from the current image (instantly on a
     * stopped instance). Video renders
     * upright; images keep their historical flipped orientation.
     *
     * Calling again with the same element only updates the options. A stopped
     * instance skips frames from a playing video and draws single frames from a
     * paused one, so seeking while paused stays visible.
     */
    loadVideo(video, options = {}) {
      if (this.disposed)
        return;
      if (typeof video.requestVideoFrameCallback !== "function") {
        throw new Error("Video sources require requestVideoFrameCallback");
      }
      const isNewVideo = this.video !== video;
      if (isNewVideo) {
        this.videoLoadCount++;
        this.unloadVideo();
        this.video = video;
        this.videoFrameShown = false;
        this.hasVideoHistory = false;
        this.videoSampleSlot = Number.NEGATIVE_INFINITY;
      }
      const nextOptions = {
        sampleWidth: Math.round(boundedOption(options.sampleWidth, DEFAULT_VIDEO_OPTIONS.sampleWidth, 1, 1024)),
        sampleHeight: Math.round(boundedOption(options.sampleHeight, DEFAULT_VIDEO_OPTIONS.sampleHeight, 1, 1024)),
        downsampleFactor: boundedOption(options.downsampleFactor, DEFAULT_VIDEO_OPTIONS.downsampleFactor, 1.25, 4),
        frameRate: boundedOption(options.frameRate, DEFAULT_VIDEO_OPTIONS.frameRate, 0, 240),
        smoothing: boundedOption(options.smoothing, DEFAULT_VIDEO_OPTIONS.smoothing, 0, 1e4),
        onError: options.onError
      };
      const previousOptions = this.videoOptions;
      if (isNewVideo || nextOptions.sampleWidth !== previousOptions.sampleWidth || nextOptions.sampleHeight !== previousOptions.sampleHeight || nextOptions.downsampleFactor !== previousOptions.downsampleFactor || nextOptions.smoothing > 0 !== previousOptions.smoothing > 0) {
        this.videoTargetsStale = true;
      }
      this.videoOptions = nextOptions;
      this.requestVideoFrame();
      if (video.readyState >= video.HAVE_CURRENT_DATA && (isNewVideo || video.paused && this.videoTargetsStale)) {
        this.processVideoFrame(performance.now(), video.currentTime);
      }
    }
    /**
     * Stop following the video. The last frame stays on screen until the next
     * image or video is loaded.
     */
    unloadVideo() {
      const video = this.video;
      if (!video)
        return;
      if (this.videoCallbackId !== null) {
        video.cancelVideoFrameCallback(this.videoCallbackId);
        this.videoCallbackId = null;
      }
      video.removeEventListener("pause", this.resumeVideoCallbacks);
      this.video = null;
      this.videoFramePending = false;
      this.releaseVideoTargets();
      if (this.videoUploadTexture) {
        this.gl.deleteTexture(this.videoUploadTexture);
        this.videoUploadTexture = null;
      }
    }
    /**
     * Read a small RGBA8 thumbnail (size x size, bottom row of the rendered
     * orientation first) of the current source, e.g. to measure brightness. WebGL2 reads asynchronously
     * through a pixel buffer and fence; WebGL1 reads synchronously.
     * Resolves to null when there is no source or the instance is disposed.
     */
    sampleSource(size = 32) {
      if (this.disposed || !this.hasImage)
        return Promise.resolve(null);
      const edge = Math.round(boundedOption(size, 32, 1, BLUR_SIZE));
      if (this.pendingSample) {
        return this.pendingSampleSize === edge ? this.pendingSample : this.pendingSample.then(() => this.sampleSource(edge));
      }
      const gl = this.gl;
      const [sourceWidth, sourceHeight] = this.activeSourceTexture === this.sourceTexture ? [this.imageSourceWidth, this.imageSourceHeight] : [this.videoFrameWidth, this.videoFrameHeight];
      this.prepareSampleTargets(sourceWidth, sourceHeight, edge);
      let sampledTexture = this.activeSourceTexture;
      for (const stage of this.sampleTargets) {
        this.drawDownsample(sampledTexture, stage);
        sampledTexture = stage.texture;
      }
      const pixels = new Uint8Array(edge * edge * 4);
      const gl2 = this.gl2;
      if (!gl2) {
        gl.readPixels(0, 0, edge, edge, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
        return Promise.resolve(pixels);
      }
      this.samplePixelBuffer ??= gl2.createBuffer();
      gl2.bindBuffer(gl2.PIXEL_PACK_BUFFER, this.samplePixelBuffer);
      gl2.bufferData(gl2.PIXEL_PACK_BUFFER, pixels.byteLength, gl2.STREAM_READ);
      gl2.readPixels(0, 0, edge, edge, gl2.RGBA, gl2.UNSIGNED_BYTE, 0);
      gl2.bindBuffer(gl2.PIXEL_PACK_BUFFER, null);
      const fence = gl2.fenceSync(gl2.SYNC_GPU_COMMANDS_COMPLETE, 0);
      if (!fence)
        return Promise.resolve(null);
      gl2.flush();
      const sample = new Promise((resolve) => {
        const poll = () => {
          if (this.disposed) {
            gl2.deleteSync(fence);
            resolve(null);
            return;
          }
          const status = gl2.clientWaitSync(fence, 0, 0);
          if (status === gl2.TIMEOUT_EXPIRED) {
            setTimeout(poll, 4);
            return;
          }
          gl2.deleteSync(fence);
          if (status === gl2.WAIT_FAILED) {
            resolve(null);
            return;
          }
          gl2.bindBuffer(gl2.PIXEL_PACK_BUFFER, this.samplePixelBuffer);
          gl2.getBufferSubData(gl2.PIXEL_PACK_BUFFER, 0, pixels);
          gl2.bindBuffer(gl2.PIXEL_PACK_BUFFER, null);
          resolve(pixels);
        };
        setTimeout(poll, 0);
      }).finally(() => {
        this.pendingSample = null;
      });
      this.pendingSample = sample;
      this.pendingSampleSize = edge;
      return sample;
    }
    /**
     * Halving stages from the source down to size x size. A single 4-tap
     * reduction from full-resolution artwork would skip most texels and alias.
     */
    prepareSampleTargets(sourceWidth, sourceHeight, edge) {
      const [cachedWidth, cachedHeight, cachedEdge] = this.sampleTargetsLayout;
      if (sourceWidth === cachedWidth && sourceHeight === cachedHeight && edge === cachedEdge) {
        return;
      }
      for (const target of this.sampleTargets)
        this.deleteFramebuffer(target);
      this.sampleTargets = [];
      let width = sourceWidth;
      let height = sourceHeight;
      while (width > edge * 2 || height > edge * 2) {
        width = Math.max(edge, Math.ceil(width / 2));
        height = Math.max(edge, Math.ceil(height / 2));
        this.sampleTargets.push(this.createByteFramebuffer(width, height));
      }
      this.sampleTargets.push(this.createByteFramebuffer(edge, edge));
      this.sampleTargetsLayout = [sourceWidth, sourceHeight, edge];
    }
    createByteFramebuffer(width, height) {
      return this.gl2 ? this.createSizedFramebuffer(width, height, this.gl2.RGBA8) : this.createFramebuffer(width, height);
    }
    requestVideoFrame() {
      if (!this.video || this.videoCallbackId !== null)
        return;
      this.videoCallbackId = this.video.requestVideoFrameCallback(this.handleVideoFrame);
    }
    handleVideoFrame = (now, metadata) => {
      this.videoCallbackId = null;
      const video = this.video;
      if (!video || this.disposed)
        return;
      if (!this.isPlaying && !video.paused) {
        this.videoFramePending = true;
        video.addEventListener("pause", this.resumeVideoCallbacks, {
          once: true
        });
        return;
      }
      this.requestVideoFrame();
      const { frameRate } = this.videoOptions;
      if (frameRate > 0 && !video.paused) {
        const interval = 1e3 / frameRate;
        if (now < this.videoSampleSlot + interval * 0.75)
          return;
      }
      this.processVideoFrame(now, metadata.mediaTime);
    };
    resumeVideoCallbacks = () => {
      this.requestVideoFrame();
    };
    processVideoFrame(now, mediaTime) {
      const video = this.video;
      if (!video || video.readyState < video.HAVE_CURRENT_DATA || video.videoWidth === 0 || video.videoHeight === 0) {
        return;
      }
      const gl = this.gl;
      const elapsedMs = now - this.videoFrameTime;
      try {
        this.prepareVideoTargets(video.videoWidth, video.videoHeight);
        gl.activeTexture(gl.TEXTURE0);
        gl.bindTexture(gl.TEXTURE_2D, this.videoUploadTexture);
        gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
        gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, video);
      } catch (error) {
        const { onError } = this.videoOptions;
        this.unloadVideo();
        onError?.(error);
        return;
      } finally {
        gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, false);
      }
      let frameTexture = this.videoUploadTexture;
      for (const stage of this.videoStages) {
        this.drawDownsample(frameTexture, stage);
        frameTexture = stage.texture;
      }
      const { smoothing } = this.videoOptions;
      let easedByRenderLoop = false;
      if (smoothing > 0) {
        const expectedMediaAdvance = elapsedMs / 1e3 * video.playbackRate;
        const seeked = Math.abs(mediaTime - this.videoMediaTime - expectedMediaAdvance) > VIDEO_SEEK_THRESHOLD_SECONDS;
        const snap = !this.hasVideoHistory || !this.videoFrameShown || !this.isPlaying || video.paused || seeked;
        if (snap) {
          frameTexture = this.drawSmoothing(frameTexture, 1);
          this.videoSmoothingTarget = null;
        } else {
          if (!this.videoSmoothingTarget)
            this.videoSmoothedAt = now;
          this.videoSmoothingTarget = frameTexture;
          this.videoSmoothingTargetAt = now;
          easedByRenderLoop = true;
        }
        this.hasVideoHistory = true;
      } else {
        this.hasVideoHistory = false;
      }
      const { frameRate } = this.videoOptions;
      if (frameRate > 0) {
        const interval = 1e3 / frameRate;
        this.videoSampleSlot = now - this.videoSampleSlot > interval * 2 ? now : this.videoSampleSlot + interval;
      }
      this.videoFrameTime = now;
      this.videoMediaTime = mediaTime;
      this.videoFrameWidth = this.videoOptions.sampleWidth;
      this.videoFrameHeight = this.videoOptions.sampleHeight;
      if (!easedByRenderLoop)
        this.showVideoFrame(frameTexture);
    }
    // Easing per animation frame keeps a low frame rate source from stepping
    advanceVideoSmoothing(timestamp) {
      const target = this.videoSmoothingTarget;
      if (!target)
        return;
      const { smoothing } = this.videoOptions;
      const settled = timestamp - this.videoSmoothingTargetAt >= smoothing * VIDEO_SMOOTHING_SETTLE_RESPONSES;
      const elapsedMs = Math.max(0, timestamp - this.videoSmoothedAt);
      this.videoSmoothedAt = timestamp;
      const response = settled ? 1 : 1 - Math.exp(-elapsedMs / smoothing);
      this.activeSourceTexture = this.drawSmoothing(target, response);
      this.releaseRetainedVideoFrame();
      this.blurSourceInto(this.nextAlbumFBO);
      if (settled)
        this.videoSmoothingTarget = null;
    }
    showVideoFrame(texture) {
      if (this.videoFrameShown) {
        this.activeSourceTexture = texture;
        this.releaseRetainedVideoFrame();
        this.blurSourceInto(this.nextAlbumFBO);
      } else {
        this.videoFrameShown = true;
        this.shownVideoLoad = this.videoLoadCount;
        this.processNewImage(texture);
        if (!this.isPlaying)
          this.isTransitioning = false;
      }
      if (!this.isPlaying)
        this.render(this.accumulatedTime);
    }
    prepareVideoTargets(videoWidth, videoHeight) {
      if (!this.videoTargetsStale && videoWidth === this.videoSourceWidth && videoHeight === this.videoSourceHeight) {
        return;
      }
      this.releaseVideoTargets();
      this.videoUploadTexture ??= this.createTexture();
      const { sampleWidth, sampleHeight, downsampleFactor, smoothing } = this.videoOptions;
      let width = videoWidth;
      let height = videoHeight;
      while (width > sampleWidth * downsampleFactor || height > sampleHeight * downsampleFactor) {
        const nextWidth = Math.max(sampleWidth, Math.ceil(width / downsampleFactor));
        const nextHeight = Math.max(sampleHeight, Math.ceil(height / downsampleFactor));
        if (nextWidth === width && nextHeight === height)
          break;
        width = nextWidth;
        height = nextHeight;
        this.videoStages.push(this.createFramebuffer(width, height, true));
      }
      this.videoStages.push(this.createFramebuffer(sampleWidth, sampleHeight, true));
      if (smoothing > 0) {
        const float32History = this.highPrecisionInputRequested && this.float32RenderTargets;
        for (let i = 0; i < 2; i++) {
          this.videoHistory.push(this.gl2 && float32History ? this.createSizedFramebuffer(sampleWidth, sampleHeight, this.gl2.RGBA32F) : this.createFramebuffer(sampleWidth, sampleHeight, true));
        }
        const halfFloatHistory = this.gl2 ? this.halfFloatRenderTargets : !!(this.halfFloatExt && this.halfFloatLinearExt);
        this.videoHistoryStep = float32History ? this.float32RenderTargets ? 0 : 1 / 255 : halfFloatHistory ? 1 / 1024 : 1 / 255;
      }
      this.hasVideoHistory = false;
      this.videoSourceWidth = videoWidth;
      this.videoSourceHeight = videoHeight;
      this.videoTargetsStale = false;
    }
    /**
     * Free video render targets. The one the blur currently reads from is
     * retained so re-blurring keeps working until another source replaces it.
     */
    releaseVideoTargets() {
      for (const target of [...this.videoStages, ...this.videoHistory]) {
        if (target.texture === this.activeSourceTexture) {
          this.releaseRetainedVideoFrame();
          this.retainedVideoFrame = target;
        } else {
          this.deleteFramebuffer(target);
        }
      }
      this.videoStages = [];
      this.videoHistory = [];
      this.videoSmoothingTarget = null;
      this.videoTargetsStale = true;
    }
    releaseRetainedVideoFrame() {
      if (!this.retainedVideoFrame || this.retainedVideoFrame.texture === this.activeSourceTexture) {
        return;
      }
      this.deleteFramebuffer(this.retainedVideoFrame);
      this.retainedVideoFrame = null;
    }
    getSamplingPrograms() {
      if (this.samplingPrograms)
        return this.samplingPrograms;
      const gl = this.gl;
      const downsample = this.createProgram(VERTEX_SHADER, DOWNSAMPLE_SHADER);
      const smoothing = this.createProgram(VERTEX_SHADER, SMOOTHING_SHADER);
      this.samplingPrograms = {
        downsample,
        smoothing,
        downsampleUniforms: {
          texture: gl.getUniformLocation(downsample, "u_texture"),
          texelSize: gl.getUniformLocation(downsample, "u_texelSize")
        },
        smoothingUniforms: {
          texture: gl.getUniformLocation(smoothing, "u_texture"),
          history: gl.getUniformLocation(smoothing, "u_history"),
          response: gl.getUniformLocation(smoothing, "u_response"),
          minStep: gl.getUniformLocation(smoothing, "u_minStep")
        }
      };
      return this.samplingPrograms;
    }
    drawDownsample(source, target) {
      const gl = this.gl;
      const programs = this.getSamplingPrograms();
      gl.useProgram(programs.downsample);
      this.setupAttributes();
      gl.bindFramebuffer(gl.FRAMEBUFFER, target.framebuffer);
      gl.viewport(0, 0, target.width, target.height);
      gl.activeTexture(gl.TEXTURE0);
      gl.bindTexture(gl.TEXTURE_2D, source);
      gl.uniform1i(programs.downsampleUniforms.texture, 0);
      gl.uniform2f(programs.downsampleUniforms.texelSize, 1 / target.width, 1 / target.height);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
    }
    drawSmoothing(source, response) {
      const gl = this.gl;
      const programs = this.getSamplingPrograms();
      const history = this.videoHistory[this.videoHistoryIndex];
      this.videoHistoryIndex = 1 - this.videoHistoryIndex;
      const target = this.videoHistory[this.videoHistoryIndex];
      if (!history || !target)
        return source;
      gl.useProgram(programs.smoothing);
      this.setupAttributes();
      gl.bindFramebuffer(gl.FRAMEBUFFER, target.framebuffer);
      gl.viewport(0, 0, target.width, target.height);
      gl.activeTexture(gl.TEXTURE1);
      gl.bindTexture(gl.TEXTURE_2D, history.texture);
      gl.uniform1i(programs.smoothingUniforms.history, 1);
      gl.activeTexture(gl.TEXTURE0);
      gl.bindTexture(gl.TEXTURE_2D, source);
      gl.uniform1i(programs.smoothingUniforms.texture, 0);
      gl.uniform1f(programs.smoothingUniforms.response, response);
      gl.uniform1f(programs.smoothingUniforms.minStep, this.videoHistoryStep);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
      return target.texture;
    }
    /**
     * Process a new image: blur it and start transition
     * This is the key optimization - blur only runs here, not every frame!
     */
    processNewImage(texture = this.sourceTexture, keepVideo = false) {
      if (texture === this.sourceTexture && !keepVideo)
        this.unloadVideo();
      this.activeSourceTexture = texture;
      this.releaseRetainedVideoFrame();
      if (!this.hasImage) {
        this.blurSourceInto(this.nextAlbumFBO);
        this.blurSourceInto(this.currentAlbumFBO);
        this.hasImage = true;
        this.isTransitioning = false;
        return;
      }
      const previousAlbumFBO = this.currentAlbumFBO;
      this.currentAlbumFBO = this.nextAlbumFBO;
      this.nextAlbumFBO = previousAlbumFBO;
      this.blurSourceInto(this.nextAlbumFBO);
      this.isTransitioning = true;
      this.transitionStartTime = performance.now();
    }
    /**
     * Re-blur the current image (used when blurPasses changes)
     * Updates nextAlbumFBO in place without starting a transition
     */
    reblurCurrentImage() {
      this.blurSourceInto(this.nextAlbumFBO);
    }
    /**
     * Blur the source texture into the target FBO (with tint applied before blur)
     */
    blurSourceInto(targetFBO) {
      const gl = this.gl;
      gl.useProgram(this.tintProgram);
      this.setupAttributes();
      gl.bindFramebuffer(gl.FRAMEBUFFER, this.blurFBO1.framebuffer);
      gl.viewport(0, 0, BLUR_SIZE, BLUR_SIZE);
      gl.activeTexture(gl.TEXTURE0);
      gl.bindTexture(gl.TEXTURE_2D, this.activeSourceTexture);
      gl.uniform1i(this.uniforms.tint.texture, 0);
      gl.uniform3fv(this.uniforms.tint.tintColor, this._tintColor);
      gl.uniform1f(this.uniforms.tint.tintIntensity, this._tintIntensity);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
      gl.useProgram(this.blurProgram);
      this.setupAttributes();
      gl.uniform2f(this.uniforms.blur.resolution, BLUR_SIZE, BLUR_SIZE);
      gl.uniform1i(this.uniforms.blur.texture, 0);
      let readFBO = this.blurFBO1;
      let writeFBO = this.blurFBO2;
      for (let i = 0; i < this._blurPasses; i++) {
        gl.bindFramebuffer(gl.FRAMEBUFFER, writeFBO.framebuffer);
        gl.viewport(0, 0, BLUR_SIZE, BLUR_SIZE);
        gl.bindTexture(gl.TEXTURE_2D, readFBO.texture);
        gl.uniform1f(this.uniforms.blur.offset, i + 0.5);
        gl.drawArrays(gl.TRIANGLES, 0, 6);
        const swap = readFBO;
        readFBO = writeFBO;
        writeFBO = swap;
      }
      gl.bindFramebuffer(gl.FRAMEBUFFER, targetFBO.framebuffer);
      gl.viewport(0, 0, BLUR_SIZE, BLUR_SIZE);
      gl.bindTexture(gl.TEXTURE_2D, readFBO.texture);
      gl.uniform1f(this.uniforms.blur.offset, 0);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
    }
    resize() {
      const width = Math.max(1, this.canvas.width);
      const height = Math.max(1, this.canvas.height);
      if (this.warpFBO.width !== width || this.warpFBO.height !== height) {
        if (this.warpFBO)
          this.deleteFramebuffer(this.warpFBO);
        this.warpFBO = this.createFramebuffer(width, height, true);
      }
    }
    start() {
      if (this.disposed || this.isPlaying)
        return;
      this.isPlaying = true;
      this.lastFrameTime = performance.now();
      if (this.video) {
        this.video.removeEventListener("pause", this.resumeVideoCallbacks);
        this.requestVideoFrame();
        if (this.videoFramePending) {
          this.videoFramePending = false;
          this.processVideoFrame(this.lastFrameTime, this.video.currentTime);
        }
      }
      this.animationId = requestAnimationFrame(this.renderLoop);
    }
    stop() {
      this.isPlaying = false;
      if (this.animationId !== null) {
        cancelAnimationFrame(this.animationId);
        this.animationId = null;
      }
    }
    renderFrame(time) {
      const now = performance.now();
      if (time !== void 0) {
        this.render(time, now);
      } else {
        const dt = (now - this.lastFrameTime) / 1e3;
        this.lastFrameTime = now;
        this._animationSpeed += (this._targetAnimationSpeed - this._animationSpeed) * 0.05;
        this.accumulatedTime += dt * this._animationSpeed;
        this.render(this.accumulatedTime, now);
      }
    }
    dispose() {
      if (this.disposed)
        return;
      this.disposed = true;
      this.stop();
      this.unloadVideo();
      const gl = this.gl;
      if (this.retainedVideoFrame)
        this.deleteFramebuffer(this.retainedVideoFrame);
      for (const target of this.sampleTargets)
        this.deleteFramebuffer(target);
      if (this.samplingPrograms) {
        gl.deleteProgram(this.samplingPrograms.downsample);
        gl.deleteProgram(this.samplingPrograms.smoothing);
      }
      this.gl2?.deleteBuffer(this.samplePixelBuffer);
      gl.deleteProgram(this.blurProgram);
      gl.deleteProgram(this.blendProgram);
      gl.deleteProgram(this.tintProgram);
      gl.deleteProgram(this.warpProgram);
      gl.deleteProgram(this.outputProgram);
      gl.deleteBuffer(this.positionBuffer);
      gl.deleteBuffer(this.texCoordBuffer);
      gl.deleteTexture(this.sourceTexture);
      this.deleteFramebuffer(this.blurFBO1);
      this.deleteFramebuffer(this.blurFBO2);
      this.deleteFramebuffer(this.currentAlbumFBO);
      this.deleteFramebuffer(this.nextAlbumFBO);
      this.deleteFramebuffer(this.warpFBO);
    }
    renderLoop = (timestamp) => {
      if (!this.isPlaying)
        return;
      const dt = (timestamp - this.lastFrameTime) / 1e3;
      this.lastFrameTime = timestamp;
      this._animationSpeed += (this._targetAnimationSpeed - this._animationSpeed) * 0.05;
      this.accumulatedTime += dt * this._animationSpeed;
      this.render(this.accumulatedTime, timestamp);
      this.animationId = requestAnimationFrame(this.renderLoop);
    };
    /**
     * Main render loop - very efficient!
     * Just: blend album FBOs → domain warp → output
     */
    render(time, timestamp = performance.now()) {
      if (this.disposed || !this.hasImage)
        return;
      this.advanceVideoSmoothing(timestamp);
      const gl = this.gl;
      const width = Math.max(1, this.canvas.width);
      const height = Math.max(1, this.canvas.height);
      if (this.warpFBO.width !== width || this.warpFBO.height !== height) {
        this.deleteFramebuffer(this.warpFBO);
        this.warpFBO = this.createFramebuffer(width, height, true);
      }
      let blendFactor = 1;
      if (this.isTransitioning) {
        const elapsed = Math.max(0, timestamp - this.transitionStartTime);
        blendFactor = this._transitionDuration > 0 ? Math.min(1, elapsed / this._transitionDuration) : 1;
        if (blendFactor >= 1) {
          this.isTransitioning = false;
        }
      }
      let currentTexture;
      if (this.isTransitioning && blendFactor < 1) {
        gl.useProgram(this.blendProgram);
        this.setupAttributes();
        gl.bindFramebuffer(gl.FRAMEBUFFER, this.blurFBO1.framebuffer);
        gl.viewport(0, 0, BLUR_SIZE, BLUR_SIZE);
        gl.activeTexture(gl.TEXTURE0);
        gl.bindTexture(gl.TEXTURE_2D, this.currentAlbumFBO.texture);
        gl.uniform1i(this.uniforms.blend.texture1, 0);
        gl.activeTexture(gl.TEXTURE1);
        gl.bindTexture(gl.TEXTURE_2D, this.nextAlbumFBO.texture);
        gl.uniform1i(this.uniforms.blend.texture2, 1);
        const easedBlend = 0.5 - 0.5 * Math.cos(blendFactor * Math.PI);
        gl.uniform1f(this.uniforms.blend.blend, easedBlend);
        gl.drawArrays(gl.TRIANGLES, 0, 6);
        currentTexture = this.blurFBO1.texture;
      } else {
        currentTexture = this.nextAlbumFBO.texture;
      }
      gl.useProgram(this.warpProgram);
      this.setupAttributes();
      gl.bindFramebuffer(gl.FRAMEBUFFER, this.warpFBO.framebuffer);
      gl.viewport(0, 0, width, height);
      gl.activeTexture(gl.TEXTURE0);
      gl.bindTexture(gl.TEXTURE_2D, currentTexture);
      gl.uniform1i(this.uniforms.warp.texture, 0);
      gl.uniform1f(this.uniforms.warp.time, time);
      gl.uniform1f(this.uniforms.warp.intensity, this._warpIntensity);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
      gl.useProgram(this.outputProgram);
      this.setupAttributes();
      gl.bindFramebuffer(gl.FRAMEBUFFER, null);
      gl.viewport(0, 0, width, height);
      gl.bindTexture(gl.TEXTURE_2D, this.warpFBO.texture);
      gl.uniform1i(this.uniforms.output.texture, 0);
      gl.uniform1f(this.uniforms.output.saturation, this._saturation);
      gl.uniform1f(this.uniforms.output.dithering, this._dithering);
      gl.uniform1f(this.uniforms.output.time, time);
      gl.uniform1f(this.uniforms.output.scale, this._scale);
      gl.uniform2f(this.uniforms.output.resolution, width, height);
      gl.drawArrays(gl.TRIANGLES, 0, 6);
    }
    setupAttributes() {
      const gl = this.gl;
      gl.bindBuffer(gl.ARRAY_BUFFER, this.positionBuffer);
      gl.enableVertexAttribArray(this.attribs.position);
      gl.vertexAttribPointer(this.attribs.position, 2, gl.FLOAT, false, 0, 0);
      gl.bindBuffer(gl.ARRAY_BUFFER, this.texCoordBuffer);
      gl.enableVertexAttribArray(this.attribs.texCoord);
      gl.vertexAttribPointer(this.attribs.texCoord, 2, gl.FLOAT, false, 0, 0);
    }
    createShader(type, source) {
      const gl = this.gl;
      const shader = gl.createShader(type);
      if (!shader)
        throw new Error("Failed to create shader");
      gl.shaderSource(shader, this.gl2 && type === gl.FRAGMENT_SHADER ? `precision highp sampler2D;
${source}` : source);
      gl.compileShader(shader);
      if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
        const error = gl.getShaderInfoLog(shader);
        gl.deleteShader(shader);
        throw new Error(`Shader compile error: ${error}`);
      }
      return shader;
    }
    createProgram(vertexSource, fragmentSource) {
      const gl = this.gl;
      const vertexShader = this.createShader(gl.VERTEX_SHADER, vertexSource);
      const fragmentShader = this.createShader(gl.FRAGMENT_SHADER, fragmentSource);
      const program = gl.createProgram();
      if (!program)
        throw new Error("Failed to create program");
      gl.attachShader(program, vertexShader);
      gl.attachShader(program, fragmentShader);
      gl.linkProgram(program);
      if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
        const error = gl.getProgramInfoLog(program);
        gl.deleteProgram(program);
        throw new Error(`Program link error: ${error}`);
      }
      gl.deleteShader(vertexShader);
      gl.deleteShader(fragmentShader);
      return program;
    }
    createBuffer(data) {
      const gl = this.gl;
      const buffer = gl.createBuffer();
      if (!buffer)
        throw new Error("Failed to create buffer");
      gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
      gl.bufferData(gl.ARRAY_BUFFER, data, gl.STATIC_DRAW);
      return buffer;
    }
    createTexture() {
      const gl = this.gl;
      const texture = gl.createTexture();
      if (!texture)
        throw new Error("Failed to create texture");
      gl.bindTexture(gl.TEXTURE_2D, texture);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
      gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
      return texture;
    }
    createFramebuffer(width, height, useHighPrecision = false) {
      if (this.gl2) {
        return this.createSizedFramebuffer(width, height, useHighPrecision && this.halfFloatRenderTargets ? this.gl2.RGBA16F : this.gl2.RGBA8);
      }
      const gl = this.gl;
      const texture = this.createTexture();
      const canUseHalfFloat = useHighPrecision && this.halfFloatExt && this.halfFloatLinearExt;
      const type = canUseHalfFloat ? this.halfFloatExt.HALF_FLOAT_OES : gl.UNSIGNED_BYTE;
      gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, width, height, 0, gl.RGBA, type, null);
      const framebuffer = gl.createFramebuffer();
      if (!framebuffer)
        throw new Error("Failed to create framebuffer");
      gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
      gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
      return { framebuffer, texture, width, height };
    }
    /**
     * WebGL2 render target with an explicit internal format. Float formats fall
     * back to RGBA8 when the driver reports them incomplete.
     */
    createSizedFramebuffer(width, height, internalFormat) {
      const gl = this.gl2;
      const texture = this.createTexture();
      const pixelType = internalFormat === gl.RGBA32F ? gl.FLOAT : internalFormat === gl.RGBA16F ? gl.HALF_FLOAT : gl.UNSIGNED_BYTE;
      if (internalFormat === gl.RGBA32F && !this.floatLinearFiltering) {
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.NEAREST);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
      }
      gl.texImage2D(gl.TEXTURE_2D, 0, internalFormat, width, height, 0, gl.RGBA, pixelType, null);
      const framebuffer = gl.createFramebuffer();
      if (!framebuffer)
        throw new Error("Failed to create framebuffer");
      gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
      gl.framebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);
      if (internalFormat !== gl.RGBA8 && gl.checkFramebufferStatus(gl.FRAMEBUFFER) !== gl.FRAMEBUFFER_COMPLETE) {
        if (internalFormat === gl.RGBA32F)
          this.float32RenderTargets = false;
        else
          this.halfFloatRenderTargets = false;
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
        gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
        gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA8, width, height, 0, gl.RGBA, gl.UNSIGNED_BYTE, null);
      }
      return { framebuffer, texture, width, height };
    }
    applyFloatDrawingBuffer() {
      const gl = this.gl2;
      if (!gl?.drawingBufferStorage || !this.halfFloatRenderTargets)
        return;
      gl.drawingBufferStorage(gl.RGBA16F, Math.max(1, this.canvas.width), Math.max(1, this.canvas.height));
      this._highPrecisionOutput = gl.drawingBufferFormat === gl.RGBA16F;
    }
    deleteFramebuffer(fbo) {
      this.gl.deleteFramebuffer(fbo.framebuffer);
      this.gl.deleteTexture(fbo.texture);
    }
  };
  var dist_default = Kawarp;

  // web/node_modules/altcha-lib/dist/esm/v2/helpers.js
  function bufferStartsWith(buffer, prefix) {
    if (prefix.length > buffer.length) {
      return false;
    }
    for (let i = 0; i < prefix.length; i++) {
      if (buffer[i] !== prefix[i]) {
        return false;
      }
    }
    return true;
  }
  function bufferToHex(buffer) {
    return Array.from(new Uint8Array(buffer)).map((b) => b.toString(16).padStart(2, "0")).join("");
  }
  function concatBuffers(a, b) {
    const out = new Uint8Array(a.length + b.length);
    out.set(a, 0);
    out.set(b, a.length);
    return out;
  }
  function hexToBuffer(hex) {
    if (hex.length % 2 !== 0) {
      throw new Error(`Hex string must have an even length. Got: ${hex}`);
    }
    const buffer = new ArrayBuffer(hex.length / 2);
    const view = new DataView(buffer);
    for (let i = 0; i < hex.length; i += 2) {
      const byteString = hex.substring(i, i + 2);
      const byteValue = parseInt(byteString, 16);
      view.setUint8(i / 2, byteValue);
    }
    return new Uint8Array(buffer);
  }
  async function delay(ms) {
    await new Promise((resolve) => setTimeout(resolve, ms));
  }
  function timeDuration(start) {
    return Math.floor((performance.now() - start) * 10) / 10;
  }

  // web/node_modules/altcha-lib/dist/esm/v2/types.js
  var HmacAlgorithm;
  (function(HmacAlgorithm2) {
    HmacAlgorithm2["SHA_256"] = "SHA-256";
    HmacAlgorithm2["SHA_384"] = "SHA-384";
    HmacAlgorithm2["SHA_512"] = "SHA-512";
  })(HmacAlgorithm || (HmacAlgorithm = {}));
  var State;
  (function(State2) {
    State2["CODE"] = "code";
    State2["ERROR"] = "error";
    State2["VERIFIED"] = "verified";
    State2["VERIFYING"] = "verifying";
    State2["UNVERIFIED"] = "unverified";
    State2["EXPIRED"] = "expired";
  })(State || (State = {}));

  // web/node_modules/altcha-lib/dist/esm/v2/pow.js
  var PasswordBuffer = class {
    nonce;
    mode;
    COUNTER_BYTES = 4;
    buffer;
    dataView;
    encoder = new TextEncoder();
    constructor(nonce, mode = "uint32") {
      this.nonce = nonce;
      this.mode = mode;
      this.buffer = new Uint8Array(this.nonce.length + this.COUNTER_BYTES);
      this.buffer.set(this.nonce, 0);
      this.dataView = new DataView(this.buffer.buffer);
    }
    /**
     * Appends the counter to the nonce buffer.
     * In 'string' mode, encodes the counter as a UTF-8 string.
     * In 'uint32' mode, writes the counter as a big-endian 32-bit integer.
     */
    setCounter(n) {
      if (this.mode === "string") {
        return concatBuffers(this.nonce, this.encoder.encode(n.toString()));
      }
      this.dataView.setUint32(this.nonce.length, n, false);
      return this.buffer;
    }
  };
  async function solveChallenge(options) {
    const { challenge, controller, counterMode = "uint32", counterStart = 0, counterStep = 1, deriveKey: deriveKey2, timeout = 9e4 } = options;
    const { nonce, keyPrefix, salt } = challenge.parameters;
    const nonceBuf = hexToBuffer(nonce);
    const saltBuf = hexToBuffer(salt);
    const keyPrefixBuf = keyPrefix.length % 2 === 0 ? hexToBuffer(keyPrefix) : null;
    const password = new PasswordBuffer(nonceBuf, counterMode);
    const start = performance.now();
    let counter = counterStart;
    let iterations = 0;
    let derivedKeyHex = "";
    let lastYield = start;
    while (true) {
      if (controller?.signal.aborted || timeout && iterations % 10 === 0 && performance.now() - start > timeout) {
        return null;
      }
      const { derivedKey } = await deriveKey2(challenge.parameters, saltBuf, password.setCounter(counter));
      if (iterations % 10 === 0 && performance.now() - lastYield > 200) {
        await delay(0);
        lastYield = performance.now();
      }
      if (keyPrefixBuf ? bufferStartsWith(derivedKey, keyPrefixBuf) : bufferToHex(derivedKey).startsWith(keyPrefix)) {
        derivedKeyHex = bufferToHex(derivedKey);
        break;
      }
      counter = counter + counterStep;
      iterations = iterations + 1;
    }
    return {
      counter,
      derivedKey: derivedKeyHex,
      time: timeDuration(start)
    };
  }

  // web/node_modules/altcha-lib/dist/esm/v2/algorithms/web/pbkdf2.js
  async function deriveKey(parameters, salt, password) {
    const { cost, keyLength = 32 } = parameters;
    const hash2 = parameters.algorithm.startsWith("PBKDF2/") ? parameters.algorithm.slice(7) : "SHA-256";
    const passwordKey = await crypto.subtle.importKey("raw", password, { name: "PBKDF2" }, false, ["deriveKey"]);
    const derivedKey = await crypto.subtle.deriveKey({
      name: "PBKDF2",
      salt,
      iterations: cost,
      hash: hash2
    }, passwordKey, { name: "AES-GCM", length: keyLength * 8 }, true, ["encrypt"]);
    return {
      derivedKey: new Uint8Array(await crypto.subtle.exportKey("raw", derivedKey))
    };
  }

  // web/src/shaders.js
  var native = window.BDShader;
  var canvas = document.querySelector("canvas");
  var engine;
  var config = {};
  var state = {};
  var generation = -1;
  var lastImage = "";
  var lastPaint = 0;
  var imageEpoch = 0;
  var closed = false;
  var graphicsFailed = false;
  function fail(error) {
    native?.failure(String(error?.message || error).slice(0, 160));
  }
  function create() {
    if (engine || closed || graphicsFailed || !state.background || !state.image) return;
    engine = new dist_default(canvas, { warpIntensity: 1, blurPasses: 8, animationSpeed: 1, transitionDuration: 1e3, saturation: 1.5, dithering: 8e-3 });
    const render = engine.renderLoop;
    if (typeof render !== "function") throw new Error("Pinned Kawarp scheduling contract missing");
    engine.renderLoop = (timestamp) => {
      if (!engine.isPlaying) return;
      const interval = 1e3 / (config.fps || 30), delta = timestamp - lastPaint;
      if (delta >= interval) {
        lastPaint = timestamp - delta % interval;
        render(timestamp);
      } else engine.animationId = requestAnimationFrame(engine.renderLoop);
    };
  }
  function visibility() {
    if (!engine) return;
    const motion = state.visible && state.playing && config.animateBackground && !config.reducedMotion && !document.hidden;
    engine.animationSpeed = motion ? config.speed ?? 1 : 0;
    if (state.background && motion) engine.start();
    else {
      engine.stop();
      engine.renderFrame();
    }
  }
  function update() {
    try {
      canvas.hidden = !state.background || !state.image;
      canvas.style.opacity = String(Math.max(0, Math.min(1, config.opacity ?? 0.75)));
      canvas.style.filter = `brightness(${1 - (config.dimming ?? 0.3)})`;
      try {
        create();
      } catch (error) {
        graphicsFailed = true;
        fail(error);
      }
      engine?.setOptions({ warpIntensity: config.strength ?? 1, saturation: config.saturation ?? 1.5, transitionDuration: state.frame ? 250 : config.transition ?? 1e3, animationSpeed: config.animateBackground ? config.speed ?? 1 : 0, blurPasses: 8, dithering: 8e-3 });
      if (engine && state.image && state.image !== lastImage) {
        const epoch = ++imageEpoch;
        lastImage = state.image;
        if (!state.frame) canvas.style.visibility = "hidden";
        const img = new Image();
        img.onload = () => {
          if (closed || epoch !== imageEpoch) return;
          try {
            engine.loadImageElement(img);
            canvas.style.visibility = "visible";
            visibility();
          } catch (e) {
            fail(e);
          }
        };
        img.onerror = () => {
          if (epoch === imageEpoch) {
            lastImage = "";
            fail(new Error("Artwork image unavailable; native background retained"));
          }
        };
        img.src = state.image;
      }
      visibility();
    } catch (error) {
      fail(error);
    }
  }
  canvas.addEventListener("webglcontextlost", (event) => {
    event.preventDefault();
    engine?.stop();
    native?.failure("Graphics context lost; native artwork retained");
  });
  canvas.addEventListener("webglcontextrestored", () => {
    engine?.dispose();
    engine = void 0;
    graphicsFailed = false;
    lastImage = "";
    update();
  });
  document.addEventListener("visibilitychange", visibility);
  var sizeObserver = new ResizeObserver((entries) => {
    for (const entry of entries) {
      const rect = entry.contentRect;
      if (rect.width <= 0 || rect.height <= 0) continue;
      const scale = Math.min(1, 960 / Math.max(rect.width, rect.height)), width = Math.max(1, Math.round(rect.width * scale)), height = Math.max(1, Math.round(rect.height * scale));
      if (canvas.width !== width || canvas.height !== height) {
        canvas.width = width;
        canvas.height = height;
        engine?.resize();
        engine?.renderFrame();
      }
    }
  });
  sizeObserver.observe(canvas);
  window.BDS = {
    settings(next) {
      config = next;
      update();
    },
    state(next) {
      if (next.generation !== generation) {
        generation = next.generation;
        lastImage = "";
        imageEpoch++;
        canvas.style.visibility = "hidden";
      }
      state = next;
      update();
    },
    async solve(id, challenge) {
      try {
        const solution = await solveChallenge({ challenge, deriveKey, timeout: 6e4 });
        native?.proof(id, solution ? JSON.stringify(solution) : "");
      } catch {
        native?.proof(id, "");
      }
    },
    close() {
      closed = true;
      sizeObserver.disconnect();
      engine?.dispose();
      engine = void 0;
    }
  };
  native?.ready();
})();
