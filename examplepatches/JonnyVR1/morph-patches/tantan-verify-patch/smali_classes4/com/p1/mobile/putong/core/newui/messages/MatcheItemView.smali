.class public Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lv/VDraweeView;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Lv/VText;

.field public i:Landroid/view/View;

.field public j:Lcom/p1/mobile/putong/core/ui/GradientBgButton;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/core/data/Conversation;

.field public n:Lcom/p1/mobile/putong/data/User;

.field public o:I

.field public p:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public q:Z

.field public r:Landroid/view/View$OnClickListener;

.field public s:Landroid/view/View$OnLongClickListener;

.field public t:Ll/x20;

.field public u:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 5
    .line 6
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->p:Lrx/subjects/a;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->q:Z

    .line 14
    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->t:Ll/x20;

    .line 21
    .line 22
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->u:Ll/pcj;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->p:Lrx/subjects/a;

    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->q:Z

    .line 33
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->t:Ll/x20;

    .line 34
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->u:Ll/pcj;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 36
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->p:Lrx/subjects/a;

    const/4 p1, 0x0

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->q:Z

    .line 38
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->t:Ll/x20;

    .line 39
    new-instance p1, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;

    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->u:Ll/pcj;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->f(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)Landroid/view/View$OnClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->r:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)Landroid/view/View$OnLongClickListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->s:Landroid/view/View$OnLongClickListener;

    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bhx;->a(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic f(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;ILjava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget p2, Lcom/p1/mobile/putong/core/R$string;->mk:I

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 24
    .line 25
    const-string p2, "message_allmatch"

    .line 26
    .line 27
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->u1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->B2:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/util/HashMap;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UserLiveLabel;->ongoingCall:Z

    .line 29
    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    new-array p0, p0, [Ll/sfj0$a;

    .line 35
    .line 36
    const-string v0, "e_live_call_label"

    .line 37
    .line 38
    const-string v1, "p_messages_view"

    .line 39
    .line 40
    invoke-static {v0, v1, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_7

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OptiMVParams;->new_()Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 35
    .line 36
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 37
    .line 38
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 39
    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->o:I

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v2, ""

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 62
    .line 63
    iget-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 64
    .line 65
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    const/4 v2, 0x1

    .line 72
    const/4 v3, 0x0

    .line 73
    if-nez v1, :cond_1

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_0

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    move v1, v3

    .line 85
    goto :goto_1

    .line 86
    :cond_1
    :goto_0
    move v1, v2

    .line 87
    :goto_1
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 88
    .line 89
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 92
    .line 93
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    const-string v4, "1"

    .line 100
    .line 101
    const-string v5, "0"

    .line 102
    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    move-object v1, v4

    .line 106
    goto :goto_2

    .line 107
    :cond_2
    move-object v1, v5

    .line 108
    :goto_2
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v5, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->k:Lv/VImage;

    .line 113
    .line 114
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_4

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->l:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_3

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_3
    move-object v1, v5

    .line 130
    goto :goto_4

    .line 131
    :cond_4
    :goto_3
    move-object v1, v4

    .line 132
    :goto_4
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 135
    .line 136
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    if-eqz v1, :cond_5

    .line 143
    .line 144
    move-object v4, v5

    .line 145
    :cond_5
    iput-object v4, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 146
    .line 147
    iput-object v5, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 150
    .line 151
    iget-object v4, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 152
    .line 153
    iput-object v4, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 154
    .line 155
    const-string v4, "unbreak_ice"

    .line 156
    .line 157
    iput-object v4, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 158
    .line 159
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 160
    .line 161
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    if-eqz v1, :cond_6

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_6

    .line 188
    .line 189
    goto :goto_5

    .line 190
    :cond_6
    move v2, v3

    .line 191
    :goto_5
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 194
    .line 195
    invoke-static {p0}, Ll/om6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 200
    .line 201
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 204
    .line 205
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 206
    .line 207
    invoke-virtual {p0, v0}, Ll/p560;->a(Lcom/p1/mobile/putong/core/data/OptiMVParams;)V

    .line 208
    .line 209
    .line 210
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 211
    .line 212
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 215
    .line 216
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/g;->S:Ll/yk30;

    .line 217
    .line 218
    invoke-virtual {v1, p0, v0}, Ll/p560;->f(Ll/w1m;Lcom/p1/mobile/putong/core/data/OptiMVParams;)V

    .line 219
    .line 220
    .line 221
    :cond_7
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->g()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/vq8;->b()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, ""

    .line 11
    .line 12
    const-string v3, "p_messages_view"

    .line 13
    .line 14
    const/4 v4, 0x1

    .line 15
    if-eqz v1, :cond_4

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/api/g;->vg(Z)Ljava/util/HashSet;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 26
    .line 27
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_4

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/api/g;->zg(Z)Ljava/util/LinkedHashMap;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    iget-object v5, v5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    check-cast v1, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 58
    .line 59
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/core/api/g;->dg(Z)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 64
    .line 65
    invoke-interface {v4, v5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    const-string v5, "onLive"

    .line 70
    .line 71
    iget-object v6, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    const-string v6, "e_live_room_enter"

    .line 78
    .line 79
    const/4 v7, 0x0

    .line 80
    if-eqz v5, :cond_1

    .line 81
    .line 82
    :cond_0
    move-object/from16 v17, v7

    .line 83
    .line 84
    move-object/from16 v18, v17

    .line 85
    .line 86
    move-object/from16 v19, v18

    .line 87
    .line 88
    move-object/from16 v20, v19

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    const-string v5, "onVoice"

    .line 92
    .line 93
    iget-object v8, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveState:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-eqz v5, :cond_0

    .line 100
    .line 101
    const-string v5, "profile_user_id"

    .line 102
    .line 103
    iget-object v6, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->userId:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v5, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    const-string v5, "topic_id"

    .line 110
    .line 111
    iget-object v6, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->voiceRoomTopicId:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v5, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    const-string v6, "audio_card_type"

    .line 118
    .line 119
    const-string v8, "message_new_match"

    .line 120
    .line 121
    invoke-static {v6, v8}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 122
    .line 123
    .line 124
    move-result-object v6

    .line 125
    const-string v8, "audio_room_type"

    .line 126
    .line 127
    const-string v9, "normal_audio"

    .line 128
    .line 129
    invoke-static {v8, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    const-string v9, "e_live_audio_room_enter"

    .line 134
    .line 135
    move-object/from16 v18, v5

    .line 136
    .line 137
    move-object/from16 v19, v6

    .line 138
    .line 139
    move-object/from16 v17, v7

    .line 140
    .line 141
    move-object/from16 v20, v8

    .line 142
    .line 143
    move-object v6, v9

    .line 144
    :goto_0
    const-string v5, "anchorId"

    .line 145
    .line 146
    iget-object v7, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->anchorId:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v5, v7}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    const/4 v5, -0x1

    .line 153
    if-eq v4, v5, :cond_2

    .line 154
    .line 155
    add-int/lit8 v4, v4, 0x1

    .line 156
    .line 157
    :cond_2
    const-string v5, "index"

    .line 158
    .line 159
    invoke-static {v5, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 160
    .line 161
    .line 162
    move-result-object v8

    .line 163
    const-string v4, "liveId"

    .line 164
    .line 165
    iget-object v5, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->liveId:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 168
    .line 169
    .line 170
    move-result-object v9

    .line 171
    const-string v4, "liveRecommendCategory"

    .line 172
    .line 173
    const-string v5, "NA"

    .line 174
    .line 175
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    const-string v4, "module"

    .line 180
    .line 181
    const-string v11, "match_photo"

    .line 182
    .line 183
    invoke-static {v4, v11}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 184
    .line 185
    .line 186
    move-result-object v11

    .line 187
    const-string v4, "right_recommend_type"

    .line 188
    .line 189
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 190
    .line 191
    .line 192
    move-result-object v12

    .line 193
    const-string v4, "show_label"

    .line 194
    .line 195
    iget-object v5, v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->iconTitle:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v4, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 198
    .line 199
    .line 200
    move-result-object v13

    .line 201
    const-string v4, "trace_id"

    .line 202
    .line 203
    invoke-static {v4, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 204
    .line 205
    .line 206
    move-result-object v14

    .line 207
    const-string v2, "live_status"

    .line 208
    .line 209
    const-string v4, "on"

    .line 210
    .line 211
    invoke-static {v2, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 212
    .line 213
    .line 214
    move-result-object v15

    .line 215
    const-string v2, "window_type"

    .line 216
    .line 217
    const-string v4, "null"

    .line 218
    .line 219
    invoke-static {v2, v4}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 220
    .line 221
    .line 222
    move-result-object v16

    .line 223
    filled-new-array/range {v7 .. v20}, [Ll/sfj0$a;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-static {v6, v3, v2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 228
    .line 229
    .line 230
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 231
    .line 232
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 233
    .line 234
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 235
    .line 236
    .line 237
    move-result v2

    .line 238
    if-nez v2, :cond_3

    .line 239
    .line 240
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 243
    .line 244
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 245
    .line 246
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/api/g;->Bo(Ljava/lang/String;)Lrx/c;

    .line 249
    .line 250
    .line 251
    :cond_3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-static {v0, v1}, Ll/u1t;->a(Landroid/app/Activity;Lcom/p1/mobile/putong/data/UserLiveLabel;)V

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :cond_4
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 264
    .line 265
    .line 266
    move-result-object v5

    .line 267
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 268
    .line 269
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 270
    .line 271
    const/4 v7, 0x0

    .line 272
    invoke-static {v5, v6, v7, v7}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->k2(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 273
    .line 274
    .line 275
    move-result-object v5

    .line 276
    invoke-virtual {v1, v5}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 277
    .line 278
    .line 279
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 280
    .line 281
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    if-eqz v1, :cond_5

    .line 286
    .line 287
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 288
    .line 289
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 290
    .line 291
    invoke-static {}, Ll/syu;->h()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v5

    .line 295
    invoke-static {v1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    if-eqz v1, :cond_5

    .line 300
    .line 301
    const-string v1, "e_live_vip_customer_service"

    .line 302
    .line 303
    new-array v5, v7, [Ll/sfj0$a;

    .line 304
    .line 305
    invoke-static {v1, v3, v5}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 306
    .line 307
    .line 308
    :cond_5
    invoke-static {}, Ll/gra;->l2()Z

    .line 309
    .line 310
    .line 311
    move-result v1

    .line 312
    if-eqz v1, :cond_6

    .line 313
    .line 314
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 315
    .line 316
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 317
    .line 318
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    if-nez v1, :cond_6

    .line 323
    .line 324
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 325
    .line 326
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localNotifyMomentId:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->localInsertedMomentId:Ljava/lang/String;

    .line 329
    .line 330
    invoke-static {v5, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 331
    .line 332
    .line 333
    move-result v1

    .line 334
    if-nez v1, :cond_6

    .line 335
    .line 336
    move v1, v4

    .line 337
    goto :goto_1

    .line 338
    :cond_6
    move v1, v7

    .line 339
    :goto_1
    sget-object v5, Ll/c17;->h:Ljava/text/DecimalFormat;

    .line 340
    .line 341
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 342
    .line 343
    iget-wide v8, v6, Lcom/p1/mobile/putong/core/data/Conversation;->createdTime:D

    .line 344
    .line 345
    invoke-virtual {v5, v8, v9}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v5

    .line 349
    const-string v6, "create_time"

    .line 350
    .line 351
    invoke-static {v6, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 352
    .line 353
    .line 354
    move-result-object v8

    .line 355
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 356
    .line 357
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 358
    .line 359
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 360
    .line 361
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 362
    .line 363
    .line 364
    move-result v5

    .line 365
    const-string v6, "1"

    .line 366
    .line 367
    const-string v9, "0"

    .line 368
    .line 369
    if-eqz v5, :cond_7

    .line 370
    .line 371
    move-object v5, v6

    .line 372
    goto :goto_2

    .line 373
    :cond_7
    move-object v5, v9

    .line 374
    :goto_2
    const-string v10, "is_online"

    .line 375
    .line 376
    invoke-static {v10, v5}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 377
    .line 378
    .line 379
    move-result-object v5

    .line 380
    new-instance v10, Ljava/lang/StringBuilder;

    .line 381
    .line 382
    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    iget v11, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->o:I

    .line 386
    .line 387
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 388
    .line 389
    .line 390
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v10

    .line 394
    const-string v11, "new_match_rank"

    .line 395
    .line 396
    invoke-static {v11, v10}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 397
    .line 398
    .line 399
    move-result-object v10

    .line 400
    iget-object v11, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 401
    .line 402
    iget-object v11, v11, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 403
    .line 404
    const-string v12, "moments_user_id"

    .line 405
    .line 406
    invoke-static {v12, v11}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 407
    .line 408
    .line 409
    move-result-object v11

    .line 410
    const-string v12, "operation_id"

    .line 411
    .line 412
    invoke-static {v12, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 413
    .line 414
    .line 415
    move-result-object v12

    .line 416
    if-eqz v1, :cond_8

    .line 417
    .line 418
    move-object v1, v6

    .line 419
    goto :goto_3

    .line 420
    :cond_8
    move-object v1, v9

    .line 421
    :goto_3
    const-string v2, "is_new_moment"

    .line 422
    .line 423
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 424
    .line 425
    .line 426
    move-result-object v13

    .line 427
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 428
    .line 429
    if-nez v1, :cond_a

    .line 430
    .line 431
    :cond_9
    move v4, v7

    .line 432
    goto :goto_4

    .line 433
    :cond_a
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeHeartbeatConv()Z

    .line 434
    .line 435
    .line 436
    move-result v1

    .line 437
    if-nez v1, :cond_b

    .line 438
    .line 439
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 440
    .line 441
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isFakeQuickChatConv()Z

    .line 442
    .line 443
    .line 444
    move-result v1

    .line 445
    if-eqz v1, :cond_9

    .line 446
    .line 447
    :cond_b
    :goto_4
    const-string v1, "is_fake"

    .line 448
    .line 449
    invoke-static {v1, v4}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 450
    .line 451
    .line 452
    move-result-object v14

    .line 453
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->k:Lv/VImage;

    .line 454
    .line 455
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 456
    .line 457
    .line 458
    move-result v1

    .line 459
    if-eqz v1, :cond_d

    .line 460
    .line 461
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->l:Lv/VText;

    .line 462
    .line 463
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    if-nez v1, :cond_c

    .line 468
    .line 469
    goto :goto_5

    .line 470
    :cond_c
    move-object v1, v9

    .line 471
    goto :goto_6

    .line 472
    :cond_d
    :goto_5
    move-object v1, v6

    .line 473
    :goto_6
    const-string v2, "is_onlive_anchor"

    .line 474
    .line 475
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 476
    .line 477
    .line 478
    move-result-object v15

    .line 479
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 480
    .line 481
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 482
    .line 483
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 484
    .line 485
    .line 486
    move-result v1

    .line 487
    if-eqz v1, :cond_e

    .line 488
    .line 489
    move-object v6, v9

    .line 490
    :cond_e
    const-string v1, "is_red_dot"

    .line 491
    .line 492
    invoke-static {v1, v6}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 493
    .line 494
    .line 495
    move-result-object v16

    .line 496
    const-string v1, "new_msg_page_module"

    .line 497
    .line 498
    invoke-static {v1, v9}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 499
    .line 500
    .line 501
    move-result-object v17

    .line 502
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 503
    .line 504
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 505
    .line 506
    const-string v2, "other_uid"

    .line 507
    .line 508
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 509
    .line 510
    .line 511
    move-result-object v18

    .line 512
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 513
    .line 514
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 515
    .line 516
    const-string v2, "red_dot_num"

    .line 517
    .line 518
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 519
    .line 520
    .line 521
    move-result-object v19

    .line 522
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 523
    .line 524
    .line 525
    move-result-object v1

    .line 526
    invoke-virtual {v1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 527
    .line 528
    .line 529
    move-result-object v1

    .line 530
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->b8()Z

    .line 531
    .line 532
    .line 533
    move-result v1

    .line 534
    if-eqz v1, :cond_f

    .line 535
    .line 536
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 537
    .line 538
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Conversation;->isPlatinumTop()Z

    .line 539
    .line 540
    .line 541
    move-result v1

    .line 542
    if-eqz v1, :cond_f

    .line 543
    .line 544
    const-string v1, "yes"

    .line 545
    .line 546
    goto :goto_7

    .line 547
    :cond_f
    const-string v1, "no"

    .line 548
    .line 549
    :goto_7
    const-string v2, "is_platinum_top_chat"

    .line 550
    .line 551
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 552
    .line 553
    .line 554
    move-result-object v20

    .line 555
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 556
    .line 557
    invoke-static {v1}, Ll/om6;->a(Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v1

    .line 561
    const-string v2, "messagec_cell_type"

    .line 562
    .line 563
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 564
    .line 565
    .line 566
    move-result-object v21

    .line 567
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 568
    .line 569
    invoke-static {v1}, Ll/om6;->e(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 570
    .line 571
    .line 572
    move-result v1

    .line 573
    const-string v2, "spark_level"

    .line 574
    .line 575
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 576
    .line 577
    .line 578
    move-result-object v22

    .line 579
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 580
    .line 581
    invoke-static {v1}, Ll/om6;->d(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 582
    .line 583
    .line 584
    move-result v1

    .line 585
    const-string v2, "message_pairs"

    .line 586
    .line 587
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 588
    .line 589
    .line 590
    move-result-object v23

    .line 591
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 592
    .line 593
    invoke-static {v1}, Ll/om6;->b(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 594
    .line 595
    .line 596
    move-result v1

    .line 597
    const-string v2, "is_close_friend"

    .line 598
    .line 599
    invoke-static {v2, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 600
    .line 601
    .line 602
    move-result-object v24

    .line 603
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 604
    .line 605
    invoke-static {v0}, Ll/om6;->c(Lcom/p1/mobile/putong/core/data/Conversation;)I

    .line 606
    .line 607
    .line 608
    move-result v0

    .line 609
    const-string v1, "is_top_recommend"

    .line 610
    .line 611
    invoke-static {v1, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 612
    .line 613
    .line 614
    move-result-object v25

    .line 615
    move-object v9, v5

    .line 616
    filled-new-array/range {v8 .. v25}, [Ll/sfj0$a;

    .line 617
    .line 618
    .line 619
    move-result-object v0

    .line 620
    const-string v1, "e_messages_view_match"

    .line 621
    .line 622
    invoke-static {v1, v3, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 623
    .line 624
    .line 625
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->R:Ll/p560;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->n:Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/p560;->d(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->m:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Conversation;->otherUser:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    sget v1, Lcom/p1/mobile/putong/core/R$string;->mk:I

    .line 42
    .line 43
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v1, 0x1

    .line 48
    new-array v2, v1, [Ljava/lang/CharSequence;

    .line 49
    .line 50
    aput-object p1, v2, v0

    .line 51
    .line 52
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->e()Lcom/p1/mobile/putong/app/PutongAct;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    new-array v2, v2, [Ljava/lang/CharSequence;

    .line 69
    .line 70
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, [Ljava/lang/CharSequence;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->f0([Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    new-instance v0, Ll/ahx;

    .line 81
    .line 82
    invoke-direct {v0, p0}, Ll/ahx;-><init>(Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->g0(Lcom/p1/mobile/android/app/Dialog$g;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 90
    .line 91
    .line 92
    return v1

    .line 93
    :cond_1
    return v0
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->r:Landroid/view/View$OnClickListener;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnLongClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/zg6;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/MatcheItemView;->s:Landroid/view/View$OnLongClickListener;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
