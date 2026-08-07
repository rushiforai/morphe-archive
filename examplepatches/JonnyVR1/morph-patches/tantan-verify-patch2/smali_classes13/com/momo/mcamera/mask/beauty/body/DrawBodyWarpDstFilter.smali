.class public Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpDstFilter;
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
.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4(0.0, 1.0, 0.0, 1.0)"

    .line 2
    .line 3
    return-object p0
.end method

.method public getPointSize()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "3.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public handCoord(ILl/omw;)V
    .locals 0

    .line 1
    iget-object p1, p2, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/momocv/beauty/BodyWarpInfo;->dst_warp_points_:[F

    .line 4
    .line 5
    iput-object p1, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 6
    .line 7
    return-void
.end method
