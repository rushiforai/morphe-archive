.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VImage;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/p1/mobile/putong/core/data/Conversation;

.field public k:Lcom/p1/mobile/putong/data/User;

.field public l:Landroid/os/Parcelable;

.field public m:Ll/w30;

.field public n:Ljava/lang/Long;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 14
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 16
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 17
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const-wide/16 p1, 0x0

    .line 18
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->j(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->i(Lv/VListCell;Lv/VListCell$a;I)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->g(Landroid/view/View;)V

    return-void
.end method

.method private getSubContentText()Ljava/lang/String;
    .locals 5

    const-string v0, ""

    return-object v0

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    long-to-double v0, v0

    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 17
    .line 18
    iget-wide v3, v3, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 19
    .line 20
    sub-double/2addr v0, v3

    .line 21
    double-to-long v0, v0

    .line 22
    const-wide/32 v3, 0xea60

    .line 23
    .line 24
    .line 25
    div-long/2addr v0, v3

    .line 26
    const-wide/16 v3, 0x3c

    .line 27
    .line 28
    cmp-long v3, v0, v3

    .line 29
    .line 30
    if-gez v3, :cond_1

    .line 31
    .line 32
    const-wide/16 v2, 0xa

    .line 33
    .line 34
    cmp-long v2, v0, v2

    .line 35
    .line 36
    if-gtz v2, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Ac:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v2, Lcom/p1/mobile/putong/core/R$string;->xc:I

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 75
    .line 76
    invoke-virtual {v0, v2}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 81
    .line 82
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 83
    .line 84
    iget v1, v1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 85
    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    const/16 v0, 0x1388

    .line 89
    .line 90
    if-ge v1, v0, :cond_3

    .line 91
    .line 92
    const/16 v0, 0x3e8

    .line 93
    .line 94
    if-ge v1, v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget v0, Lcom/p1/mobile/putong/core/R$string;->zc:I

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    const/4 v0, 0x1

    .line 107
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    return-object p0

    .line 120
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    sget v2, Lcom/p1/mobile/putong/core/R$string;->zc:I

    .line 125
    .line 126
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    div-int/2addr v1, v0

    .line 131
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    return-object p0

    .line 144
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    sget v0, Lcom/p1/mobile/putong/core/R$string;->yc:I

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    return-object p0
.end method

.method private getSubFrontText()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget v0, Lcom/p1/mobile/putong/core/R$string;->wc:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, ""

    .line 21
    .line 22
    return-object p0
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wa6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/app/PutongAct;
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

.method public final synthetic g(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->e:Lv/VImage;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    sget-object p1, Ll/qap;->Companion:Ll/qap$a;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-virtual {p1, v0}, Ll/qap$a;->v(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Qr()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    const-string v3, ""

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1, v3, v2}, Ll/qap$a;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 40
    .line 41
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    const-string p1, "other_user_id"

    .line 52
    .line 53
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "e_locked_match"

    .line 62
    .line 63
    const-string v0, "p_messages_view"

    .line 64
    .line 65
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->m:Ll/w30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Lv/VListCell;Lv/VListCell$a;I)V
    .locals 0

    .line 1
    sget-object p1, Ll/qap;->Companion:Ll/qap$a;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p2}, Ll/qap$a;->d(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->v2:Ll/qa9;

    .line 13
    .line 14
    const-string p2, ""

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Ll/qa9;->J3(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->m:Ll/w30;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/w30;->b()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->t(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Ll/w30$b;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p1, v0}, Ll/w30$b;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    sget v2, Lcom/p1/mobile/putong/core/R$string;->j:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {p1, v1}, Ll/w30$b;->I(Ljava/lang/CharSequence;)Ll/w30$b;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v1, Ll/ua6;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/ua6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v1}, Ll/w30$b;->U(Landroid/view/View$OnClickListener;)Ll/w30$b;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v0}, Ll/w30$b;->Q(Ljava/util/List;)Ll/w30$b;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v0, Ll/va6;

    .line 67
    .line 68
    invoke-direct {v0, p0}, Ll/va6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/w30$b;->V(Ll/w30$d;)Ll/w30$b;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/w30$b;->F()Ll/w30;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->m:Ll/w30;

    .line 80
    .line 81
    invoke-virtual {p1}, Ll/w30;->f()V

    .line 82
    .line 83
    .line 84
    const/4 p0, 0x0

    .line 85
    return p0
.end method

.method public k(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->q()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->s()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->r()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->g:Lv/VText;

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->g:Lv/VText;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->b:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->p0(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->j:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    iget-wide v0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->i:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final o()V
    .locals 5

    return-void

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->getSubFrontText()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->getSubContentText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const-string v2, "%s \u00b7 %s"

    .line 14
    .line 15
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 20
    .line 21
    invoke-direct {v2, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->f()Lcom/p1/mobile/putong/app/PutongAct;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget v4, Ll/c9c0;->Q0:I

    .line 35
    .line 36
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-direct {v1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/lit8 v0, v0, 0x2

    .line 48
    .line 49
    const/16 v3, 0x21

    .line 50
    .line 51
    const/4 v4, 0x0

    .line 52
    invoke-virtual {v2, v1, v4, v0, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->h:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->e:Lv/VImage;

    .line 2
    .line 3
    sget-object v0, Ll/qap;->Companion:Ll/qap$a;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/qap$a;->g()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/16 v0, 0x8

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->p()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->l()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->o()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final r()V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    .line 6
    .line 7
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/16 v2, 0x12c

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->n:Ljava/lang/Long;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->k:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "other_user_id"

    .line 42
    .line 43
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    filled-new-array {p0}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v0, "e_locked_match"

    .line 52
    .line 53
    const-string v1, "p_messages_view"

    .line 54
    .line 55
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    new-instance v0, Ll/sa6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sa6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/ta6;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/ta6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t(Landroid/content/Context;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const-string v0, "vibrator"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/os/Vibrator;

    .line 11
    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 15
    .line 16
    const/16 v1, 0x1a

    .line 17
    .line 18
    const-wide/16 v2, 0x1e

    .line 19
    .line 20
    if-lt v0, v1, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->l:Landroid/os/Parcelable;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    const/16 v0, 0x96

    .line 27
    .line 28
    invoke-static {v2, v3, v0}, Ll/cm3;->a(JI)Landroid/os/VibrationEffect;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->l:Landroid/os/Parcelable;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->l:Landroid/os/Parcelable;

    .line 35
    .line 36
    invoke-static {v0}, Ll/qa6;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemIntlReceiveLikeView;->l:Landroid/os/Parcelable;

    .line 43
    .line 44
    invoke-static {p0}, Ll/ra6;->a(Ljava/lang/Object;)Landroid/os/VibrationEffect;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-static {p1, p0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    invoke-virtual {p1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V

    .line 53
    .line 54
    .line 55
    :cond_3
    :goto_0
    return-void
.end method
