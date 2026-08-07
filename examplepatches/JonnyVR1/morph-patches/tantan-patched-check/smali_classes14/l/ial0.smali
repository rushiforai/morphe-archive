.class public Ll/ial0;
.super Ll/lbl0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lbl0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ial0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ial0;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic k(Ll/ial0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ial0;->n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic l(Ll/ial0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ial0;->o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    return-void
.end method

.method private synthetic n(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/lbl0;->e(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ial0;->b:Ljava/lang/String;

    .line 7
    .line 8
    invoke-direct {v0, p2, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;->c2(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    sget p0, Ll/q7c0;->e:I

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    invoke-virtual {p1, p0, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private synthetic o(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ial0;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/lbl0;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ial0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ial0;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v0, v1, v2}, Ll/jwu;->V(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/gal0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/gal0;-><init>(Ll/ial0;Lcom/p1/mobile/android/app/Act;)V

    .line 16
    .line 17
    .line 18
    new-instance v2, Ll/hal0;

    .line 19
    .line 20
    invoke-direct {v2, p0, p1}, Ll/hal0;-><init>(Ll/ial0;Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "sendStartReq"

    .line 2
    .line 3
    return-object p0
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/it0;->D(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/lbl0;->c(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    instance-of p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    if-eqz p0, :cond_2

    .line 10
    .line 11
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 12
    .line 13
    iget p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 14
    .line 15
    const v0, 0x9c47

    .line 16
    .line 17
    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/a;->m(Lcom/p1/mobile/android/app/Act;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    const v0, 0x9c49

    .line 26
    .line 27
    .line 28
    if-ne p0, v0, :cond_1

    .line 29
    .line 30
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Gb(Landroid/content/Context;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_2
    if-eqz p2, :cond_3

    .line 42
    .line 43
    sget p0, Lcom/p1/mobile/putong/live/external/R$string;->R:I

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    goto :goto_0

    .line 50
    :cond_3
    const-string p0, ""

    .line 51
    .line 52
    :goto_0
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
