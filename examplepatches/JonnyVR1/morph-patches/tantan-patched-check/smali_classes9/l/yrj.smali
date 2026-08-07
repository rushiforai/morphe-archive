.class public Ll/yrj;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static synthetic a(Ll/y20;Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static b(Landroid/content/Context;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q21;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/q21;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/yec0;->j1:I

    .line 7
    .line 8
    new-instance v1, Ll/xrj;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Ll/xrj;-><init>(Ll/y20;)V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {v0, p0, p1, v1}, Ll/q21;->a(ILandroid/view/ViewGroup;Ll/q21$e;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static c(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->o1:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftTabView;

    .line 17
    .line 18
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/yec0;->l1:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/packetgift/PacketGiftExpirationView;

    .line 13
    .line 14
    return-object p0
.end method
