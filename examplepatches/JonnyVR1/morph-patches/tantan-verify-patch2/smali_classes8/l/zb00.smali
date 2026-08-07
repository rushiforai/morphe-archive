.class public Ll/zb00;
.super Ll/i4;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\n\nvarying vec2 textureCoordinate;\nuniform sampler2D inputImageTexture0;\nuniform float number;\n\nfloat pick(float val) {\n    if (val > 0.5) {\n        val = val - 0.5;\n    }\n    return val * 2.0;\n}\n\nfloat permutation(float val, float offset, float num, float base, float max) {\n    while (val > base) {\n        val = val - base;\n    }\n    return offset + val * num * max;\n}\n\nvoid main() {\n    vec2 uv = textureCoordinate;\n    if (number == 1.0) {\n        if(uv.x > 0.5) {\n            uv.x = 1.0 - uv.x;\n        }\n        uv.x = uv.x + 0.25;\n    } else if (number == 2.0) {\n        float base = 1.0 / number;\n        uv.y = permutation(uv.y, base, number, base, base);\n    } else if (number == 3.0) {\n        uv = vec2(pick(uv.x), pick(uv.y));\n        if(textureCoordinate.x > 0.5) {\n            uv.x = 1.0 - uv.x;\n        }\n        if(textureCoordinate.y <= 0.5) {\n            uv.y = 1.0 - uv.y;\n        }\n    }\n    vec4 result = texture2D(inputImageTexture0, uv);\n    gl_FragColor = result;\n\n}\n"

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
    const-string v1, "number"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/zb00;->a:I

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
    iget v0, p0, Ll/zb00;->a:I

    .line 5
    .line 6
    iget p0, p0, Ll/zb00;->b:I

    .line 7
    .line 8
    int-to-float p0, p0

    .line 9
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getType()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Ll/zb00;->b:I

    .line 9
    .line 10
    return-void
.end method
