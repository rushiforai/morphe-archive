.class public Ll/fon0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/won0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;

.field public b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public c:Ll/won0;

.field public d:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;>;"
        }
    .end annotation
.end field


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

.method public static synthetic a(Ll/fon0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fon0;->i(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/fon0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fon0;->j(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/fon0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fon0;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;

    .line 2
    .line 3
    iput-object p1, p0, Ll/fon0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/ViewGroup;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 16
    .line 17
    return-void
.end method

.method private synthetic i(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/fon0;->d:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/fon0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/fon0;->c:Ll/won0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/won0;->j:Ll/vb3;

    .line 12
    .line 13
    iget-object p0, p0, Ll/vb3;->d:Ljava/util/List;

    .line 14
    .line 15
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceIntlSettingLayout;->h(Ljava/util/Map;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private synthetic j(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fon0;->c:Ll/won0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/won0;->j4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fon0;->c:Ll/won0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Ll/won0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fon0;->c:Ll/won0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/won0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fon0;->d(Ll/won0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public k(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ic3<",
            "*>;>;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fon0;->d:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public l()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    iget-object v1, p0, Ll/fon0;->c:Ll/won0;

    .line 8
    .line 9
    sget v2, Ll/yec0;->j9:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 15
    .line 16
    new-instance v1, Ll/con0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/con0;-><init>(Ll/fon0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 25
    .line 26
    new-instance v1, Ll/don0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/don0;-><init>(Ll/fon0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 35
    .line 36
    new-instance v1, Ll/eon0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/eon0;-><init>(Ll/fon0;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p0, p0, Ll/fon0;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 47
    .line 48
    .line 49
    return-void
.end method
