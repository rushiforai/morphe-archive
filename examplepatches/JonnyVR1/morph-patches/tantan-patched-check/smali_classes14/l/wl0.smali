.class public Ll/wl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/sl0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Ll/sl0;

.field public l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;


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

.method public static synthetic a(Ll/wl0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/wl0;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/wl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl0;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/wl0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/wl0;->k(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/xl0;->b(Ll/wl0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/sl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wl0;->k:Ll/sl0;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/sl0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wl0;->e(Ll/sl0;)V

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

.method public final synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/wl0;->k:Ll/sl0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->audience:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->roomId:Ljava/lang/String;

    .line 16
    .line 17
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->endTime:J

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v6}, Ll/sl0;->X2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final synthetic k(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wl0;->k:Ll/sl0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/sl0;->U2()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 6
    .line 7
    sget v1, Ll/hgc0;->d:I

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;-><init>(Landroid/content/Context;I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0}, Ll/wl0;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/wl0;->j:Lv/VText;

    .line 29
    .line 30
    new-instance v0, Ll/tl0;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/tl0;-><init>(Ll/wl0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/wl0;->a:Lv/VImage;

    .line 39
    .line 40
    new-instance v0, Ll/ul0;

    .line 41
    .line 42
    invoke-direct {v0, p0, p2}, Ll/ul0;-><init>(Ll/wl0;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 49
    .line 50
    new-instance v0, Ll/vl0;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/vl0;-><init>(Ll/wl0;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/wl0;->e:Lv/VText;

    .line 59
    .line 60
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->orderMinutes:I

    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-string v1, "%d\u5206\u949f"

    .line 71
    .line 72
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/wl0;->h:Lv/VText;

    .line 80
    .line 81
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatSummary;->rewardPoint:J

    .line 82
    .line 83
    long-to-double v0, v0

    .line 84
    invoke-static {v0, v1}, Ll/yau;->b(D)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/wl0;->l:Lcom/google/android/material/bottomsheet/BottomSheetDialog;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/btu;->d()V

    .line 97
    .line 98
    .line 99
    return-void
.end method
