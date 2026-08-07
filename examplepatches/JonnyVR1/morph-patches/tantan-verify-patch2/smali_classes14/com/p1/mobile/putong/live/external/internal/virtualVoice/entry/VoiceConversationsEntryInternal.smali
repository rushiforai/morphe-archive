.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/mbn0;",
        ">;"
    }
.end annotation


# instance fields
.field public _avatar_guide:Landroidx/constraintlayout/widget/Guideline;

.field public _container_layout:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public _conversation_entry_all_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

.field public _dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

.field public _num_red_dot:Lv/VText;

.field public _red_dot:Lv/VImage;

.field public _tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

.field public _tag_group:Landroid/widget/FrameLayout;

.field public _tag_group_tag:Landroid/widget/TextView;

.field public _voice_des:Lv/VMarqueeText;

.field public _voice_title:Landroid/widget/TextView;

.field private final blueEndColor:I

.field private final blueStartColor:I

.field private info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

.field private final newBlueColor:I

.field private final orangeEndColor:I

.field private final orangeStartColor:I

.field private presenter:Ll/mbn0;


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
    const-string p1, "#41d2ff"

    .line 5
    .line 6
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueStartColor:I

    .line 11
    .line 12
    const-string p1, "#279aff"

    .line 13
    .line 14
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueEndColor:I

    .line 19
    .line 20
    const-string p1, "#fdb04d"

    .line 21
    .line 22
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeStartColor:I

    .line 27
    .line 28
    const-string p1, "#fdbe52"

    .line 29
    .line 30
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeEndColor:I

    .line 35
    .line 36
    const-string p1, "#00aaff"

    .line 37
    .line 38
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->newBlueColor:I

    .line 43
    .line 44
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

    .line 45
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 46
    const-string p1, "#41d2ff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueStartColor:I

    .line 47
    const-string p1, "#279aff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueEndColor:I

    .line 48
    const-string p1, "#fdb04d"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeStartColor:I

    .line 49
    const-string p1, "#fdbe52"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeEndColor:I

    .line 50
    const-string p1, "#00aaff"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->newBlueColor:I

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->presenter:Ll/mbn0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->C0()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Ll/mbn0;->o0(Landroid/content/Context;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->q()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private m()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 17
    .line 18
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_container_layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    new-instance v1, Ll/yan0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/yan0;-><init>(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
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
    invoke-static {p0, p1}, Ll/zan0;->a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/mbn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->presenter:Ll/mbn0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->b(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_conversation_entry_all_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTitle()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_title:Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getSubTitle()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_des:Lv/VMarqueeText;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->h()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->j()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHeadSculptureList()Ljava/util/ArrayList;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-nez v0, :cond_2

    .line 68
    .line 69
    :cond_1
    return-void

    .line 70
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_title:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTitle()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_des:Lv/VMarqueeText;

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getSubTitle()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/mbs;->h()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_3

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 95
    .line 96
    iget v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->newBlueColor:I

    .line 97
    .line 98
    invoke-virtual {v0, v1, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->k(II)V

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getBgStyle()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "orange"

    .line 107
    .line 108
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 113
    .line 114
    if-eqz v0, :cond_4

    .line 115
    .line 116
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeStartColor:I

    .line 117
    .line 118
    iget v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->orangeEndColor:I

    .line 119
    .line 120
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->k(II)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    iget v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueStartColor:I

    .line 125
    .line 126
    iget v2, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->blueEndColor:I

    .line 127
    .line 128
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->k(II)V

    .line 129
    .line 130
    .line 131
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 132
    .line 133
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHeadSculptureList()Ljava/util/ArrayList;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->l(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mbn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->c(Ll/mbn0;)V

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

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_title:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTitle()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_des:Lv/VMarqueeText;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getSubTitle()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;->j()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHeadSculptureList()Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const/4 v1, 0x4

    .line 50
    invoke-static {v0, v1}, Ll/jyb;->k0(Ljava/util/List;I)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const/high16 v1, 0x42300000    # 44.0f

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->h0(Ljava/util/List;F)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMv(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->e(Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->m()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->setRedDot(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/mbs;->h()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const-string v2, "orange"

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    sget v1, Ll/nbc0;->A0:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getBgStyle()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    sget v1, Ll/nbc0;->y0:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget v1, Ll/nbc0;->z0:I

    .line 38
    .line 39
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_container_layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    .line 41
    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getLabel()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;->i0(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getLabel()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group:Landroid/widget/FrameLayout;

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    const/4 v0, 0x0

    .line 66
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group_tag:Landroid/widget/TextView;

    .line 70
    .line 71
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_2
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group_tag:Landroid/widget/TextView;

    .line 79
    .line 80
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group_tag:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getLabel()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group_tag:Landroid/widget/TextView;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getBgStyle()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    sget v1, Ll/nbc0;->p:I

    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_3
    sget v1, Ll/nbc0;->f:I

    .line 108
    .line 109
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 110
    .line 111
    .line 112
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getImageStyle()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v1, "static"

    .line 117
    .line 118
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-eqz v0, :cond_4

    .line 123
    .line 124
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->k(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 125
    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->i(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V

    .line 129
    .line 130
    .line 131
    :goto_3
    const-string p0, "p_messages_view"

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-string v0, "e_voice_chat"

    .line 138
    .line 139
    invoke-static {v0, p0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->d(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->n()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final p(Lv/VText;Z)V
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

.method public q()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->info:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "p_messages_view"

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v1, "e_voice_chat"

    .line 13
    .line 14
    invoke-static {v1, v0, p0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setRedDot(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getUnreadShowNumber()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/vwt;->V5()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_3

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    const/16 v1, 0x63

    .line 16
    .line 17
    if-ltz v0, :cond_0

    .line 18
    .line 19
    if-gt v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p0, v1, v2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->p(Lv/VText;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    if-le v0, v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->p(Lv/VText;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 44
    .line 45
    const-string v3, "99+"

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 51
    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_2
    move p1, v2

    .line 56
    :goto_1
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_red_dot:Lv/VImage;

    .line 60
    .line 61
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 66
    .line 67
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_red_dot:Lv/VImage;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->getHasRedSpot()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
