.class public Ll/e5y;
.super Ll/gr2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gr2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->c0(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/tantanapp/common/network/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e5y;->d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/gr2;->d(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ll/d5y;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/d5y;-><init>(Lcom/tantanapp/common/network/NetworkTrackInfo;)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    invoke-static {p0, p1}, Ll/l51;->z(Ljava/lang/Runnable;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
