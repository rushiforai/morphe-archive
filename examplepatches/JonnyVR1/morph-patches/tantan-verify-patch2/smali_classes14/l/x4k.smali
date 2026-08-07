.class public Ll/x4k;
.super Ll/nwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-interface {p2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isNewMainActContext(Landroid/app/Activity;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    const-string p2, "videoChatSquare"

    .line 15
    .line 16
    const/4 p3, 0x0

    .line 17
    invoke-virtual {p0, p1, p2, p3}, Ll/mwl;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {p1}, Ll/jwk0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public l(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "videoChatAnchor"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nwl;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
