.class public Lcom/momo/mcamera/mask/beauty/DrawBodySegmentFilter;
.super Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public updateFaceInfo(Ll/omw;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "mediaRender"

    .line 8
    .line 9
    const-string p1, "No face"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_4

    .line 17
    .line 18
    iget-object v2, p1, Ll/omw;->l:Lcom/core/glcore/util/BodyLandData;

    .line 19
    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    iget-object v2, p1, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 25
    .line 26
    if-eqz v2, :cond_3

    .line 27
    .line 28
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    array-length v3, v3

    .line 33
    array-length v4, v2

    .line 34
    if-eq v3, v4, :cond_2

    .line 35
    .line 36
    :cond_1
    array-length v2, v2

    .line 37
    new-array v2, v2, [F

    .line 38
    .line 39
    iput-object v2, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 40
    .line 41
    :cond_2
    invoke-virtual {p0, v1, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->handCoord(ILl/omw;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_4
    return-void
.end method
