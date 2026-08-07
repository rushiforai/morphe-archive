.class public Ll/evn0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/evn0;->a:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/evn0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;->getLayoutId()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveDefaultBulletView;

    .line 29
    .line 30
    iget-object p0, p0, Ll/evn0;->a:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    return-object p2

    .line 36
    :cond_0
    return-object v0
.end method

.method public b(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;->SPECIAL_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletType;->getLayoutId()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveSpecialSystemBulletView;

    .line 21
    .line 22
    return-object p0
.end method
