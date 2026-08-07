.class public Lcom/momo/xeengine/cv/bean/XEMutableData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public float1:F

.field public float2:F

.field public float3:F

.field public float4:F

.field public floatArray1:[F

.field public floatArray2:[F

.field public floatArray3:[F

.field public floatArray4:[F

.field public int1:I

.field public int2:I

.field public int3:I

.field public int4:I

.field public mat1:[F

.field public mat2:[F

.field public str1:Ljava/lang/String;

.field public str2:Ljava/lang/String;

.field public vec1:[F

.field public vec2:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFloat1()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float1:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloat2()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float2:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloat3()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float3:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloat4()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float4:F

    .line 2
    .line 3
    return p0
.end method

.method public getFloatArray1()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray1:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatArray2()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray2:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatArray3()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray3:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloatArray4()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray4:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFloats()[F
    .locals 5

    .line 1
    iget v0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float1:F

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float2:F

    .line 4
    .line 5
    iget v2, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float3:F

    .line 6
    .line 7
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float4:F

    .line 8
    .line 9
    const/4 v3, 0x4

    .line 10
    new-array v3, v3, [F

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    aput v0, v3, v4

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    aput v1, v3, v0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    aput v2, v3, v0

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    aput p0, v3, v0

    .line 23
    .line 24
    return-object v3
.end method

.method public getInt1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int1:I

    .line 2
    .line 3
    return p0
.end method

.method public getInt2()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int2:I

    .line 2
    .line 3
    return p0
.end method

.method public getInt3()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int3:I

    .line 2
    .line 3
    return p0
.end method

.method public getInt4()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int4:I

    .line 2
    .line 3
    return p0
.end method

.method public getInts()[I
    .locals 3

    .line 1
    iget v0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int1:I

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int2:I

    .line 4
    .line 5
    iget v2, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int3:I

    .line 6
    .line 7
    iget p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int4:I

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, p0}, [I

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getMat1()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat1:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getMat2()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat2:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getStr1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->str1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStr2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->str2:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVec1()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec1:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getVec2()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec2:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public setFloat1(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float1:F

    .line 2
    .line 3
    return-void
.end method

.method public setFloat2(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float2:F

    .line 2
    .line 3
    return-void
.end method

.method public setFloat3(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float3:F

    .line 2
    .line 3
    return-void
.end method

.method public setFloat4(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->float4:F

    .line 2
    .line 3
    return-void
.end method

.method public setFloatArray1([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray1:[F

    .line 2
    .line 3
    return-void
.end method

.method public setFloatArray2([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray2:[F

    .line 2
    .line 3
    return-void
.end method

.method public setFloatArray3([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray3:[F

    .line 2
    .line 3
    return-void
.end method

.method public setFloatArray4([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->floatArray4:[F

    .line 2
    .line 3
    return-void
.end method

.method public setInt1(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int1:I

    .line 2
    .line 3
    return-void
.end method

.method public setInt2(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int2:I

    .line 2
    .line 3
    return-void
.end method

.method public setInt3(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int3:I

    .line 2
    .line 3
    return-void
.end method

.method public setInt4(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->int4:I

    .line 2
    .line 3
    return-void
.end method

.method public setMat1([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat1:[F

    .line 2
    .line 3
    return-void
.end method

.method public setMat2([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->mat2:[F

    .line 2
    .line 3
    return-void
.end method

.method public setStr1(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->str1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStr2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->str2:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVec1([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec1:[F

    .line 2
    .line 3
    return-void
.end method

.method public setVec2([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/cv/bean/XEMutableData;->vec2:[F

    .line 2
    .line 3
    return-void
.end method
