.class public Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lv/VImage;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VText;

.field public j:Landroid/view/View;

.field public k:Landroid/widget/ImageView;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Landroid/widget/ImageView;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Ljava/lang/String;

.field public r:Ljava/lang/String;

.field public s:Ll/th0;

.field public t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

.field public u:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "satisfied"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->q2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->o2(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->p2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->w2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->n2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->r2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->l2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static i2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "live_force_stop_content"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "live_chat_id"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "live_anchor_id"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "live_trace_id"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method private synthetic k2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->q:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static/range {p1 .. p6}, Ll/efv;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->d2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/4 v0, 0x0

    .line 9
    sget v1, Ll/q7c0;->f:I

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tju;->b(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "live_chat_id"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->q:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "live_force_stop_content"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->r:Ljava/lang/String;

    .line 31
    .line 32
    return-void
.end method

.method public initSubscription()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->r:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, "videoChat"

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/th0$a;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->r:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v2, Ll/kju;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/kju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v2, "\u597d\u7684"

    .line 37
    .line 38
    invoke-virtual {v0, v2}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Ll/th0$a;->a()Ll/th0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->s:Ll/th0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/th0;->g()V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "LiveVChatEndAct show alert:"

    .line 54
    .line 55
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->r:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->q:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u2(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    const-string p0, "LiveVChatEndAct requestAndShowSummary "

    .line 77
    .line 78
    invoke-static {v1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final synthetic l2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H9:I

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic m2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p2}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->chatId:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p2, p1, p0}, Ll/btu;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->roomId:Ljava/lang/String;

    .line 8
    .line 9
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->endTime:J

    .line 10
    .line 11
    move-object v2, v1

    .line 12
    move-object v0, p0

    .line 13
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->s2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o2(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic p2(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "dissatisfied"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    xor-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic q2(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "basic_satisfaction"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    xor-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic r2(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "satisfied"

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->u:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    xor-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->v2(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final u2(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requestAndShowSummary:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Ll/jwu;->K(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/lju;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/lju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Ll/mju;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/mju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public v2(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 9
    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->h:Landroid/widget/ImageView;

    .line 15
    .line 16
    sget p1, Ll/nbc0;->L0:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 23
    .line 24
    if-ne p1, p2, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->k:Landroid/widget/ImageView;

    .line 27
    .line 28
    sget p1, Ll/nbc0;->H0:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 35
    .line 36
    if-ne p1, p2, :cond_5

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->n:Landroid/widget/ImageView;

    .line 39
    .line 40
    sget p1, Ll/nbc0;->J0:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    if-ne p1, v0, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->h:Landroid/widget/ImageView;

    .line 49
    .line 50
    sget p1, Ll/nbc0;->M0:I

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 57
    .line 58
    if-ne p1, p2, :cond_4

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->k:Landroid/widget/ImageView;

    .line 61
    .line 62
    sget p1, Ll/nbc0;->I0:I

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 69
    .line 70
    if-ne p1, p2, :cond_5

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->n:Landroid/widget/ImageView;

    .line 73
    .line 74
    sget p1, Ll/nbc0;->K0:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 77
    .line 78
    .line 79
    :cond_5
    return-void
.end method

.method public final w2(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Ll/hgc0;->d:I

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->h2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->p:Lv/VText;

    .line 33
    .line 34
    new-instance v1, Ll/nju;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/nju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->c:Lv/VImage;

    .line 43
    .line 44
    new-instance v1, Ll/oju;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/oju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 53
    .line 54
    new-instance v1, Ll/pju;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/pju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->e:Lv/VText;

    .line 63
    .line 64
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->orderMinutes:I

    .line 65
    .line 66
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "\u672c\u6b21\u901a\u8bdd\u65f6\u957f%d\u5206\u949f"

    .line 75
    .line 76
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->f:Lv/VText;

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "\u8bf7\u8bc4\u4ef7\u672c\u6b21\u548c "

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 93
    .line 94
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 95
    .line 96
    const/4 v3, 0x6

    .line 97
    invoke-static {v2, v3}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v2, " \u7684\u901a\u8bdd\u4f53\u9a8c"

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->g:Landroid/view/View;

    .line 117
    .line 118
    new-instance v1, Ll/qju;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/qju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->j:Landroid/view/View;

    .line 127
    .line 128
    new-instance v1, Ll/rju;

    .line 129
    .line 130
    invoke-direct {v1, p0}, Ll/rju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 131
    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->m:Landroid/view/View;

    .line 137
    .line 138
    new-instance v1, Ll/sju;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/sju;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 144
    .line 145
    .line 146
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/end/LiveVChatEndAct;->t:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 149
    .line 150
    .line 151
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 154
    .line 155
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->chatId:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {p0, p1}, Ll/btu;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method
