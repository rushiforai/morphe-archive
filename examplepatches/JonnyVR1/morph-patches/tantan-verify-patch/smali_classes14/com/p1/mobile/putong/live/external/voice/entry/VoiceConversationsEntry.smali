.class public Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ybn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VMarqueeText;

.field public e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

.field public f:Lv/VImage;

.field public g:Lv/VText;

.field public h:Lv/VImage;

.field public final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i:Ljava/util/List;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->l()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationEntryAct;->Y1(Landroid/content/Context;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 2
    .line 3
    new-instance v1, Ll/tan0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/tan0;-><init>(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private k(Lv/VText;Z)V
    .locals 0

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/high16 p0, 0x40400000    # 3.0f

    .line 13
    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p1, p0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private setEntryMainLayout(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/high16 p1, 0x43600000    # 224.0f

    .line 12
    .line 13
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/high16 p1, 0x43480000    # 200.0f

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->b:Landroid/widget/RelativeLayout;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/abn0;->a(Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/ybn0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->h:Lv/VImage;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;",
            "Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->description:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->c:Landroid/widget/TextView;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->subDescription:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->d:Lv/VMarqueeText;

    .line 30
    .line 31
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveFeedSummary;->subDescription:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    const/4 v0, 0x3

    .line 41
    const/4 v1, 0x0

    .line 42
    const/4 v2, 0x1

    .line 43
    if-lt p2, v0, :cond_4

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i:Ljava/util/List;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    invoke-direct {p0, v2}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->setEntryMainLayout(Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->b:Landroid/widget/RelativeLayout;

    .line 79
    .line 80
    invoke-static {}, Ll/jyn0;->h()Z

    .line 81
    .line 82
    .line 83
    move-result p2

    .line 84
    if-eqz p2, :cond_3

    .line 85
    .line 86
    sget p2, Ll/mbc0;->X:I

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    sget p2, Ll/mbc0;->W:I

    .line 90
    .line 91
    :goto_1
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 95
    .line 96
    const/4 p2, 0x2

    .line 97
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->d(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 101
    .line 102
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->i:Ljava/util/List;

    .line 103
    .line 104
    new-instance v0, Ll/uan0;

    .line 105
    .line 106
    invoke-direct {v0}, Ll/uan0;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {p2, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 110
    .line 111
    .line 112
    move-result-object p2

    .line 113
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->setImageUrlList(Ljava/util/List;)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;->l()V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->f:Lv/VImage;

    .line 122
    .line 123
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 127
    .line 128
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_4
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->setEntryMainLayout(Z)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->b:Landroid/widget/RelativeLayout;

    .line 136
    .line 137
    invoke-static {}, Ll/jyn0;->h()Z

    .line 138
    .line 139
    .line 140
    move-result p2

    .line 141
    if-eqz p2, :cond_5

    .line 142
    .line 143
    sget p2, Ll/mbc0;->Y:I

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_5
    sget p2, Ll/mbc0;->Z:I

    .line 147
    .line 148
    :goto_2
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 149
    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->e:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceFeedEntryFloatingAnim;

    .line 152
    .line 153
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->f:Lv/VImage;

    .line 157
    .line 158
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    :goto_3
    if-eqz p3, :cond_6

    .line 162
    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->a:Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;

    .line 164
    .line 165
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    :cond_6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ybn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->c(Ll/ybn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public l()V
    .locals 6

    .line 1
    const-string v0, "e_voice_chat"

    .line 2
    .line 3
    const-string v1, "p_messages_view"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/pf60;

    .line 9
    .line 10
    const-string v2, "tooltips_type"

    .line 11
    .line 12
    const-string v3, "red_dot"

    .line 13
    .line 14
    invoke-direct {v0, v2, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/pf60;

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 20
    .line 21
    invoke-static {v3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    const-string v3, "red_dot_figure"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v3, "red_dot_normal"

    .line 31
    .line 32
    :goto_0
    const-string v4, "tooltips_type_ui"

    .line 33
    .line 34
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    new-instance v3, Ll/pf60;

    .line 38
    .line 39
    const-string v4, "tooltips_trigger_reason"

    .line 40
    .line 41
    const-string v5, "follow_anchor_start_audio"

    .line 42
    .line 43
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Ll/pf60;

    .line 47
    .line 48
    iget-object v5, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 49
    .line 50
    invoke-static {v5}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    move-result v5

    .line 54
    if-eqz v5, :cond_1

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string p0, "NA"

    .line 64
    .line 65
    :goto_1
    const-string v5, "red_dot_num"

    .line 66
    .line 67
    invoke-direct {v4, v5, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    filled-new-array {v0, v2, v3, v4}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string v0, "e_audio_red_dot_voice_chat"

    .line 75
    .line 76
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public m()V
    .locals 5

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    const-string v1, "tooltips_type"

    .line 4
    .line 5
    const-string v2, "red_dot"

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/pf60;

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 13
    .line 14
    invoke-static {v2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    const-string v2, "red_dot_figure"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v2, "red_dot_normal"

    .line 24
    .line 25
    :goto_0
    const-string v3, "tooltips_type_ui"

    .line 26
    .line 27
    invoke-direct {v1, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/pf60;

    .line 31
    .line 32
    const-string v3, "tooltips_trigger_reason"

    .line 33
    .line 34
    const-string v4, "follow_anchor_start_audio"

    .line 35
    .line 36
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Ll/pf60;

    .line 40
    .line 41
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 42
    .line 43
    invoke-static {v4}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-eqz v4, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 50
    .line 51
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string p0, "NA"

    .line 57
    .line 58
    :goto_1
    const-string v4, "red_dot_num"

    .line 59
    .line 60
    invoke-direct {v3, v4, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    const-string v0, "e_audio_red_dot_voice_chat"

    .line 68
    .line 69
    const-string v1, "p_messages_view"

    .line 70
    .line 71
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->j()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setRedDot(I)V
    .locals 4

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->V5()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x0

    .line 9
    if-eqz v0, :cond_3

    .line 10
    .line 11
    const/16 v0, 0x63

    .line 12
    .line 13
    if-ltz p1, :cond_0

    .line 14
    .line 15
    if-gt p1, v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 18
    .line 19
    invoke-direct {p0, v0, v2}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->k(Lv/VText;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    if-le p1, v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 35
    .line 36
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->k(Lv/VText;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 40
    .line 41
    const-string v3, "99+"

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 47
    .line 48
    if-lez p1, :cond_2

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_2
    move v1, v2

    .line 52
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->h:Lv/VImage;

    .line 56
    .line 57
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->g:Lv/VText;

    .line 62
    .line 63
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->h:Lv/VImage;

    .line 67
    .line 68
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    :goto_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voice/entry/VoiceConversationsEntry;->m()V

    .line 72
    .line 73
    .line 74
    return-void
.end method
