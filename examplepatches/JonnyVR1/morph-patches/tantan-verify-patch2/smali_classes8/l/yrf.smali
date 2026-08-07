.class public Ll/yrf;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:F

.field private f:F

.field private g:F

.field private i:Z

.field j:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const-string v0, "precision highp float;\nvarying vec2 textureCoordinate;\nuniform float threshold;\nuniform float scalar;\nuniform float HLVig;\nuniform bool grayScale;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nconst vec3 LumCoeff = vec3(0.2125, 0.7154, 0.0721);\nvoid main() { \n    vec3 col=texture2D(inputImageTexture0, textureCoordinate).rgb; \n    vec3 blu=texture2D(inputImageTexture1, textureCoordinate).rgb;\n    if(grayScale){\n        float v=col.r*0.299+col.g*0.587+col.b*0.114;\n        float v2=blu.r*0.299+blu.g*0.587+blu.b*0.114+HLVig;\n        float th=max(threshold,v2); \n        if(v>th){ \n            v=(v-th)/(1.0-th)*scalar;\n            gl_FragColor=vec4(v,v,v,1.0); \n        }  else{ \n            gl_FragColor=vec4(0.0,0.0,0.0,1.0); \n        }\n    } else { \n        vec3 thc=max(vec3(threshold),blu+HLVig);\n        col.r=(col.r>thc.r)?((col.r-thc.r)/(1.0-thc.r)*scalar):0.0;\n        col.g=(col.g>thc.g)?((col.g-thc.g)/(1.0-thc.g)*scalar):0.0;\n        col.b=(col.b>thc.b)?((col.b-thc.b)/(1.0-thc.b)*scalar):0.0;\n        gl_FragColor=vec4(col,1.0); \n    }\n }"

    .line 6
    .line 7
    iput-object v0, p0, Ll/yrf;->j:Ljava/lang/String;

    .line 8
    .line 9
    const v0, 0x3f59999a    # 0.85f

    .line 10
    .line 11
    .line 12
    iput v0, p0, Ll/yrf;->e:F

    .line 13
    .line 14
    const v0, 0x3eb33333    # 0.35f

    .line 15
    .line 16
    .line 17
    iput v0, p0, Ll/yrf;->g:F

    .line 18
    .line 19
    const/high16 v0, 0x41700000    # 15.0f

    .line 20
    .line 21
    iput v0, p0, Ll/yrf;->f:F

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Ll/yrf;->i:Z

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/gfj;->setFloatTexture(Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrf;->j:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "threshold"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/yrf;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "scalar"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/yrf;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "HLVig"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/yrf;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "grayScale"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/yrf;->d:I

    .line 43
    .line 44
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/yrf;->a:I

    .line 5
    .line 6
    iget v1, p0, Ll/yrf;->e:F

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 9
    .line 10
    .line 11
    iget v0, p0, Ll/yrf;->b:I

    .line 12
    .line 13
    iget v1, p0, Ll/yrf;->f:F

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/yrf;->c:I

    .line 19
    .line 20
    iget v1, p0, Ll/yrf;->g:F

    .line 21
    .line 22
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 23
    .line 24
    .line 25
    iget v0, p0, Ll/yrf;->d:I

    .line 26
    .line 27
    iget-boolean p0, p0, Ll/yrf;->i:Z

    .line 28
    .line 29
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
