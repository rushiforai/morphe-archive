.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;
.super Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;
.source "SourceFile"


# instance fields
.field public k:Lv/VFrame;

.field public l:Landroid/view/View;

.field public m:Lv/VDraweeView;

.field public n:Lv/VFrame;

.field public o:Lv/VDraweeView;

.field public p:Lv/VFrame;

.field public q:Lv/VDraweeView;

.field public r:Landroid/view/View;

.field public s:Lv/VFrame;

.field public t:Lv/VDraweeView;

.field public u:Lv/VFrame;

.field public v:Lv/VImage;

.field public w:Lv/VText;

.field public x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

.field public final y:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "ConversationMatchItemLayout"

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->y:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 10
    const-string p1, "ConversationMatchItemLayout"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->y:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    const-string p1, "ConversationMatchItemLayout"

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->y:Ljava/lang/String;

    return-void
.end method

.method public static synthetic T(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->o0()V

    return-void
.end method

.method public static synthetic V(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->r0()V

    return-void
.end method

.method public static synthetic W(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l0()V

    return-void
.end method

.method public static synthetic X(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Conversation;->clone()Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "invalid"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 10
    .line 11
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic Y(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m0()V

    return-void
.end method

.method public static synthetic a0(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->s0()V

    return-void
.end method

.method public static synthetic b0(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t0()V

    return-void
.end method

.method public static synthetic c0(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p0()V

    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->q0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic f0(Ll/bkj0;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/cj6;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/cj6;-><init>(Lcom/p1/mobile/putong/core/data/Conversation;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method private getTitleRemoveWidth()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ej:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    const/high16 v0, 0x42280000    # 42.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    int-to-float v0, v0

    .line 30
    add-float/2addr p0, v0

    .line 31
    return p0
.end method

.method private v0()V
    .locals 3

    .line 1
    new-instance v0, Ll/zi6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zi6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x64

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public C(Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->h0()Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->j0(Z)Landroid/animation/AnimatorSet;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x2

    .line 16
    new-array v4, v4, [Landroid/animation/Animator;

    .line 17
    .line 18
    const/4 v5, 0x0

    .line 19
    aput-object v1, v4, v5

    .line 20
    .line 21
    aput-object v3, v4, v2

    .line 22
    .line 23
    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 24
    .line 25
    .line 26
    new-instance v1, Ll/dj6;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/dj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/ej6;

    .line 35
    .line 36
    invoke-direct {v1, p1}, Ll/ej6;-><init>(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->w0()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public P(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 10

    return-void

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 2
    .line 3
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_6

    .line 8
    .line 9
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    if-nez p2, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 20
    .line 21
    sget v0, Ll/dbc0;->i1:I

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 24
    .line 25
    .line 26
    iget p2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 27
    .line 28
    const/16 v0, 0xe

    .line 29
    .line 30
    if-ne p2, v0, :cond_4

    .line 31
    .line 32
    iget-object p2, p3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->z:Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    const/4 v0, 0x0

    .line 39
    const/4 v1, 0x1

    .line 40
    const/high16 v2, 0x42e60000    # 115.0f

    .line 41
    .line 42
    if-eqz p2, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u0()V

    .line 45
    .line 46
    .line 47
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 48
    .line 49
    sget v3, Ll/dbc0;->k1:I

    .line 50
    .line 51
    invoke-virtual {p2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 52
    .line 53
    .line 54
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 59
    .line 60
    new-array v1, v1, [Landroid/view/View;

    .line 61
    .line 62
    aput-object v2, v1, v0

    .line 63
    .line 64
    invoke-static {p2, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t:Lv/VDraweeView;

    .line 68
    .line 69
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->w:Lv/VText;

    .line 70
    .line 71
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->v:Lv/VImage;

    .line 72
    .line 73
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 74
    .line 75
    iget-object v9, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 76
    .line 77
    move-object v3, p1

    .line 78
    move-object v4, p3

    .line 79
    invoke-static/range {v3 .. v9}, Ll/vj30;->x(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 83
    .line 84
    const-string p1, "#EAB442"

    .line 85
    .line 86
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    move-object v3, p1

    .line 95
    move-object v4, p3

    .line 96
    iget-object p1, v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->x:Lcom/p1/mobile/putong/core/data/Recommended;

    .line 97
    .line 98
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_2

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u0()V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 108
    .line 109
    sget p2, Ll/dbc0;->j1:I

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 112
    .line 113
    .line 114
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 119
    .line 120
    new-array p3, v1, [Landroid/view/View;

    .line 121
    .line 122
    aput-object p2, p3, v0

    .line 123
    .line 124
    invoke-static {p1, p3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 128
    .line 129
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 130
    .line 131
    move-object v0, v3

    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t:Lv/VDraweeView;

    .line 133
    .line 134
    move-object v2, v4

    .line 135
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->w:Lv/VText;

    .line 136
    .line 137
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->v:Lv/VImage;

    .line 138
    .line 139
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 140
    .line 141
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 142
    .line 143
    invoke-static/range {v0 .. v7}, Ll/vj30;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 147
    .line 148
    const-string p1, "#75C4FF"

    .line 149
    .line 150
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    return-void

    .line 158
    :cond_2
    iget-object p1, v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->y:Lcom/p1/mobile/putong/core/data/QuickChatCardInfo;

    .line 159
    .line 160
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    const-string p2, "#FF8231"

    .line 165
    .line 166
    if-eqz p1, :cond_3

    .line 167
    .line 168
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u0()V

    .line 169
    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 172
    .line 173
    sget p3, Ll/dbc0;->i1:I

    .line 174
    .line 175
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 176
    .line 177
    .line 178
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 183
    .line 184
    new-array v1, v1, [Landroid/view/View;

    .line 185
    .line 186
    aput-object p3, v1, v0

    .line 187
    .line 188
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 189
    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 192
    .line 193
    iget-object v1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 194
    .line 195
    move-object v0, v3

    .line 196
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t:Lv/VDraweeView;

    .line 197
    .line 198
    move-object v2, v4

    .line 199
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->w:Lv/VText;

    .line 200
    .line 201
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->v:Lv/VImage;

    .line 202
    .line 203
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 204
    .line 205
    iget-object v7, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 206
    .line 207
    invoke-static/range {v0 .. v7}, Ll/vj30;->v(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 211
    .line 212
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 217
    .line 218
    .line 219
    return-void

    .line 220
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u0()V

    .line 221
    .line 222
    .line 223
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 224
    .line 225
    sget p3, Ll/dbc0;->i1:I

    .line 226
    .line 227
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 228
    .line 229
    .line 230
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 231
    .line 232
    .line 233
    move-result p1

    .line 234
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 235
    .line 236
    new-array v1, v1, [Landroid/view/View;

    .line 237
    .line 238
    aput-object p3, v1, v0

    .line 239
    .line 240
    invoke-static {p1, v1}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 241
    .line 242
    .line 243
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t:Lv/VDraweeView;

    .line 244
    .line 245
    move-object v0, v3

    .line 246
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->w:Lv/VText;

    .line 247
    .line 248
    move-object v1, v4

    .line 249
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->v:Lv/VImage;

    .line 250
    .line 251
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 252
    .line 253
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 254
    .line 255
    invoke-static/range {v0 .. v6}, Ll/vj30;->u(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Lv/VDraweeView;Lv/VText;Lv/VImage;Lv/VText;Landroid/view/View;)V

    .line 256
    .line 257
    .line 258
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 259
    .line 260
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 261
    .line 262
    .line 263
    move-result p1

    .line 264
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :cond_4
    move-object v0, p1

    .line 269
    move-object v2, p3

    .line 270
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 271
    .line 272
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->m:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 273
    .line 274
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 275
    .line 276
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 277
    .line 278
    invoke-virtual {p2}, Ll/dkb;->o9()Lrx/c;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 283
    .line 284
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 285
    .line 286
    iget-object v1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {p3, v1}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 289
    .line 290
    .line 291
    move-result-object p3

    .line 292
    iget-object v1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->t:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-nez v1, :cond_5

    .line 299
    .line 300
    iget v1, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 301
    .line 302
    sget v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 303
    .line 304
    if-ne v1, v3, :cond_5

    .line 305
    .line 306
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 307
    .line 308
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 309
    .line 310
    iget-object v3, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->t:Ljava/lang/String;

    .line 311
    .line 312
    invoke-virtual {v1, v3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 313
    .line 314
    .line 315
    move-result-object v1

    .line 316
    goto :goto_0

    .line 317
    :cond_5
    const/4 v1, 0x0

    .line 318
    invoke-static {v1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    :goto_0
    new-instance v3, Ll/xi6;

    .line 323
    .line 324
    invoke-direct {v3}, Ll/xi6;-><init>()V

    .line 325
    .line 326
    .line 327
    invoke-static {p2, p3, v1, v3}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    invoke-virtual {p1, v0, p2}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 336
    .line 337
    .line 338
    move-result-object p2

    .line 339
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 340
    .line 341
    .line 342
    move-result-object p1

    .line 343
    new-instance p2, Ll/aj6;

    .line 344
    .line 345
    invoke-direct {p2, p0, v2}, Ll/aj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 346
    .line 347
    .line 348
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 353
    .line 354
    .line 355
    :cond_6
    :goto_1
    return-void
.end method

.method public final g0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jj6;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h0()Landroid/animation/Animator;
    .locals 11

    .line 1
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 12
    .line 13
    sget-object v3, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->j:Landroid/util/Property;

    .line 14
    .line 15
    const/high16 v4, 0x42e60000    # 115.0f

    .line 16
    .line 17
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/4 v5, 0x0

    .line 22
    filled-new-array {v5, v4}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-static {v2, v3, v4}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 34
    .line 35
    const/4 v3, 0x2

    .line 36
    new-array v4, v3, [F

    .line 37
    .line 38
    fill-array-data v4, :array_0

    .line 39
    .line 40
    .line 41
    const-string v6, "alpha"

    .line 42
    .line 43
    invoke-static {v2, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    .line 53
    .line 54
    const-string v7, "translationX"

    .line 55
    .line 56
    invoke-static {v2, v7, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 64
    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    .line 66
    .line 67
    const-string v8, "translationY"

    .line 68
    .line 69
    invoke-static {v2, v8, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 79
    .line 80
    const-string v9, "scaleX"

    .line 81
    .line 82
    invoke-static {v2, v9, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 92
    .line 93
    const-string v10, "scaleY"

    .line 94
    .line 95
    invoke-static {v2, v10, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 103
    .line 104
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->h:[F

    .line 105
    .line 106
    invoke-static {v2, v7, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 114
    .line 115
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    .line 116
    .line 117
    invoke-static {v2, v8, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 125
    .line 126
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 127
    .line 128
    invoke-static {v2, v9, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 136
    .line 137
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 138
    .line 139
    invoke-static {v2, v10, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 147
    .line 148
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->i:[F

    .line 149
    .line 150
    invoke-static {v2, v8, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 158
    .line 159
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 160
    .line 161
    invoke-static {v2, v9, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 169
    .line 170
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->e:[F

    .line 171
    .line 172
    invoke-static {v2, v10, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 180
    .line 181
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 182
    .line 183
    invoke-static {v2, v6, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 191
    .line 192
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->b:Lv/VLinear;

    .line 193
    .line 194
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->getTitleRemoveWidth()F

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    neg-float v4, v4

    .line 199
    new-array v3, v3, [F

    .line 200
    .line 201
    aput v4, v3, v5

    .line 202
    .line 203
    const/4 v4, 0x0

    .line 204
    const/4 v5, 0x1

    .line 205
    aput v4, v3, v5

    .line 206
    .line 207
    invoke-static {v2, v7, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 215
    .line 216
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->f:Lv/VText;

    .line 217
    .line 218
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->g:[F

    .line 219
    .line 220
    invoke-static {v2, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 228
    .line 229
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 230
    .line 231
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 232
    .line 233
    invoke-static {v2, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 241
    .line 242
    iget-object v2, v2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->c:Lv/VFrame;

    .line 243
    .line 244
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->f:[F

    .line 245
    .line 246
    invoke-static {v2, v6, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 247
    .line 248
    .line 249
    move-result-object v2

    .line 250
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 254
    .line 255
    .line 256
    const-wide/16 v1, 0x12c

    .line 257
    .line 258
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 259
    .line 260
    .line 261
    new-instance v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout$a;

    .line 262
    .line 263
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 267
    .line 268
    .line 269
    new-instance p0, Landroid/view/animation/DecelerateInterpolator;

    .line 270
    .line 271
    invoke-direct {p0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 275
    .line 276
    .line 277
    return-object v0

    .line 278
    nop

    .line 279
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public j0(Z)Landroid/animation/AnimatorSet;
    .locals 9

    .line 1
    const/high16 v0, 0x40c00000    # 6.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    const/4 v2, 0x3

    .line 9
    new-array v3, v2, [F

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x0

    .line 13
    aput v5, v3, v4

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    aput v1, v3, v6

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    aput v5, v3, v1

    .line 20
    .line 21
    const-string v7, "translationX"

    .line 22
    .line 23
    invoke-static {v7, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    neg-int v0, v0

    .line 32
    int-to-float v0, v0

    .line 33
    new-array v2, v2, [F

    .line 34
    .line 35
    aput v5, v2, v4

    .line 36
    .line 37
    aput v0, v2, v6

    .line 38
    .line 39
    aput v5, v2, v1

    .line 40
    .line 41
    invoke-static {v7, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 46
    .line 47
    filled-new-array {v3}, [Landroid/animation/PropertyValuesHolder;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v2, v3}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    move v3, v1

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    move v3, v6

    .line 60
    :goto_0
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 61
    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 64
    .line 65
    filled-new-array {v0}, [Landroid/animation/PropertyValuesHolder;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v3, v0}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    move p1, v1

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move p1, v6

    .line 78
    :goto_1
    invoke-virtual {v0, p1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ll/hj6;

    .line 82
    .line 83
    invoke-direct {p1, p0}, Ll/hj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, p1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 87
    .line 88
    .line 89
    new-instance p1, Ll/ij6;

    .line 90
    .line 91
    invoke-direct {p1, p0}, Ll/ij6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0, p1}, Ll/gt0;->r(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 95
    .line 96
    .line 97
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 98
    .line 99
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 100
    .line 101
    .line 102
    new-instance p1, Ll/zjg;

    .line 103
    .line 104
    invoke-direct {p1}, Ll/zjg;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 108
    .line 109
    .line 110
    const-wide/16 v7, 0x640

    .line 111
    .line 112
    invoke-virtual {p0, v7, v8}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 113
    .line 114
    .line 115
    new-array p1, v1, [Landroid/animation/Animator;

    .line 116
    .line 117
    aput-object v2, p1, v4

    .line 118
    .line 119
    aput-object v0, p1, v6

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Landroid/view/animation/DecelerateInterpolator;

    .line 125
    .line 126
    invoke-direct {p1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 130
    .line 131
    .line 132
    return-object p0
.end method

.method public k0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic l0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->c:Lv/VFrame;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->e:Lv/VText;

    .line 17
    .line 18
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic m0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 8
    .line 9
    const/high16 v2, 0x42c80000    # 100.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    const/high16 v1, 0x42e60000    # 115.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final synthetic o0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "https://auto.tancdn.com/v1/raw/2940b12f-9afb-4c57-8783-a2c4e0ab501710.so"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->g0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

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
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    new-instance v0, Ll/yi6;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ll/yi6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 20
    .line 21
    .line 22
    const-wide/16 v1, 0x258

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/bkj0;)V
    .locals 5

    .line 1
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

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
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    new-instance p0, Ll/bj6;

    .line 20
    .line 21
    invoke-direct {p0, p2}, Ll/bj6;-><init>(Ll/bkj0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 29
    .line 30
    const/high16 v1, 0x41980000    # 19.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {v0, v2}, Landroid/view/View;->setPivotX(F)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 51
    .line 52
    const/high16 v1, 0x41e00000    # 28.0f

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    int-to-float v2, v2

    .line 59
    invoke-virtual {v0, v2}, Landroid/view/View;->setPivotX(F)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    int-to-float v1, v1

    .line 69
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 73
    .line 74
    const/high16 v1, 0x42660000    # 57.5f

    .line 75
    .line 76
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    int-to-float v2, v2

    .line 81
    invoke-virtual {v0, v2}, Landroid/view/View;->setPivotX(F)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 85
    .line 86
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    int-to-float v1, v1

    .line 91
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    int-to-float v1, v1

    .line 101
    const/high16 v2, 0x40000000    # 2.0f

    .line 102
    .line 103
    div-float/2addr v1, v2

    .line 104
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    int-to-float v1, v1

    .line 114
    div-float/2addr v1, v2

    .line 115
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->s:Lv/VFrame;

    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u:Lv/VFrame;

    .line 125
    .line 126
    const/4 v2, 0x1

    .line 127
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 131
    .line 132
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->n:Lv/VFrame;

    .line 136
    .line 137
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 141
    .line 142
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 146
    .line 147
    sget v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 148
    .line 149
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->l:Landroid/view/View;

    .line 150
    .line 151
    if-ne v0, v3, :cond_1

    .line 152
    .line 153
    sget v0, Ll/dbc0;->w:I

    .line 154
    .line 155
    invoke-virtual {v4, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 156
    .line 157
    .line 158
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 159
    .line 160
    const-string v3, "#66000000"

    .line 161
    .line 162
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_1
    sget v0, Ll/dbc0;->i1:I

    .line 171
    .line 172
    invoke-virtual {v4, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 176
    .line 177
    const-string v3, "#ff8231"

    .line 178
    .line 179
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    .line 185
    .line 186
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->r:Landroid/view/View;

    .line 187
    .line 188
    iget v3, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 189
    .line 190
    sget v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->D:I

    .line 191
    .line 192
    if-ne v3, v4, :cond_2

    .line 193
    .line 194
    move v3, v2

    .line 195
    goto :goto_1

    .line 196
    :cond_2
    move v3, v1

    .line 197
    :goto_1
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->r:Landroid/view/View;

    .line 201
    .line 202
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    if-eqz v0, :cond_3

    .line 207
    .line 208
    const-string v0, "p_messages_view"

    .line 209
    .line 210
    new-array v3, v1, [Ll/sfj0$a;

    .line 211
    .line 212
    const-string v4, "e_new_match_red_dot"

    .line 213
    .line 214
    invoke-static {v4, v0, v3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 215
    .line 216
    .line 217
    :cond_3
    iget-object v0, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 218
    .line 219
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    if-eqz v0, :cond_4

    .line 224
    .line 225
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 226
    .line 227
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 228
    .line 229
    iget-object v3, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 230
    .line 231
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 232
    .line 233
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 234
    .line 235
    .line 236
    move-result-object v3

    .line 237
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 238
    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_4
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 242
    .line 243
    sget v3, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 244
    .line 245
    if-ne v0, v3, :cond_5

    .line 246
    .line 247
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 248
    .line 249
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->t:Lv/VDraweeView;

    .line 250
    .line 251
    iget-object v4, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 256
    .line 257
    .line 258
    move-result-object v4

    .line 259
    invoke-virtual {v0, v3, v4}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 260
    .line 261
    .line 262
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->s:Lv/VFrame;

    .line 263
    .line 264
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->u:Lv/VFrame;

    .line 268
    .line 269
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 273
    .line 274
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 275
    .line 276
    .line 277
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->n:Lv/VFrame;

    .line 278
    .line 279
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 280
    .line 281
    .line 282
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 283
    .line 284
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 285
    .line 286
    .line 287
    goto :goto_2

    .line 288
    :cond_5
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 289
    .line 290
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 291
    .line 292
    iget-object v3, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 293
    .line 294
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 295
    .line 296
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k0(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    invoke-virtual {v0, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 301
    .line 302
    .line 303
    :goto_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->d:Z

    .line 304
    .line 305
    if-nez v0, :cond_7

    .line 306
    .line 307
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    if-nez v0, :cond_6

    .line 314
    .line 315
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->b:Ljava/lang/String;

    .line 316
    .line 317
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 318
    .line 319
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_7

    .line 324
    .line 325
    :cond_6
    iget-object v0, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 326
    .line 327
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 328
    .line 329
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->q:Lv/VDraweeView;

    .line 330
    .line 331
    invoke-virtual {p0, v0, v2}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->O(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V

    .line 332
    .line 333
    .line 334
    iget-object p2, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 335
    .line 336
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 337
    .line 338
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->o:Lv/VDraweeView;

    .line 339
    .line 340
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->O(Lcom/p1/mobile/putong/data/User;Lv/VDraweeView;)V

    .line 341
    .line 342
    .line 343
    :cond_7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 344
    .line 345
    .line 346
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->n:Lv/VFrame;

    .line 347
    .line 348
    invoke-static {p2, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 349
    .line 350
    .line 351
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->k:Lv/VFrame;

    .line 352
    .line 353
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->F(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 354
    .line 355
    .line 356
    return-void
.end method

.method public final synthetic r0()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/LightningView;->w()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic s0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gra;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "https://auto.tancdn.com/v1/raw/e46ccc9d-2050-4521-a0c0-a238b0ef7d8914.svga"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v1, "https://auto.tancdn.com/v1/raw/026b84ba-0fad-4b15-b804-22929bfdce5110.so"

    .line 19
    .line 20
    :goto_0
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, 0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sget-object v1, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->BEFORE:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic t0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "https://auto.tancdn.com/v1/raw/a24ee24d-d950-42f6-b25e-af45e09f756810.so"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationMatchItemLayout;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->j:Lcom/tantan/library/svga/SVGAnimationView;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final u0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->m:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->n:Lv/VFrame;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->p:Lv/VFrame;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->s:Lv/VFrame;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final w0()V
    .locals 3

    .line 1
    new-instance v0, Ll/fj6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/fj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout;->x:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 18
    .line 19
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 20
    .line 21
    sget v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->F:I

    .line 22
    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    new-instance v0, Ll/gj6;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/gj6;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;)V

    .line 28
    .line 29
    .line 30
    const-wide/16 v1, 0xc8

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->v0()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public x0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationMatchItemLayout;->x:Lcom/p1/mobile/putong/core/newui/view/LightningView;

    .line 10
    .line 11
    const-string p1, "\u4f60\u67091\u4e2a\u65b0\u914d\u5bf9"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
