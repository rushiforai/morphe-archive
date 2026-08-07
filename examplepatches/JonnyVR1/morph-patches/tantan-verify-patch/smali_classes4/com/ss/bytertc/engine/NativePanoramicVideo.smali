.class public Lcom/ss/bytertc/engine/NativePanoramicVideo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/IPanoramicVideo;


# static fields
.field private static final TAG:Ljava/lang/String; = "NativePanoramicVideo}"


# instance fields
.field private mNaiveInstance:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/ss/bytertc/engine/NativePanoramicVideo;->mNaiveInstance:J

    .line 5
    .line 6
    return-void
.end method

.method public static native nativeUpdateQuaternionf(JFFFF)I
.end method


# virtual methods
.method public release()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/ss/bytertc/engine/NativePanoramicVideo;->mNaiveInstance:J

    .line 4
    .line 5
    return-void
.end method

.method public updateQuaternionf(Lcom/ss/bytertc/engine/data/Quaternionf;)I
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/NativePanoramicVideo;->mNaiveInstance:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "NativePanoramicVideo}"

    .line 10
    .line 11
    const-string p1, "native Panoramic is invalid, updateQuaternionf failed."

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, -0x1

    .line 17
    return p0

    .line 18
    :cond_0
    iget v2, p1, Lcom/ss/bytertc/engine/data/Quaternionf;->x:F

    .line 19
    .line 20
    iget v3, p1, Lcom/ss/bytertc/engine/data/Quaternionf;->y:F

    .line 21
    .line 22
    iget v4, p1, Lcom/ss/bytertc/engine/data/Quaternionf;->z:F

    .line 23
    .line 24
    iget v5, p1, Lcom/ss/bytertc/engine/data/Quaternionf;->w:F

    .line 25
    .line 26
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativePanoramicVideo;->nativeUpdateQuaternionf(JFFFF)I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0
.end method
