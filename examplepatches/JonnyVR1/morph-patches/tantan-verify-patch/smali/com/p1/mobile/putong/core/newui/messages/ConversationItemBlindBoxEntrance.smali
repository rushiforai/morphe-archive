.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Landroid/widget/TextView;

.field public f:Ljava/lang/Long;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f:Ljava/lang/Long;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f:Ljava/lang/Long;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f:Ljava/lang/Long;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->d(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i96;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/s7a;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->h5URL:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Ll/tqb;->d3(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->h5URL:Ljava/lang/String;

    .line 19
    .line 20
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->c()Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance p2, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    const-string v0, "tantan://webview?url="

    .line 33
    .line 34
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    new-array p0, p0, [Ll/sfj0$a;

    .line 53
    .line 54
    const-string p1, "e_blindbox_entrance"

    .line 55
    .line 56
    const-string p2, "p_messages_view"

    .line 57
    .line 58
    invoke-static {p1, p2, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 4

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumHeight(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->S1:Ll/d19;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d19;->D3()Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->c:Lv/VText;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->c:Lv/VText;

    .line 20
    .line 21
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->title:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->d:Lv/VText;

    .line 27
    .line 28
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->subTitle:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ll/gra;->z()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->a:Lv/VDraweeView;

    .line 40
    .line 41
    sget v2, Ll/dbc0;->K5:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->a:Lv/VDraweeView;

    .line 56
    .line 57
    sget v2, Ll/dbc0;->J5:I

    .line 58
    .line 59
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->a:Lv/VDraweeView;

    .line 66
    .line 67
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;->icon:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v2, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->e:Landroid/widget/TextView;

    .line 73
    .line 74
    iget-wide v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 75
    .line 76
    invoke-static {v2, v3}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f()V

    .line 84
    .line 85
    .line 86
    new-instance p1, Ll/h96;

    .line 87
    .line 88
    invoke-direct {p1, p0, v0}, Ll/h96;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;Lcom/p1/mobile/putong/core/data/GrowthBlindBoxInfo;)V

    .line 89
    .line 90
    .line 91
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f:Ljava/lang/Long;

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
    const-wide/16 v2, 0x1f4

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->f:Ljava/lang/Long;

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    new-array p0, p0, [Ll/sfj0$a;

    .line 31
    .line 32
    const-string v0, "e_blindbox_entrance"

    .line 33
    .line 34
    const-string v1, "p_messages_view"

    .line 35
    .line 36
    invoke-static {v0, v1, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/sj6;->R:I

    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    sget v0, Ll/sj6;->Q:I

    .line 19
    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->a:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    new-array v2, v2, [Landroid/view/View;

    .line 24
    .line 25
    const/4 v3, 0x0

    .line 26
    aput-object v1, v2, v3

    .line 27
    .line 28
    invoke-static {v0, v2}, Ll/ue6;->v(I[Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->c:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->e:Landroid/widget/TextView;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/ue6;->k0(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationItemBlindBoxEntrance;->d:Lv/VText;

    .line 39
    .line 40
    invoke-static {p0}, Ll/ue6;->e0(Landroid/widget/TextView;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method
