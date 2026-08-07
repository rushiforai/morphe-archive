.class public Lcom/momo/mcamera/mask/beauty/DrawFaceWarpDstFilter;
.super Lcom/momo/mcamera/mask/beauty/DrawFaceWarpSrcFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/beauty/DrawFaceWarpSrcFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4(0.0, 0.0, 1.0, 1.0)"

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
    iget-object p0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceWarpSrcFilter;->facePos222:[[F

    .line 2
    .line 3
    iget-object p2, p2, Ll/omw;->r:[[F

    .line 4
    .line 5
    aget-object p2, p2, p1

    .line 6
    .line 7
    aput-object p2, p0, p1

    .line 8
    .line 9
    return-void
.end method
