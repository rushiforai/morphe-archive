.class public Lcom/momo/mcamera/mask/BigMouthMaskFilter;
.super Ll/i4;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# static fields
.field private static final POINTS_LENGTH:I = 0x60


# instance fields
.field private landMaskHandle:I

.field private locationList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private maskImagePath:Ljava/lang/String;

.field private maskTexture:I

.field private maskTextureHandle:I

.field private matrixLocation1:I

.field private matrixLocation2:I

.field private matrixLocation3:I

.field private mmcvInfo:Ll/omw;

.field private texSizeHandle:I


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/i4;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    const/16 v1, 0x1a

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v2, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 17
    .line 18
    new-instance v3, Landroid/graphics/PointF;

    .line 19
    .line 20
    invoke-direct {v3}, Landroid/graphics/PointF;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method

.method private deleteTexture()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTexture:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    filled-new-array {v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 12
    .line 13
    .line 14
    iput v2, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTexture:I

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->deleteTexture()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nvarying vec2 textureCoordinate;\n\nuniform sampler2D inputImageTexture;\nuniform sampler2D inputImageTexture2;\n\nuniform vec2 texSize;\nuniform float isLandMask;\n\nuniform mat4 matrixOne;\nuniform mat4 matrixTwo;\nuniform mat4 matrixThree;\n\n#define p2  vec2(0.109322,0.090341)\n#define p4  vec2(0.141959,0.406709)\n#define p6  vec2(0.167116,0.519916)\n#define p8  vec2(0.194969,0.633124)\n#define p10 vec2(0.243486,0.734801)\n#define p12 vec2(0.311770,0.820755)\n#define p14 vec2(0.389039,0.887841)\n#define p16 vec2(0.484277,0.918239)\n#define p18 vec2(0.582210,0.894130)\n#define p20 vec2(0.670261,0.833333)\n#define p22 vec2(0.743935,0.755765)\n#define p24 vec2(0.798742,0.656184)\n#define p26 vec2(0.831986,0.541929)\n#define p28 vec2(0.850854,0.423480)\n#define p30 vec2(0.867925,0.308176)\n#define p43 vec2(0.495957,0.209476)\n#define p46 vec2(0.495957,0.420000)\n#define p44 vec2(0.495957,0.284382)\n#define p45 vec2(0.495957,0.369287)\n\n#define x_a 1.0\n#define y_a 1.0\n\nstruct Triangle{\n    vec2 A;\n    vec2 B;\n    vec2 C;\n};\n\nfloat judgePointInTriangleOrNot(vec2 curPoint,Triangle curTriangle) {\n    vec2 A = curTriangle.A;\n    vec2 B = curTriangle.B;\n    vec2 C = curTriangle.C;\n\n    vec2 v0 = C - A ;\n    vec2 v1 = B - A ;\n    vec2 v2 = curPoint - A ;\n\n    float dot00 = dot(v0,v0) ;\n    float dot01 = dot(v0,v1) ;\n    float dot02 = dot(v0,v2) ;\n    float dot11 = dot(v1,v1) ;\n    float dot12 = dot(v1,v2) ;\n\n    float inverDeno = 1.0 / (dot00 * dot11 - dot01 * dot01) ;\n\n    float u = (dot11 * dot02 - dot01 * dot12) * inverDeno ;\n    float v = (dot00 * dot12 - dot01 * dot02) * inverDeno ;\n\n    float condition ;\n    if((u>=0.0&&u<=1.0)&&(v>=0.0&&v<=1.0)&&(u+v<=1.0))\n        condition=1.0;\n    else\n        condition=0.0;\n\n    return condition;\n}\n\nvec2 triangleTransform(vec2 curPoint,Triangle dstTriangle,Triangle srcTriangle) {\n    vec2 A = dstTriangle.A;\n    vec2 B = dstTriangle.B;\n    vec2 C = dstTriangle.C;\n\n    vec2 a = srcTriangle.A;\n    vec2 b = srcTriangle.B;\n    vec2 c = srcTriangle.C;\n\n    vec2 AP = curPoint - A;\n    vec2 BC = C - B;\n\n    float apxy = AP.x/AP.y;\n    float bcyx = BC.y/BC.x;\n\n    vec2 D = vec2(0.0);\n    D.y = apxy*bcyx;\n    D.x = B.y*apxy - A.y*apxy - B.x*D.y + A.x;\n    D.x /= 1.0 - D.y;\n    D.y = D.x*bcyx - B.x*bcyx + B.y;\n\n    apxy = length(D - B)/length(BC);\n    bcyx = length(AP)/length(D - A);\n\n    D = b + (c-b)*apxy;\n    D = a + (D-a)*bcyx;\n    return D;\n}\n\nvec2 faceStretch(vec2 textureCoord, vec2 originPosition, vec2 targetPosition, float radius, float curve) {\n    vec2 direction = targetPosition - originPosition;\n    float lengthA = length(direction);\n    if(lengthA<0.0001)   return direction;\n    float lengthB = min(lengthA, radius);\n    direction *= lengthB / lengthA;\n    float infect = distance(textureCoord, originPosition)/radius;\n    infect = clamp(1.0-infect,0.0,1.0);\n    infect = pow(infect, curve);\n\n    return direction * infect;\n}\n\nvec2 stretchFun(vec2 textureCoord, vec2 originPosition, vec2 targetPosition, float radius) {\n    vec2 offset = vec2(0.0);\n    vec2 result = vec2(0.0);\n\n    vec2 direction = targetPosition - originPosition;\n    float lengthA = length(direction);\n\n    float infect = distance(textureCoord, originPosition)/radius;\n\n    infect = 1.0-infect;\n    infect = clamp(infect,0.0,1.0);\n    offset = direction * infect;\n\n    result = textureCoord - offset;\n\n    return result;\n}\n\nvec2 enlargeFun(vec2 curCoord,vec2 circleCenter,float radius,float intensity) {\n    float currentDistance = distance(curCoord,circleCenter);\n        {\n            float weight = currentDistance/radius;\n            weight = 1.0-intensity*(1.0-weight*weight);\n            weight = clamp(weight,0.0,1.0);\n            curCoord = circleCenter+(curCoord-circleCenter)*weight;\n        }\n    return curCoord;\n}\n\nvec2 narrowFun(vec2 curCoord,vec2 circleCenter,float radius,float intensity) {\n    float currentDistance = distance(curCoord,circleCenter);\n        {\n            float weight = currentDistance/radius;\n            weight = 1.0-intensity*(1.0-weight*weight);\n            weight = clamp(weight,0.0001,1.0);\n            curCoord = circleCenter+(curCoord-circleCenter)/weight;\n        }\n    return curCoord;\n}\n\nvoid main() {\n    vec4 originColor = texture2D(inputImageTexture, textureCoordinate);\n    gl_FragColor = originColor;\n\n    if(isLandMask < 0.5)\n        return;\n\n    vec2 pos2   = vec2(matrixOne[0][0],matrixOne[0][1]);\n    vec2 pos4   = vec2(matrixOne[0][2],matrixOne[0][3]);\n    vec2 pos6   = vec2(matrixOne[1][0],matrixOne[1][1]);\n    vec2 pos8   = vec2(matrixOne[1][2],matrixOne[1][3]);\n    vec2 pos10  = vec2(matrixOne[2][0],matrixOne[2][1]);\n    vec2 pos12  = vec2(matrixOne[2][2],matrixOne[2][3]);\n    vec2 pos14  = vec2(matrixOne[3][0],matrixOne[3][1]);\n    vec2 pos16  = vec2(matrixOne[3][2],matrixOne[3][3]);\n\n\n    vec2 pos18   = vec2(matrixTwo[0][0],matrixTwo[0][1]);\n    vec2 pos20   = vec2(matrixTwo[0][2],matrixTwo[0][3]);\n    vec2 pos22   = vec2(matrixTwo[1][0],matrixTwo[1][1]);\n    vec2 pos24   = vec2(matrixTwo[1][2],matrixTwo[1][3]);\n    vec2 pos26  = vec2(matrixTwo[2][0],matrixTwo[2][1]);\n    vec2 pos28  = vec2(matrixTwo[2][2],matrixTwo[2][3]);\n    vec2 pos30  = vec2(matrixTwo[3][0],matrixTwo[3][1]);\n    vec2 pos43  = vec2(matrixTwo[3][2],matrixTwo[3][3]);\n\n\n    vec2 pos44   = vec2(matrixThree[0][0],matrixThree[0][1]);\n    vec2 pos45   = vec2(matrixThree[0][2],matrixThree[0][3]);\n    vec2 pos46   = vec2(matrixThree[1][0],matrixThree[1][1]);\n    vec2 pos87   = vec2(matrixThree[1][2],matrixThree[1][3]);\n    vec2 pos98  = vec2(matrixThree[2][0],matrixThree[2][1]);\n    vec2 pos102  = vec2(matrixThree[2][2],matrixThree[2][3]);\n\n    float surfaceWidth = texSize.x;\n    float surfaceHeight = texSize.y;\n\n    if(pos46.x>0.03 || pos46.y>0.03)\n    {\n        vec2 sampleCoordinate   = vec2(0.0);\n        vec4 sampleColor        = vec4(0.0);\n        if(length((pos43-pos16)*403.0/638.0)>distance(pos16,pos46))\n        {\n            pos44 = pos16+(pos43-pos16)*560.0/638.0;\n            pos45 = pos16+(pos43-pos16)*480.0/638.0;\n            pos46 = pos16+(pos43-pos16)*403.0/638.0;\n        }\n\n        float scale = 0.68;\n        vec2 curPoint = textureCoordinate;\n        //shader \u88abiOS\u6539\u8fc7\uff0c\u5750\u6807\u8ddf\u6211\u4eec\u662f\u53cd\u7684\n        curPoint.y = 1. - curPoint.y;\n        vec2 mouthCenter = (pos98+pos102)*0.5-(pos16-pos46)*0.5;\n        vec2 center = pos46;\n        vec2 vMove = (pos46-pos87)*0.825;\n\n        Triangle dstTriangle = Triangle(pos2,pos4,pos46);\n        Triangle srcTriangle = Triangle(p2,p4,p46);\n        float condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos4,pos6,pos46);\n        srcTriangle = Triangle(p4,p6,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos6,pos8,pos46);\n        srcTriangle = Triangle(p6,p8,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos8,pos10,pos46);\n        srcTriangle = Triangle(p8,p10,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos10,pos12,pos46);\n        srcTriangle = Triangle(p10,p12,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos12,pos14,pos46);\n        srcTriangle = Triangle(p12,p14,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {                        sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos14,pos16,pos46);\n        srcTriangle = Triangle(p14,p16,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos16,pos18,pos46);\n        srcTriangle = Triangle(p16,p18,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos18,pos20,pos46);\n        srcTriangle = Triangle(p18,p20,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos20,pos22,pos46);\n        srcTriangle = Triangle(p20,p22,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos22,pos24,pos46);\n        srcTriangle = Triangle(p22,p24,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos24,pos26,pos46);\n        srcTriangle = Triangle(p24,p26,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos26,pos28,pos46);\n        srcTriangle = Triangle(p26,p28,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos28,pos30,pos46);\n        srcTriangle = Triangle(p28,p30,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        //------------------------------------------\n        dstTriangle = Triangle(pos2,pos45,pos46);\n        srcTriangle = Triangle(p2,p45,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos2,pos44,pos45);\n        srcTriangle = Triangle(p2,p44,p45);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos2,pos43,pos44);\n        srcTriangle = Triangle(p2,p43,p44);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos30,pos45,pos46);\n        srcTriangle = Triangle(p30,p45,p46);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos30,pos44,pos45);\n        srcTriangle = Triangle(p30,p44,p45);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        dstTriangle = Triangle(pos30,pos43,pos44);\n        srcTriangle = Triangle(p30,p43,p44);\n        condition=judgePointInTriangleOrNot(curPoint,dstTriangle);\n        if (condition > 0.8) {\n            sampleCoordinate = triangleTransform(curPoint,dstTriangle,srcTriangle);\n            sampleColor = texture2D(inputImageTexture2, sampleCoordinate);\n        }\n\n        vec2 targetPoint = curPoint - vMove;\n        targetPoint = (targetPoint-mouthCenter)*scale+mouthCenter;\n\n        //shader \u88abiOS\u6539\u8fc7\uff0c\u5750\u6807\u8ddf\u6211\u4eec\u662f\u53cd\u7684\n        vec4 findColor = texture2D(inputImageTexture, vec2(targetPoint.x, 1.0 - targetPoint.y));\n\n        vec2 resultCoord        = textureCoordinate;\n        vec2 x_y_proportion     = vec2(surfaceWidth,surfaceHeight);\n        if(0.0==surfaceWidth||0.0==surfaceHeight)\n            x_y_proportion     = vec2(x_a,y_a);\n\n        gl_FragColor = mix(originColor, findColor, sampleColor.a);\n    }\n}\n"

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
    const-string v1, "inputImageTexture2"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTextureHandle:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "matrixOne"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation1:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "matrixTwo"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation2:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "matrixThree"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation3:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "texSize"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->texSizeHandle:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "isLandMask"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->landMaskHandle:I

    .line 63
    .line 64
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTexture:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskImagePath:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskImagePath:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Ll/oim;->c(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/oim;->a(Landroid/graphics/Bitmap;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTexture:I

    .line 24
    .line 25
    :cond_0
    invoke-super {p0, p1, p2, p3}, Ll/i4;->newTextureReady(ILl/gfj;Z)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public passShaderValues()V
    .locals 41

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Ll/wej;->passShaderValues()V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->mmcvInfo:Ll/omw;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    :cond_0
    const/16 v16, 0x0

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_1
    const v1, 0x84c1

    .line 21
    .line 22
    .line 23
    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 24
    .line 25
    .line 26
    const/16 v1, 0xde1

    .line 27
    .line 28
    iget v3, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTexture:I

    .line 29
    .line 30
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 31
    .line 32
    .line 33
    iget v1, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskTextureHandle:I

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 37
    .line 38
    .line 39
    iget-object v1, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->mmcvInfo:Ll/omw;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-virtual {v1, v4}, Ll/omw;->j(I)Ll/nuf;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ll/nuf;->m()[F

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    check-cast v5, Landroid/graphics/PointF;

    .line 57
    .line 58
    const/16 v6, 0x11

    .line 59
    .line 60
    aget v7, v1, v6

    .line 61
    .line 62
    const/16 v8, 0x71

    .line 63
    .line 64
    aget v8, v1, v8

    .line 65
    .line 66
    invoke-virtual {v5, v7, v8}, Landroid/graphics/PointF;->set(FF)V

    .line 67
    .line 68
    .line 69
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 70
    .line 71
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v5

    .line 75
    check-cast v5, Landroid/graphics/PointF;

    .line 76
    .line 77
    const/16 v7, 0x10

    .line 78
    .line 79
    aget v8, v1, v7

    .line 80
    .line 81
    const/16 v9, 0x70

    .line 82
    .line 83
    aget v9, v1, v9

    .line 84
    .line 85
    invoke-virtual {v5, v8, v9}, Landroid/graphics/PointF;->set(FF)V

    .line 86
    .line 87
    .line 88
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 89
    .line 90
    const/4 v8, 0x2

    .line 91
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    check-cast v5, Landroid/graphics/PointF;

    .line 96
    .line 97
    const/16 v9, 0xf

    .line 98
    .line 99
    aget v10, v1, v9

    .line 100
    .line 101
    const/16 v11, 0x6f

    .line 102
    .line 103
    aget v11, v1, v11

    .line 104
    .line 105
    invoke-virtual {v5, v10, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 106
    .line 107
    .line 108
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 109
    .line 110
    const/4 v10, 0x3

    .line 111
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    check-cast v5, Landroid/graphics/PointF;

    .line 116
    .line 117
    const/16 v11, 0xe

    .line 118
    .line 119
    aget v12, v1, v11

    .line 120
    .line 121
    const/16 v13, 0x6e

    .line 122
    .line 123
    aget v13, v1, v13

    .line 124
    .line 125
    invoke-virtual {v5, v12, v13}, Landroid/graphics/PointF;->set(FF)V

    .line 126
    .line 127
    .line 128
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 129
    .line 130
    const/4 v12, 0x4

    .line 131
    invoke-interface {v5, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    check-cast v5, Landroid/graphics/PointF;

    .line 136
    .line 137
    const/16 v13, 0xc

    .line 138
    .line 139
    aget v14, v1, v13

    .line 140
    .line 141
    const/16 v15, 0x6c

    .line 142
    .line 143
    aget v15, v1, v15

    .line 144
    .line 145
    invoke-virtual {v5, v14, v15}, Landroid/graphics/PointF;->set(FF)V

    .line 146
    .line 147
    .line 148
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 149
    .line 150
    const/4 v14, 0x5

    .line 151
    invoke-interface {v5, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    check-cast v5, Landroid/graphics/PointF;

    .line 156
    .line 157
    const/16 v15, 0xb

    .line 158
    .line 159
    const/16 v16, 0x0

    .line 160
    .line 161
    aget v2, v1, v15

    .line 162
    .line 163
    const/16 v17, 0x6b

    .line 164
    .line 165
    aget v14, v1, v17

    .line 166
    .line 167
    invoke-virtual {v5, v2, v14}, Landroid/graphics/PointF;->set(FF)V

    .line 168
    .line 169
    .line 170
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 171
    .line 172
    const/4 v5, 0x6

    .line 173
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    check-cast v2, Landroid/graphics/PointF;

    .line 178
    .line 179
    const/16 v14, 0xa

    .line 180
    .line 181
    move/from16 v17, v5

    .line 182
    .line 183
    aget v5, v1, v14

    .line 184
    .line 185
    const/16 v19, 0x6a

    .line 186
    .line 187
    move/from16 v20, v12

    .line 188
    .line 189
    aget v12, v1, v19

    .line 190
    .line 191
    invoke-virtual {v2, v5, v12}, Landroid/graphics/PointF;->set(FF)V

    .line 192
    .line 193
    .line 194
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 195
    .line 196
    const/4 v5, 0x7

    .line 197
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    check-cast v2, Landroid/graphics/PointF;

    .line 202
    .line 203
    const/16 v12, 0x9

    .line 204
    .line 205
    move/from16 v19, v5

    .line 206
    .line 207
    aget v5, v1, v12

    .line 208
    .line 209
    const/16 v21, 0x69

    .line 210
    .line 211
    move/from16 v22, v10

    .line 212
    .line 213
    aget v10, v1, v21

    .line 214
    .line 215
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 216
    .line 217
    .line 218
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 219
    .line 220
    const/16 v5, 0x8

    .line 221
    .line 222
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    check-cast v2, Landroid/graphics/PointF;

    .line 227
    .line 228
    aget v10, v1, v5

    .line 229
    .line 230
    const/16 v21, 0x68

    .line 231
    .line 232
    move/from16 v23, v5

    .line 233
    .line 234
    aget v5, v1, v21

    .line 235
    .line 236
    invoke-virtual {v2, v10, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 237
    .line 238
    .line 239
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 240
    .line 241
    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v2

    .line 245
    check-cast v2, Landroid/graphics/PointF;

    .line 246
    .line 247
    aget v5, v1, v19

    .line 248
    .line 249
    const/16 v10, 0x67

    .line 250
    .line 251
    aget v10, v1, v10

    .line 252
    .line 253
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 254
    .line 255
    .line 256
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 257
    .line 258
    invoke-interface {v2, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    check-cast v2, Landroid/graphics/PointF;

    .line 263
    .line 264
    aget v5, v1, v17

    .line 265
    .line 266
    const/16 v10, 0x66

    .line 267
    .line 268
    aget v10, v1, v10

    .line 269
    .line 270
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 271
    .line 272
    .line 273
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 274
    .line 275
    invoke-interface {v2, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v2

    .line 279
    check-cast v2, Landroid/graphics/PointF;

    .line 280
    .line 281
    aget v5, v1, v20

    .line 282
    .line 283
    const/16 v10, 0x64

    .line 284
    .line 285
    aget v10, v1, v10

    .line 286
    .line 287
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 288
    .line 289
    .line 290
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v2, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    check-cast v2, Landroid/graphics/PointF;

    .line 297
    .line 298
    aget v5, v1, v22

    .line 299
    .line 300
    const/16 v10, 0x63

    .line 301
    .line 302
    aget v10, v1, v10

    .line 303
    .line 304
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 305
    .line 306
    .line 307
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 308
    .line 309
    const/16 v5, 0xd

    .line 310
    .line 311
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    check-cast v2, Landroid/graphics/PointF;

    .line 316
    .line 317
    aget v10, v1, v8

    .line 318
    .line 319
    const/16 v21, 0x62

    .line 320
    .line 321
    move/from16 v24, v5

    .line 322
    .line 323
    aget v5, v1, v21

    .line 324
    .line 325
    invoke-virtual {v2, v10, v5}, Landroid/graphics/PointF;->set(FF)V

    .line 326
    .line 327
    .line 328
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 329
    .line 330
    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v2

    .line 334
    check-cast v2, Landroid/graphics/PointF;

    .line 335
    .line 336
    aget v5, v1, v3

    .line 337
    .line 338
    const/16 v10, 0x61

    .line 339
    .line 340
    aget v10, v1, v10

    .line 341
    .line 342
    invoke-virtual {v2, v5, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 343
    .line 344
    .line 345
    new-instance v2, Landroid/graphics/PointF;

    .line 346
    .line 347
    const/16 v5, 0x18

    .line 348
    .line 349
    aget v10, v1, v5

    .line 350
    .line 351
    const/16 v21, 0x78

    .line 352
    .line 353
    move/from16 v25, v11

    .line 354
    .line 355
    aget v11, v1, v21

    .line 356
    .line 357
    invoke-direct {v2, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    .line 358
    .line 359
    .line 360
    new-instance v10, Landroid/graphics/PointF;

    .line 361
    .line 362
    const/16 v11, 0x1d

    .line 363
    .line 364
    aget v11, v1, v11

    .line 365
    .line 366
    const/16 v21, 0x7d

    .line 367
    .line 368
    move/from16 v26, v13

    .line 369
    .line 370
    aget v13, v1, v21

    .line 371
    .line 372
    invoke-direct {v10, v11, v13}, Landroid/graphics/PointF;-><init>(FF)V

    .line 373
    .line 374
    .line 375
    new-instance v11, Landroid/graphics/PointF;

    .line 376
    .line 377
    const/16 v13, 0x3f

    .line 378
    .line 379
    aget v13, v1, v13

    .line 380
    .line 381
    const/16 v21, 0x9f

    .line 382
    .line 383
    move/from16 v27, v15

    .line 384
    .line 385
    aget v15, v1, v21

    .line 386
    .line 387
    invoke-direct {v11, v13, v15}, Landroid/graphics/PointF;-><init>(FF)V

    .line 388
    .line 389
    .line 390
    new-instance v13, Landroid/graphics/PointF;

    .line 391
    .line 392
    const/16 v15, 0x4a

    .line 393
    .line 394
    aget v15, v1, v15

    .line 395
    .line 396
    const/16 v21, 0xaa

    .line 397
    .line 398
    move/from16 v28, v14

    .line 399
    .line 400
    aget v14, v1, v21

    .line 401
    .line 402
    invoke-direct {v13, v15, v14}, Landroid/graphics/PointF;-><init>(FF)V

    .line 403
    .line 404
    .line 405
    iget-object v14, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 406
    .line 407
    invoke-interface {v14, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v14

    .line 411
    check-cast v14, Landroid/graphics/PointF;

    .line 412
    .line 413
    iget v15, v2, Landroid/graphics/PointF;->x:F

    .line 414
    .line 415
    move/from16 v21, v9

    .line 416
    .line 417
    iget v9, v10, Landroid/graphics/PointF;->x:F

    .line 418
    .line 419
    add-float/2addr v15, v9

    .line 420
    iget v9, v11, Landroid/graphics/PointF;->x:F

    .line 421
    .line 422
    add-float/2addr v15, v9

    .line 423
    iget v9, v13, Landroid/graphics/PointF;->x:F

    .line 424
    .line 425
    add-float/2addr v15, v9

    .line 426
    const/high16 v9, 0x40800000    # 4.0f

    .line 427
    .line 428
    div-float/2addr v15, v9

    .line 429
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 430
    .line 431
    iget v10, v10, Landroid/graphics/PointF;->y:F

    .line 432
    .line 433
    add-float/2addr v2, v10

    .line 434
    iget v10, v11, Landroid/graphics/PointF;->y:F

    .line 435
    .line 436
    add-float/2addr v2, v10

    .line 437
    iget v10, v13, Landroid/graphics/PointF;->y:F

    .line 438
    .line 439
    add-float/2addr v2, v10

    .line 440
    div-float/2addr v2, v9

    .line 441
    invoke-virtual {v14, v15, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 442
    .line 443
    .line 444
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 445
    .line 446
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    check-cast v2, Landroid/graphics/PointF;

    .line 451
    .line 452
    iget v10, v11, Landroid/graphics/PointF;->x:F

    .line 453
    .line 454
    iget v14, v13, Landroid/graphics/PointF;->x:F

    .line 455
    .line 456
    add-float/2addr v10, v14

    .line 457
    const/high16 v14, 0x40000000    # 2.0f

    .line 458
    .line 459
    div-float/2addr v10, v14

    .line 460
    iget v11, v11, Landroid/graphics/PointF;->y:F

    .line 461
    .line 462
    iget v13, v13, Landroid/graphics/PointF;->y:F

    .line 463
    .line 464
    add-float/2addr v11, v13

    .line 465
    div-float/2addr v11, v14

    .line 466
    invoke-virtual {v2, v10, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 467
    .line 468
    .line 469
    new-instance v2, Landroid/graphics/PointF;

    .line 470
    .line 471
    const/16 v10, 0x40

    .line 472
    .line 473
    aget v10, v1, v10

    .line 474
    .line 475
    const/16 v11, 0xa0

    .line 476
    .line 477
    aget v11, v1, v11

    .line 478
    .line 479
    invoke-direct {v2, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    .line 480
    .line 481
    .line 482
    new-instance v10, Landroid/graphics/PointF;

    .line 483
    .line 484
    const/16 v11, 0x49

    .line 485
    .line 486
    aget v11, v1, v11

    .line 487
    .line 488
    const/16 v13, 0xa9

    .line 489
    .line 490
    aget v13, v1, v13

    .line 491
    .line 492
    invoke-direct {v10, v11, v13}, Landroid/graphics/PointF;-><init>(FF)V

    .line 493
    .line 494
    .line 495
    iget-object v11, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 496
    .line 497
    invoke-interface {v11, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object v11

    .line 501
    check-cast v11, Landroid/graphics/PointF;

    .line 502
    .line 503
    iget v13, v2, Landroid/graphics/PointF;->x:F

    .line 504
    .line 505
    iget v15, v10, Landroid/graphics/PointF;->x:F

    .line 506
    .line 507
    add-float/2addr v13, v15

    .line 508
    div-float/2addr v13, v14

    .line 509
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 510
    .line 511
    iget v10, v10, Landroid/graphics/PointF;->y:F

    .line 512
    .line 513
    add-float/2addr v2, v10

    .line 514
    div-float/2addr v2, v14

    .line 515
    invoke-virtual {v11, v13, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 516
    .line 517
    .line 518
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 519
    .line 520
    const/16 v10, 0x12

    .line 521
    .line 522
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 523
    .line 524
    .line 525
    move-result-object v2

    .line 526
    check-cast v2, Landroid/graphics/PointF;

    .line 527
    .line 528
    const/16 v11, 0x4b

    .line 529
    .line 530
    aget v11, v1, v11

    .line 531
    .line 532
    const/16 v13, 0xab

    .line 533
    .line 534
    aget v13, v1, v13

    .line 535
    .line 536
    invoke-virtual {v2, v11, v13}, Landroid/graphics/PointF;->set(FF)V

    .line 537
    .line 538
    .line 539
    new-instance v2, Landroid/graphics/PointF;

    .line 540
    .line 541
    const/16 v11, 0x33

    .line 542
    .line 543
    aget v11, v1, v11

    .line 544
    .line 545
    const/16 v13, 0x93

    .line 546
    .line 547
    aget v13, v1, v13

    .line 548
    .line 549
    invoke-direct {v2, v11, v13}, Landroid/graphics/PointF;-><init>(FF)V

    .line 550
    .line 551
    .line 552
    new-instance v11, Landroid/graphics/PointF;

    .line 553
    .line 554
    const/16 v13, 0x36

    .line 555
    .line 556
    aget v13, v1, v13

    .line 557
    .line 558
    const/16 v14, 0x96

    .line 559
    .line 560
    aget v14, v1, v14

    .line 561
    .line 562
    invoke-direct {v11, v13, v14}, Landroid/graphics/PointF;-><init>(FF)V

    .line 563
    .line 564
    .line 565
    new-instance v13, Landroid/graphics/PointF;

    .line 566
    .line 567
    const/16 v14, 0x39

    .line 568
    .line 569
    aget v14, v1, v14

    .line 570
    .line 571
    const/16 v15, 0x99

    .line 572
    .line 573
    aget v15, v1, v15

    .line 574
    .line 575
    invoke-direct {v13, v14, v15}, Landroid/graphics/PointF;-><init>(FF)V

    .line 576
    .line 577
    .line 578
    new-instance v14, Landroid/graphics/PointF;

    .line 579
    .line 580
    const/16 v15, 0x3c

    .line 581
    .line 582
    aget v15, v1, v15

    .line 583
    .line 584
    const/16 v29, 0x9c

    .line 585
    .line 586
    move/from16 v30, v9

    .line 587
    .line 588
    aget v9, v1, v29

    .line 589
    .line 590
    invoke-direct {v14, v15, v9}, Landroid/graphics/PointF;-><init>(FF)V

    .line 591
    .line 592
    .line 593
    iget-object v9, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 594
    .line 595
    const/16 v15, 0x13

    .line 596
    .line 597
    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object v9

    .line 601
    check-cast v9, Landroid/graphics/PointF;

    .line 602
    .line 603
    iget v15, v2, Landroid/graphics/PointF;->x:F

    .line 604
    .line 605
    iget v10, v11, Landroid/graphics/PointF;->x:F

    .line 606
    .line 607
    add-float/2addr v15, v10

    .line 608
    iget v10, v13, Landroid/graphics/PointF;->x:F

    .line 609
    .line 610
    add-float/2addr v15, v10

    .line 611
    iget v10, v14, Landroid/graphics/PointF;->x:F

    .line 612
    .line 613
    add-float/2addr v15, v10

    .line 614
    div-float v15, v15, v30

    .line 615
    .line 616
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 617
    .line 618
    iget v10, v11, Landroid/graphics/PointF;->y:F

    .line 619
    .line 620
    add-float/2addr v2, v10

    .line 621
    iget v10, v13, Landroid/graphics/PointF;->y:F

    .line 622
    .line 623
    add-float/2addr v2, v10

    .line 624
    iget v10, v14, Landroid/graphics/PointF;->y:F

    .line 625
    .line 626
    add-float/2addr v2, v10

    .line 627
    div-float v2, v2, v30

    .line 628
    .line 629
    invoke-virtual {v9, v15, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 630
    .line 631
    .line 632
    new-instance v2, Landroid/graphics/PointF;

    .line 633
    .line 634
    const/16 v9, 0x27

    .line 635
    .line 636
    aget v9, v1, v9

    .line 637
    .line 638
    const/16 v10, 0x87

    .line 639
    .line 640
    aget v10, v1, v10

    .line 641
    .line 642
    invoke-direct {v2, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    .line 643
    .line 644
    .line 645
    new-instance v9, Landroid/graphics/PointF;

    .line 646
    .line 647
    const/16 v10, 0x2a

    .line 648
    .line 649
    aget v10, v1, v10

    .line 650
    .line 651
    const/16 v11, 0x8a

    .line 652
    .line 653
    aget v11, v1, v11

    .line 654
    .line 655
    invoke-direct {v9, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    .line 656
    .line 657
    .line 658
    new-instance v10, Landroid/graphics/PointF;

    .line 659
    .line 660
    const/16 v11, 0x2d

    .line 661
    .line 662
    aget v11, v1, v11

    .line 663
    .line 664
    const/16 v13, 0x8d

    .line 665
    .line 666
    aget v13, v1, v13

    .line 667
    .line 668
    invoke-direct {v10, v11, v13}, Landroid/graphics/PointF;-><init>(FF)V

    .line 669
    .line 670
    .line 671
    new-instance v11, Landroid/graphics/PointF;

    .line 672
    .line 673
    const/16 v13, 0x30

    .line 674
    .line 675
    aget v13, v1, v13

    .line 676
    .line 677
    const/16 v14, 0x90

    .line 678
    .line 679
    aget v14, v1, v14

    .line 680
    .line 681
    invoke-direct {v11, v13, v14}, Landroid/graphics/PointF;-><init>(FF)V

    .line 682
    .line 683
    .line 684
    iget-object v13, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 685
    .line 686
    const/16 v14, 0x14

    .line 687
    .line 688
    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 689
    .line 690
    .line 691
    move-result-object v13

    .line 692
    check-cast v13, Landroid/graphics/PointF;

    .line 693
    .line 694
    iget v14, v2, Landroid/graphics/PointF;->x:F

    .line 695
    .line 696
    iget v15, v9, Landroid/graphics/PointF;->x:F

    .line 697
    .line 698
    add-float/2addr v14, v15

    .line 699
    iget v15, v10, Landroid/graphics/PointF;->x:F

    .line 700
    .line 701
    add-float/2addr v14, v15

    .line 702
    iget v15, v11, Landroid/graphics/PointF;->x:F

    .line 703
    .line 704
    add-float/2addr v14, v15

    .line 705
    div-float v14, v14, v30

    .line 706
    .line 707
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 708
    .line 709
    iget v9, v9, Landroid/graphics/PointF;->y:F

    .line 710
    .line 711
    add-float/2addr v2, v9

    .line 712
    iget v9, v10, Landroid/graphics/PointF;->y:F

    .line 713
    .line 714
    add-float/2addr v2, v9

    .line 715
    iget v9, v11, Landroid/graphics/PointF;->y:F

    .line 716
    .line 717
    add-float/2addr v2, v9

    .line 718
    div-float v2, v2, v30

    .line 719
    .line 720
    invoke-virtual {v13, v14, v2}, Landroid/graphics/PointF;->set(FF)V

    .line 721
    .line 722
    .line 723
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 724
    .line 725
    const/16 v9, 0x15

    .line 726
    .line 727
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object v2

    .line 731
    check-cast v2, Landroid/graphics/PointF;

    .line 732
    .line 733
    const/16 v9, 0x52

    .line 734
    .line 735
    aget v9, v1, v9

    .line 736
    .line 737
    const/16 v10, 0xb2

    .line 738
    .line 739
    aget v10, v1, v10

    .line 740
    .line 741
    invoke-virtual {v2, v9, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 742
    .line 743
    .line 744
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 745
    .line 746
    const/16 v9, 0x16

    .line 747
    .line 748
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 749
    .line 750
    .line 751
    move-result-object v2

    .line 752
    check-cast v2, Landroid/graphics/PointF;

    .line 753
    .line 754
    const/16 v9, 0x4c

    .line 755
    .line 756
    aget v9, v1, v9

    .line 757
    .line 758
    const/16 v10, 0xac

    .line 759
    .line 760
    aget v10, v1, v10

    .line 761
    .line 762
    invoke-virtual {v2, v9, v10}, Landroid/graphics/PointF;->set(FF)V

    .line 763
    .line 764
    .line 765
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 766
    .line 767
    const/16 v9, 0x17

    .line 768
    .line 769
    invoke-interface {v2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 770
    .line 771
    .line 772
    move-result-object v2

    .line 773
    check-cast v2, Landroid/graphics/PointF;

    .line 774
    .line 775
    const/16 v10, 0x4f

    .line 776
    .line 777
    aget v10, v1, v10

    .line 778
    .line 779
    const/16 v11, 0xaf

    .line 780
    .line 781
    aget v11, v1, v11

    .line 782
    .line 783
    invoke-virtual {v2, v10, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 784
    .line 785
    .line 786
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 787
    .line 788
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 789
    .line 790
    .line 791
    move-result-object v2

    .line 792
    check-cast v2, Landroid/graphics/PointF;

    .line 793
    .line 794
    const/16 v10, 0x5a

    .line 795
    .line 796
    aget v10, v1, v10

    .line 797
    .line 798
    const/16 v11, 0xba

    .line 799
    .line 800
    aget v11, v1, v11

    .line 801
    .line 802
    invoke-virtual {v2, v10, v11}, Landroid/graphics/PointF;->set(FF)V

    .line 803
    .line 804
    .line 805
    iget-object v2, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 806
    .line 807
    const/16 v10, 0x19

    .line 808
    .line 809
    invoke-interface {v2, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 810
    .line 811
    .line 812
    move-result-object v2

    .line 813
    check-cast v2, Landroid/graphics/PointF;

    .line 814
    .line 815
    const/16 v11, 0x5e

    .line 816
    .line 817
    aget v11, v1, v11

    .line 818
    .line 819
    const/16 v13, 0xbe

    .line 820
    .line 821
    aget v1, v1, v13

    .line 822
    .line 823
    invoke-virtual {v2, v11, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 824
    .line 825
    .line 826
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 827
    .line 828
    .line 829
    move-result v1

    .line 830
    int-to-float v1, v1

    .line 831
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 832
    .line 833
    .line 834
    move-result v2

    .line 835
    int-to-float v2, v2

    .line 836
    iget-object v11, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 837
    .line 838
    invoke-interface {v11, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 839
    .line 840
    .line 841
    move-result-object v11

    .line 842
    check-cast v11, Landroid/graphics/PointF;

    .line 843
    .line 844
    iget v11, v11, Landroid/graphics/PointF;->x:F

    .line 845
    .line 846
    div-float/2addr v11, v1

    .line 847
    iget-object v13, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 848
    .line 849
    invoke-interface {v13, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 850
    .line 851
    .line 852
    move-result-object v13

    .line 853
    check-cast v13, Landroid/graphics/PointF;

    .line 854
    .line 855
    iget v13, v13, Landroid/graphics/PointF;->y:F

    .line 856
    .line 857
    div-float/2addr v13, v2

    .line 858
    iget-object v14, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 859
    .line 860
    invoke-interface {v14, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 861
    .line 862
    .line 863
    move-result-object v14

    .line 864
    check-cast v14, Landroid/graphics/PointF;

    .line 865
    .line 866
    iget v14, v14, Landroid/graphics/PointF;->x:F

    .line 867
    .line 868
    div-float/2addr v14, v1

    .line 869
    iget-object v15, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 870
    .line 871
    invoke-interface {v15, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 872
    .line 873
    .line 874
    move-result-object v15

    .line 875
    check-cast v15, Landroid/graphics/PointF;

    .line 876
    .line 877
    iget v15, v15, Landroid/graphics/PointF;->y:F

    .line 878
    .line 879
    div-float/2addr v15, v2

    .line 880
    move/from16 v30, v3

    .line 881
    .line 882
    iget-object v3, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 883
    .line 884
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 885
    .line 886
    .line 887
    move-result-object v3

    .line 888
    check-cast v3, Landroid/graphics/PointF;

    .line 889
    .line 890
    iget v3, v3, Landroid/graphics/PointF;->x:F

    .line 891
    .line 892
    div-float/2addr v3, v1

    .line 893
    move/from16 v31, v4

    .line 894
    .line 895
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 896
    .line 897
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 898
    .line 899
    .line 900
    move-result-object v4

    .line 901
    check-cast v4, Landroid/graphics/PointF;

    .line 902
    .line 903
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 904
    .line 905
    div-float/2addr v4, v2

    .line 906
    move/from16 v32, v8

    .line 907
    .line 908
    iget-object v8, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 909
    .line 910
    move/from16 v10, v22

    .line 911
    .line 912
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 913
    .line 914
    .line 915
    move-result-object v8

    .line 916
    check-cast v8, Landroid/graphics/PointF;

    .line 917
    .line 918
    iget v8, v8, Landroid/graphics/PointF;->x:F

    .line 919
    .line 920
    div-float/2addr v8, v1

    .line 921
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 922
    .line 923
    invoke-interface {v5, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 924
    .line 925
    .line 926
    move-result-object v5

    .line 927
    check-cast v5, Landroid/graphics/PointF;

    .line 928
    .line 929
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 930
    .line 931
    div-float/2addr v5, v2

    .line 932
    iget-object v10, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 933
    .line 934
    move/from16 v9, v20

    .line 935
    .line 936
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 937
    .line 938
    .line 939
    move-result-object v10

    .line 940
    check-cast v10, Landroid/graphics/PointF;

    .line 941
    .line 942
    iget v10, v10, Landroid/graphics/PointF;->x:F

    .line 943
    .line 944
    div-float/2addr v10, v1

    .line 945
    iget-object v6, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 946
    .line 947
    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 948
    .line 949
    .line 950
    move-result-object v6

    .line 951
    check-cast v6, Landroid/graphics/PointF;

    .line 952
    .line 953
    iget v6, v6, Landroid/graphics/PointF;->y:F

    .line 954
    .line 955
    div-float/2addr v6, v2

    .line 956
    iget-object v9, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 957
    .line 958
    move/from16 v34, v12

    .line 959
    .line 960
    const/4 v12, 0x5

    .line 961
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 962
    .line 963
    .line 964
    move-result-object v9

    .line 965
    check-cast v9, Landroid/graphics/PointF;

    .line 966
    .line 967
    iget v9, v9, Landroid/graphics/PointF;->x:F

    .line 968
    .line 969
    div-float/2addr v9, v1

    .line 970
    iget-object v7, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 971
    .line 972
    invoke-interface {v7, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 973
    .line 974
    .line 975
    move-result-object v7

    .line 976
    check-cast v7, Landroid/graphics/PointF;

    .line 977
    .line 978
    iget v7, v7, Landroid/graphics/PointF;->y:F

    .line 979
    .line 980
    div-float/2addr v7, v2

    .line 981
    iget-object v12, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 982
    .line 983
    move/from16 v35, v3

    .line 984
    .line 985
    move/from16 v3, v17

    .line 986
    .line 987
    invoke-interface {v12, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 988
    .line 989
    .line 990
    move-result-object v12

    .line 991
    check-cast v12, Landroid/graphics/PointF;

    .line 992
    .line 993
    iget v12, v12, Landroid/graphics/PointF;->x:F

    .line 994
    .line 995
    div-float/2addr v12, v1

    .line 996
    move/from16 v36, v4

    .line 997
    .line 998
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 999
    .line 1000
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1001
    .line 1002
    .line 1003
    move-result-object v4

    .line 1004
    check-cast v4, Landroid/graphics/PointF;

    .line 1005
    .line 1006
    iget v3, v4, Landroid/graphics/PointF;->y:F

    .line 1007
    .line 1008
    div-float/2addr v3, v2

    .line 1009
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1010
    .line 1011
    move/from16 v37, v3

    .line 1012
    .line 1013
    move/from16 v3, v19

    .line 1014
    .line 1015
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v4

    .line 1019
    check-cast v4, Landroid/graphics/PointF;

    .line 1020
    .line 1021
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 1022
    .line 1023
    div-float/2addr v4, v1

    .line 1024
    move/from16 v38, v4

    .line 1025
    .line 1026
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1027
    .line 1028
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1029
    .line 1030
    .line 1031
    move-result-object v4

    .line 1032
    check-cast v4, Landroid/graphics/PointF;

    .line 1033
    .line 1034
    iget v3, v4, Landroid/graphics/PointF;->y:F

    .line 1035
    .line 1036
    div-float/2addr v3, v2

    .line 1037
    move/from16 v39, v3

    .line 1038
    .line 1039
    const/16 v4, 0x10

    .line 1040
    .line 1041
    new-array v3, v4, [F

    .line 1042
    .line 1043
    aput v11, v3, v31

    .line 1044
    .line 1045
    aput v13, v3, v30

    .line 1046
    .line 1047
    aput v14, v3, v32

    .line 1048
    .line 1049
    const/16 v22, 0x3

    .line 1050
    .line 1051
    aput v15, v3, v22

    .line 1052
    .line 1053
    const/16 v20, 0x4

    .line 1054
    .line 1055
    aput v35, v3, v20

    .line 1056
    .line 1057
    const/16 v18, 0x5

    .line 1058
    .line 1059
    aput v36, v3, v18

    .line 1060
    .line 1061
    const/16 v17, 0x6

    .line 1062
    .line 1063
    aput v8, v3, v17

    .line 1064
    .line 1065
    const/16 v19, 0x7

    .line 1066
    .line 1067
    aput v5, v3, v19

    .line 1068
    .line 1069
    aput v10, v3, v23

    .line 1070
    .line 1071
    aput v6, v3, v34

    .line 1072
    .line 1073
    aput v9, v3, v28

    .line 1074
    .line 1075
    aput v7, v3, v27

    .line 1076
    .line 1077
    aput v12, v3, v26

    .line 1078
    .line 1079
    aput v37, v3, v24

    .line 1080
    .line 1081
    aput v38, v3, v25

    .line 1082
    .line 1083
    aput v39, v3, v21

    .line 1084
    .line 1085
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1086
    .line 1087
    move/from16 v5, v23

    .line 1088
    .line 1089
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1090
    .line 1091
    .line 1092
    move-result-object v4

    .line 1093
    check-cast v4, Landroid/graphics/PointF;

    .line 1094
    .line 1095
    iget v4, v4, Landroid/graphics/PointF;->x:F

    .line 1096
    .line 1097
    div-float/2addr v4, v1

    .line 1098
    iget-object v6, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1099
    .line 1100
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v6

    .line 1104
    check-cast v6, Landroid/graphics/PointF;

    .line 1105
    .line 1106
    iget v5, v6, Landroid/graphics/PointF;->y:F

    .line 1107
    .line 1108
    div-float/2addr v5, v2

    .line 1109
    iget-object v6, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1110
    .line 1111
    move/from16 v7, v34

    .line 1112
    .line 1113
    invoke-interface {v6, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1114
    .line 1115
    .line 1116
    move-result-object v6

    .line 1117
    check-cast v6, Landroid/graphics/PointF;

    .line 1118
    .line 1119
    iget v6, v6, Landroid/graphics/PointF;->x:F

    .line 1120
    .line 1121
    div-float/2addr v6, v1

    .line 1122
    iget-object v8, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1123
    .line 1124
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1125
    .line 1126
    .line 1127
    move-result-object v8

    .line 1128
    check-cast v8, Landroid/graphics/PointF;

    .line 1129
    .line 1130
    iget v7, v8, Landroid/graphics/PointF;->y:F

    .line 1131
    .line 1132
    div-float/2addr v7, v2

    .line 1133
    iget-object v8, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1134
    .line 1135
    move/from16 v9, v28

    .line 1136
    .line 1137
    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v8

    .line 1141
    check-cast v8, Landroid/graphics/PointF;

    .line 1142
    .line 1143
    iget v8, v8, Landroid/graphics/PointF;->x:F

    .line 1144
    .line 1145
    div-float/2addr v8, v1

    .line 1146
    iget-object v10, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1147
    .line 1148
    invoke-interface {v10, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v10

    .line 1152
    check-cast v10, Landroid/graphics/PointF;

    .line 1153
    .line 1154
    iget v9, v10, Landroid/graphics/PointF;->y:F

    .line 1155
    .line 1156
    div-float/2addr v9, v2

    .line 1157
    iget-object v10, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1158
    .line 1159
    move/from16 v11, v27

    .line 1160
    .line 1161
    invoke-interface {v10, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1162
    .line 1163
    .line 1164
    move-result-object v10

    .line 1165
    check-cast v10, Landroid/graphics/PointF;

    .line 1166
    .line 1167
    iget v10, v10, Landroid/graphics/PointF;->x:F

    .line 1168
    .line 1169
    div-float/2addr v10, v1

    .line 1170
    iget-object v12, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1171
    .line 1172
    invoke-interface {v12, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1173
    .line 1174
    .line 1175
    move-result-object v12

    .line 1176
    check-cast v12, Landroid/graphics/PointF;

    .line 1177
    .line 1178
    iget v11, v12, Landroid/graphics/PointF;->y:F

    .line 1179
    .line 1180
    div-float/2addr v11, v2

    .line 1181
    iget-object v12, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1182
    .line 1183
    move/from16 v13, v26

    .line 1184
    .line 1185
    invoke-interface {v12, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1186
    .line 1187
    .line 1188
    move-result-object v12

    .line 1189
    check-cast v12, Landroid/graphics/PointF;

    .line 1190
    .line 1191
    iget v12, v12, Landroid/graphics/PointF;->x:F

    .line 1192
    .line 1193
    div-float/2addr v12, v1

    .line 1194
    iget-object v14, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1195
    .line 1196
    invoke-interface {v14, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1197
    .line 1198
    .line 1199
    move-result-object v14

    .line 1200
    check-cast v14, Landroid/graphics/PointF;

    .line 1201
    .line 1202
    iget v13, v14, Landroid/graphics/PointF;->y:F

    .line 1203
    .line 1204
    div-float/2addr v13, v2

    .line 1205
    iget-object v14, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1206
    .line 1207
    move/from16 v15, v24

    .line 1208
    .line 1209
    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1210
    .line 1211
    .line 1212
    move-result-object v14

    .line 1213
    check-cast v14, Landroid/graphics/PointF;

    .line 1214
    .line 1215
    iget v14, v14, Landroid/graphics/PointF;->x:F

    .line 1216
    .line 1217
    div-float/2addr v14, v1

    .line 1218
    move/from16 v35, v4

    .line 1219
    .line 1220
    iget-object v4, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1221
    .line 1222
    invoke-interface {v4, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1223
    .line 1224
    .line 1225
    move-result-object v4

    .line 1226
    check-cast v4, Landroid/graphics/PointF;

    .line 1227
    .line 1228
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 1229
    .line 1230
    div-float/2addr v4, v2

    .line 1231
    iget-object v15, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1232
    .line 1233
    move/from16 v36, v4

    .line 1234
    .line 1235
    move/from16 v4, v25

    .line 1236
    .line 1237
    invoke-interface {v15, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1238
    .line 1239
    .line 1240
    move-result-object v15

    .line 1241
    check-cast v15, Landroid/graphics/PointF;

    .line 1242
    .line 1243
    iget v15, v15, Landroid/graphics/PointF;->x:F

    .line 1244
    .line 1245
    div-float/2addr v15, v1

    .line 1246
    move/from16 v37, v5

    .line 1247
    .line 1248
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1249
    .line 1250
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1251
    .line 1252
    .line 1253
    move-result-object v5

    .line 1254
    check-cast v5, Landroid/graphics/PointF;

    .line 1255
    .line 1256
    iget v4, v5, Landroid/graphics/PointF;->y:F

    .line 1257
    .line 1258
    div-float/2addr v4, v2

    .line 1259
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1260
    .line 1261
    move/from16 v38, v4

    .line 1262
    .line 1263
    move/from16 v4, v21

    .line 1264
    .line 1265
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1266
    .line 1267
    .line 1268
    move-result-object v5

    .line 1269
    check-cast v5, Landroid/graphics/PointF;

    .line 1270
    .line 1271
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 1272
    .line 1273
    div-float/2addr v5, v1

    .line 1274
    move/from16 v39, v5

    .line 1275
    .line 1276
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1277
    .line 1278
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v5

    .line 1282
    check-cast v5, Landroid/graphics/PointF;

    .line 1283
    .line 1284
    iget v4, v5, Landroid/graphics/PointF;->y:F

    .line 1285
    .line 1286
    div-float/2addr v4, v2

    .line 1287
    move/from16 v40, v4

    .line 1288
    .line 1289
    const/16 v5, 0x10

    .line 1290
    .line 1291
    new-array v4, v5, [F

    .line 1292
    .line 1293
    aput v35, v4, v31

    .line 1294
    .line 1295
    aput v37, v4, v30

    .line 1296
    .line 1297
    aput v6, v4, v32

    .line 1298
    .line 1299
    const/16 v22, 0x3

    .line 1300
    .line 1301
    aput v7, v4, v22

    .line 1302
    .line 1303
    const/16 v20, 0x4

    .line 1304
    .line 1305
    aput v8, v4, v20

    .line 1306
    .line 1307
    const/16 v18, 0x5

    .line 1308
    .line 1309
    aput v9, v4, v18

    .line 1310
    .line 1311
    const/16 v17, 0x6

    .line 1312
    .line 1313
    aput v10, v4, v17

    .line 1314
    .line 1315
    const/16 v19, 0x7

    .line 1316
    .line 1317
    aput v11, v4, v19

    .line 1318
    .line 1319
    const/16 v23, 0x8

    .line 1320
    .line 1321
    aput v12, v4, v23

    .line 1322
    .line 1323
    const/16 v34, 0x9

    .line 1324
    .line 1325
    aput v13, v4, v34

    .line 1326
    .line 1327
    const/16 v28, 0xa

    .line 1328
    .line 1329
    aput v14, v4, v28

    .line 1330
    .line 1331
    const/16 v27, 0xb

    .line 1332
    .line 1333
    aput v36, v4, v27

    .line 1334
    .line 1335
    const/16 v26, 0xc

    .line 1336
    .line 1337
    aput v15, v4, v26

    .line 1338
    .line 1339
    const/16 v24, 0xd

    .line 1340
    .line 1341
    aput v38, v4, v24

    .line 1342
    .line 1343
    const/16 v25, 0xe

    .line 1344
    .line 1345
    aput v39, v4, v25

    .line 1346
    .line 1347
    const/16 v21, 0xf

    .line 1348
    .line 1349
    aput v40, v4, v21

    .line 1350
    .line 1351
    iget-object v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1352
    .line 1353
    const/16 v6, 0x10

    .line 1354
    .line 1355
    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v5

    .line 1359
    check-cast v5, Landroid/graphics/PointF;

    .line 1360
    .line 1361
    iget v5, v5, Landroid/graphics/PointF;->x:F

    .line 1362
    .line 1363
    div-float/2addr v5, v1

    .line 1364
    iget-object v7, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1365
    .line 1366
    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1367
    .line 1368
    .line 1369
    move-result-object v7

    .line 1370
    check-cast v7, Landroid/graphics/PointF;

    .line 1371
    .line 1372
    iget v6, v7, Landroid/graphics/PointF;->y:F

    .line 1373
    .line 1374
    div-float/2addr v6, v2

    .line 1375
    iget-object v7, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1376
    .line 1377
    const/16 v8, 0x11

    .line 1378
    .line 1379
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1380
    .line 1381
    .line 1382
    move-result-object v7

    .line 1383
    check-cast v7, Landroid/graphics/PointF;

    .line 1384
    .line 1385
    iget v7, v7, Landroid/graphics/PointF;->x:F

    .line 1386
    .line 1387
    div-float/2addr v7, v1

    .line 1388
    iget-object v9, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1389
    .line 1390
    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v8

    .line 1394
    check-cast v8, Landroid/graphics/PointF;

    .line 1395
    .line 1396
    iget v8, v8, Landroid/graphics/PointF;->y:F

    .line 1397
    .line 1398
    div-float/2addr v8, v2

    .line 1399
    iget-object v9, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1400
    .line 1401
    const/16 v10, 0x12

    .line 1402
    .line 1403
    invoke-interface {v9, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1404
    .line 1405
    .line 1406
    move-result-object v9

    .line 1407
    check-cast v9, Landroid/graphics/PointF;

    .line 1408
    .line 1409
    iget v9, v9, Landroid/graphics/PointF;->x:F

    .line 1410
    .line 1411
    div-float/2addr v9, v1

    .line 1412
    iget-object v11, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1413
    .line 1414
    invoke-interface {v11, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v10

    .line 1418
    check-cast v10, Landroid/graphics/PointF;

    .line 1419
    .line 1420
    iget v10, v10, Landroid/graphics/PointF;->y:F

    .line 1421
    .line 1422
    div-float/2addr v10, v2

    .line 1423
    iget-object v11, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1424
    .line 1425
    const/16 v12, 0x17

    .line 1426
    .line 1427
    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1428
    .line 1429
    .line 1430
    move-result-object v11

    .line 1431
    check-cast v11, Landroid/graphics/PointF;

    .line 1432
    .line 1433
    iget v11, v11, Landroid/graphics/PointF;->x:F

    .line 1434
    .line 1435
    div-float/2addr v11, v1

    .line 1436
    iget-object v13, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1437
    .line 1438
    invoke-interface {v13, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1439
    .line 1440
    .line 1441
    move-result-object v12

    .line 1442
    check-cast v12, Landroid/graphics/PointF;

    .line 1443
    .line 1444
    iget v12, v12, Landroid/graphics/PointF;->y:F

    .line 1445
    .line 1446
    div-float/2addr v12, v2

    .line 1447
    iget-object v13, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1448
    .line 1449
    const/16 v14, 0x18

    .line 1450
    .line 1451
    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1452
    .line 1453
    .line 1454
    move-result-object v13

    .line 1455
    check-cast v13, Landroid/graphics/PointF;

    .line 1456
    .line 1457
    iget v13, v13, Landroid/graphics/PointF;->x:F

    .line 1458
    .line 1459
    div-float/2addr v13, v1

    .line 1460
    iget-object v15, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1461
    .line 1462
    invoke-interface {v15, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1463
    .line 1464
    .line 1465
    move-result-object v14

    .line 1466
    check-cast v14, Landroid/graphics/PointF;

    .line 1467
    .line 1468
    iget v14, v14, Landroid/graphics/PointF;->y:F

    .line 1469
    .line 1470
    div-float/2addr v14, v2

    .line 1471
    iget-object v15, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1472
    .line 1473
    move/from16 v29, v5

    .line 1474
    .line 1475
    const/16 v5, 0x19

    .line 1476
    .line 1477
    invoke-interface {v15, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1478
    .line 1479
    .line 1480
    move-result-object v15

    .line 1481
    check-cast v15, Landroid/graphics/PointF;

    .line 1482
    .line 1483
    iget v15, v15, Landroid/graphics/PointF;->x:F

    .line 1484
    .line 1485
    div-float/2addr v15, v1

    .line 1486
    move/from16 v33, v6

    .line 1487
    .line 1488
    iget-object v6, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->locationList:Ljava/util/List;

    .line 1489
    .line 1490
    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 1491
    .line 1492
    .line 1493
    move-result-object v5

    .line 1494
    check-cast v5, Landroid/graphics/PointF;

    .line 1495
    .line 1496
    iget v5, v5, Landroid/graphics/PointF;->y:F

    .line 1497
    .line 1498
    div-float/2addr v5, v2

    .line 1499
    const/16 v6, 0x10

    .line 1500
    .line 1501
    new-array v6, v6, [F

    .line 1502
    .line 1503
    aput v29, v6, v31

    .line 1504
    .line 1505
    aput v33, v6, v30

    .line 1506
    .line 1507
    aput v7, v6, v32

    .line 1508
    .line 1509
    const/16 v22, 0x3

    .line 1510
    .line 1511
    aput v8, v6, v22

    .line 1512
    .line 1513
    const/16 v20, 0x4

    .line 1514
    .line 1515
    aput v9, v6, v20

    .line 1516
    .line 1517
    const/16 v18, 0x5

    .line 1518
    .line 1519
    aput v10, v6, v18

    .line 1520
    .line 1521
    const/16 v17, 0x6

    .line 1522
    .line 1523
    aput v11, v6, v17

    .line 1524
    .line 1525
    const/16 v19, 0x7

    .line 1526
    .line 1527
    aput v12, v6, v19

    .line 1528
    .line 1529
    const/16 v23, 0x8

    .line 1530
    .line 1531
    aput v13, v6, v23

    .line 1532
    .line 1533
    const/16 v34, 0x9

    .line 1534
    .line 1535
    aput v14, v6, v34

    .line 1536
    .line 1537
    const/16 v28, 0xa

    .line 1538
    .line 1539
    aput v15, v6, v28

    .line 1540
    .line 1541
    const/16 v27, 0xb

    .line 1542
    .line 1543
    aput v5, v6, v27

    .line 1544
    .line 1545
    const/16 v26, 0xc

    .line 1546
    .line 1547
    aput v16, v6, v26

    .line 1548
    .line 1549
    const/16 v24, 0xd

    .line 1550
    .line 1551
    aput v16, v6, v24

    .line 1552
    .line 1553
    const/16 v25, 0xe

    .line 1554
    .line 1555
    aput v16, v6, v25

    .line 1556
    .line 1557
    const/16 v21, 0xf

    .line 1558
    .line 1559
    aput v16, v6, v21

    .line 1560
    .line 1561
    iget v5, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation1:I

    .line 1562
    .line 1563
    move/from16 v7, v30

    .line 1564
    .line 1565
    move/from16 v8, v31

    .line 1566
    .line 1567
    invoke-static {v5, v7, v8, v3, v8}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 1568
    .line 1569
    .line 1570
    iget v3, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation2:I

    .line 1571
    .line 1572
    invoke-static {v3, v7, v8, v4, v8}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 1573
    .line 1574
    .line 1575
    iget v3, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->matrixLocation3:I

    .line 1576
    .line 1577
    invoke-static {v3, v7, v8, v6, v8}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 1578
    .line 1579
    .line 1580
    iget v3, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->texSizeHandle:I

    .line 1581
    .line 1582
    invoke-static {v3, v1, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    .line 1583
    .line 1584
    .line 1585
    iget v0, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->landMaskHandle:I

    .line 1586
    .line 1587
    const/high16 v1, 0x3f800000    # 1.0f

    .line 1588
    .line 1589
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 1590
    .line 1591
    .line 1592
    return-void

    .line 1593
    :goto_0
    iget v0, v0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->landMaskHandle:I

    .line 1594
    .line 1595
    move/from16 v1, v16

    .line 1596
    .line 1597
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 1598
    .line 1599
    .line 1600
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->deleteTexture()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getFolder()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string p1, "mask.png"

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->maskImagePath:Ljava/lang/String;

    .line 31
    .line 32
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/BigMouthMaskFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method
