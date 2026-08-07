.class public Ll/fkc0;
.super Ll/rt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:F

.field private c:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/rt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/fkc0;->b:F

    .line 6
    .line 7
    const-wide/32 v0, 0x186a0

    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/fkc0;->c:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float iTime;\n#define S(a, b, t) smoothstep(a, b, t)\n #define CHEAP_NORMALS\n #define USE_POST_PROCESSING\nvec3 N13(float p) {\n   vec3 p3 = fract(vec3(p) * vec3(.1031,.11369,.13787));\n   p3 += dot(p3, p3.yzx + 19.19);\n   return fract(vec3((p3.x + p3.y)*p3.z, (p3.x+p3.z)*p3.y, (p3.y+p3.z)*p3.x));\n}\nvec4 N14(float t) {\n\treturn fract(sin(t*vec4(123., 1024., 1456., 264.))*vec4(6547., 345., 8799., 1564.));\n}\nfloat N(float t) {\n    return fract(sin(t*12345.564)*7658.76);\n}\nfloat Saw(float b, float t) {\n\treturn S(0., b, t)*S(1., b, t);\n}\nfloat StaticDrops(vec2 uv, float t) {\n\tuv *= 40.;\n    \n    vec2 id = floor(uv);\n    uv = fract(uv)-.5;\n    vec3 n = N13(id.x*107.45+id.y*3543.654);\n    vec2 p = (n.xy-.5)*.7;\n    float d = length(uv-p);\n    \n    float fade = Saw(.025, fract(t+n.z));\n    float c = S(.3, 0., d)*fract(n.z*20.)*fade;\n    return c;\n}\n\nvec2 Drops(vec2 uv, float t, float l0, float l1, float l2) {\n    float s = StaticDrops(uv, t)*l0; \n    vec2 m1 = vec2(0.0,0.0);\n    vec2 m2 = vec2(0.0,0.0);\n    \n    float c = s+m1.x+m2.x;\n    c = S(.3, 1.0, c);\n    \n    return vec2(c, max(m1.y*l0, m2.y*l1));\n}void main(){\n    vec2 uv = textureCoordinate - vec2(0.5,0.5);\n    vec2 UV = textureCoordinate;\n    float T = iTime; \n    float t = T*0.5;    \n    float rainAmount = sin(T*.05)*.3+1.5;   \n    float staticDrops = S(.1, 1., rainAmount)*2.;\n    float layer1 = S(.25, .75, rainAmount);\n    float layer2 = S(.0, .5, rainAmount);\n    vec2 c = Drops(uv, t, staticDrops, layer1, layer2);\n    vec2 e = vec2(0.001, 0.);\n    float cx = Drops(uv+e, t, staticDrops, layer1, layer2).x;\n    float cy = Drops(uv+e.yx, t, staticDrops, layer1, layer2).x;\n    vec2 n = vec2(cx-c.x, cy-c.x);\n    vec3 col = texture2D(inputImageTexture0, UV-n).rgb; \n    gl_FragColor = vec4(col, 1.);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "iTime"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/fkc0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/fkc0;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/fkc0;->b:F

    .line 7
    .line 8
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/bof0;->setTimeStamp(J)V

    .line 2
    .line 3
    .line 4
    long-to-float p1, p1

    .line 5
    const/high16 p2, 0x44960000    # 1200.0f

    .line 6
    .line 7
    div-float/2addr p1, p2

    .line 8
    iput p1, p0, Ll/fkc0;->b:F

    .line 9
    .line 10
    return-void
.end method
