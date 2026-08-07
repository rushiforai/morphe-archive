.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public height:I

.field public width:I

.field public yuvData:[B


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
.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public getYuvData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->yuvData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->width:I

    .line 2
    .line 3
    return-void
.end method

.method public setYuvData([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/OriginYuvData;->yuvData:[B

    .line 2
    .line 3
    return-void
.end method
