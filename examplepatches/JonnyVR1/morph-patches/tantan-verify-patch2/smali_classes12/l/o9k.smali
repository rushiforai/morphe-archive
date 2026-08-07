.class public Ll/o9k;
.super Ll/it2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/it2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   vec2 pos = textureCoordinate.xy; \n   vec4 textureColor = texture2D(inputImageTexture0,textureCoordinate);\n   vec4 color = vec4(0.0,1.0,0.0,1.0);\n   float maskY = 0.2989 * color.r + 0.5866 * color.g + 0.1145 * color.b;\n     float maskCr = 0.7132 * (color.r - maskY);\n     float maskCb = 0.5647 * (color.b - maskY);\n     float Y = 0.2989 * textureColor.r + 0.5866 * textureColor.g + 0.1145 * textureColor.b;\n     float Cr = 0.7132 * (textureColor.r - Y);\n     float Cb = 0.5647 * (textureColor.b - Y);\n     float thresholdSensitivity = 0.4;\n     float smoothing = 0.1;\n     float blendvalue = 1.0 - smoothstep(thresholdSensitivity, thresholdSensitivity+smoothing, distance(vec2(Cr,Cb), vec2(maskCr, maskCb)));\n     \n   gl_FragColor = mix(textureColor, vec4(0.0,0.0,0.0,0.0),blendvalue);\n   \n}\n"

    .line 2
    .line 3
    return-object p0
.end method
