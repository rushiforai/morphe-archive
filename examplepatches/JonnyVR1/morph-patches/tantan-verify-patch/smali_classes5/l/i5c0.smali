.class public Ll/i5c0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/i5c0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

.field public b:Z


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

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/i5c0;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/i5c0;->l(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Ll/i5c0;Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/i5c0;->k(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u8def\u5f02\u5e38\uff0c\u62a5\u540d\u5931\u8d25\uff0c\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->campaignPage:Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;->show:Z

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/lc1;->U(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyCampaignPage;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static i()Ll/i5c0;
    .locals 2

    .line 1
    sget-object v0, Ll/i5c0;->c:Ll/i5c0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/i5c0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/i5c0;->c:Ll/i5c0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/i5c0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/i5c0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/i5c0;->c:Ll/i5c0;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/i5c0;->c:Ll/i5c0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyType;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/QuickChatPartyType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->i2:Ll/sua;

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/sua;->h3(Lcom/p1/mobile/putong/core/data/QuickChatPartyType;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    new-instance v0, Ll/c5c0;

    .line 14
    .line 15
    invoke-direct {v0, p0, p1}, Ll/c5c0;-><init>(Ll/i5c0;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/d5c0;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/d5c0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->i2:Ll/sua;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sua;->j3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    new-instance v0, Ll/e5c0;

    .line 14
    .line 15
    invoke-direct {v0, p1}, Ll/e5c0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance p1, Ll/f5c0;

    .line 19
    .line 20
    invoke-direct {p1}, Ll/f5c0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->i2:Ll/sua;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/sua;->k3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/g5c0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/g5c0;-><init>(Ll/i5c0;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/h5c0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/h5c0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/i5c0;->a:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/i5c0;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->invitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 22
    .line 23
    iput-object p1, p0, Ll/i5c0;->a:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyType;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/data/QuickChatPartyType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget v0, Ll/kec0;->L:I

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
    instance-of v0, p0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    move-object v0, p0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/core/ui/quickaudio/party/AudioQuickChatPartyJoinInDialogView;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1, p0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "\u77e5\u9053\u4e86"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 45
    .line 46
    .line 47
    return-void
.end method
