.class public Ll/nvj0;
.super Ll/puj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/puj0<",
        "Ll/mvj0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lv/VRelative;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VDraweeView;

.field public h:Lv/VText;

.field public i:Lv/VLinear;


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/puj0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nvj0;->k(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->k6:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/mdc0;->C7:I

    .line 2
    .line 3
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 5
    .line 6
    const-string p3, "votingResult"

    .line 7
    .line 8
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 16
    .line 17
    if-nez p2, :cond_2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_2
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->isDraw:Z

    .line 21
    .line 22
    iget-object p3, p0, Ll/nvj0;->e:Lv/VLinear;

    .line 23
    .line 24
    const/16 v0, 0x8

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz p2, :cond_3

    .line 28
    .line 29
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/nvj0;->i:Lv/VLinear;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    invoke-virtual {p3, v1}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Ll/nvj0;->i:Lv/VLinear;

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 44
    .line 45
    .line 46
    iget-object p2, p0, Ll/nvj0;->g:Lv/VDraweeView;

    .line 47
    .line 48
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 49
    .line 50
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->outUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 51
    .line 52
    invoke-static {p2, p3, v1}, Ll/ql3;->b(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Ll/nvj0;->f:Lv/VText;

    .line 56
    .line 57
    iget-object p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 58
    .line 59
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->resultStr:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->outUserRole:Ljava/lang/String;

    .line 67
    .line 68
    const-string p3, "undercover"

    .line 69
    .line 70
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    if-eqz p2, :cond_4

    .line 75
    .line 76
    iget-object p0, p0, Ll/nvj0;->h:Lv/VText;

    .line 77
    .line 78
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fc:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->voteResult:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;

    .line 85
    .line 86
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverVoteResult;->outUserRole:Ljava/lang/String;

    .line 87
    .line 88
    const-string p2, "normal"

    .line 89
    .line 90
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_5

    .line 95
    .line 96
    iget-object p0, p0, Ll/nvj0;->h:Lv/VText;

    .line 97
    .line 98
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->yc:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 101
    .line 102
    .line 103
    :cond_5
    :goto_0
    return-void
.end method

.method public final k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ovj0;->a(Ll/nvj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
