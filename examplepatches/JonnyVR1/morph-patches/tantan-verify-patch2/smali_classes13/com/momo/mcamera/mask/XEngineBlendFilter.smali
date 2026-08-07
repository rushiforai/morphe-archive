.class public Lcom/momo/mcamera/mask/XEngineBlendFilter;
.super Lcom/momo/mcamera/mask/TriggerBlendFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;-><init>(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public drawSub()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->is3DRenderReady()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isSegmentBody:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/TriggerBlendFilter;->isStroke:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform sampler2D inputImageTexture3;\nuniform int blend;\nvarying vec2 textureCoordinate;\n\nuniform float texelWidth;\nuniform float texelHeight;\n\nuniform int strokeRadius;\nuniform vec4 strokeColor;\nuniform int strokeEnabled;\nfloat stepWidth = 1.0;\n\nfloat intensityForEdge(vec2 center, vec2 step1) {\n    //bool isIntensity = false;\n    vec4 centerTex = texture2D(inputImageTexture3, center);\n    float intensity = centerTex.r;\n    for (int i = 0; i < strokeRadius; i++) {\n        vec2 left = center + vec2(step1.x * float(i), 0.0);\n        vec2 right = center + vec2(step1.x * -float(i), 0.0);\n        vec2 top = center + vec2(0.0, -step1.y * float(i));\n        vec2 bottom = center + vec2(0.0, +step1.y * float(i));\n        vec4 leftTex = texture2D( inputImageTexture3, left);\n        vec4 rightTex = texture2D( inputImageTexture3, right);\n        vec4 topTex = texture2D( inputImageTexture3, top);\n        vec4 bottomTex = texture2D( inputImageTexture3, bottom);\n        intensity = (intensity+(leftTex.r+rightTex.r+ topTex.r+ bottomTex.r)*(1.0-float(i)/float(strokeRadius)));\n    }\n    return intensity*float(strokeRadius);\n}\n\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {\n   gl_FragColor = color2;\n} else {   \n   vec2 step1 = vec2(stepWidth*texelWidth, stepWidth*texelHeight);\n   vec4 picture = texture2D(inputImageTexture1, textureCoordinate);\n\n   vec4 color1;\n   float intensity = intensityForEdge(textureCoordinate, step1);\n   //if (intensity > 0.0) {\n   //   color1 = strokeColor;\n   //} else {\n   //   color1 = picture;\n   //}\n   color1 = mix(strokeColor, picture , step(0.0, -intensity));\n   color1 = mix(picture, color1, float(strokeEnabled));\n   //vec4 colorSobel = texture2D(inputImageTexture3,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   vec4 colorAlpha = texture2D(inputImageTexture2, textureCoordinate);\n   color1.a = color1.a * (1.0 - colorAlpha.r);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n   }\n }"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform sampler2D inputImageTexture2;\nuniform int blend;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {     gl_FragColor = color2; }  else{   vec4 color1 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   vec4 colorAlpha = texture2D(inputImageTexture2, textureCoordinate);\n   color1.a = color1.a * (1.0 - colorAlpha.r);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n }}\n"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nuniform int blend;\nvarying vec2 textureCoordinate;\nvoid main(){\n vec4 color2 = texture2D(inputImageTexture0,textureCoordinate);\n if(blend==0) {     gl_FragColor = color2; }  else if(blend==1){   vec4 color1 = texture2D(inputImageTexture1,textureCoordinate);\n   vec4 outputColor;\n   float a = color1.a + color2.a * (1.0 - color1.a);\n   outputColor.r = (color1.r * color1.a + color2.r * color2.a * (1.0 - color1.a))/a;\n   outputColor.g = (color1.g * color1.a + color2.g * color2.a * (1.0 - color1.a))/a;\n   outputColor.b = (color1.b * color1.a + color2.b * color2.a * (1.0 - color1.a))/a;\n   outputColor.a = 1.0;\n   gl_FragColor = outputColor;\n } else if(blend==2){   gl_FragColor = texture2D(inputImageTexture1,textureCoordinate);\n }}\n"

    .line 16
    .line 17
    return-object p0
.end method

.method public setBlend(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-super {p0, p1}, Lcom/momo/mcamera/mask/TriggerBlendFilter;->setBlend(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
