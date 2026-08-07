.class public Ll/zan0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;Landroid/view/View;)V
    .locals 5

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_conversation_entry_all_layout:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_container_layout:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/widget/TextView;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_title:Landroid/widget/TextView;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Landroidx/constraintlayout/widget/Guideline;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_avatar_guide:Landroidx/constraintlayout/widget/Guideline;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceEntryAvatarLayout;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    const/4 v4, 0x3

    .line 68
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_dynamic_avatars:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/view/VoiceConversationsEntryAvatarView;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Landroid/view/ViewGroup;

    .line 81
    .line 82
    const/4 v4, 0x4

    .line 83
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lv/VMarqueeText;

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_voice_des:Lv/VMarqueeText;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    check-cast v1, Landroid/view/ViewGroup;

    .line 96
    .line 97
    const/4 v4, 0x5

    .line 98
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Landroid/widget/FrameLayout;

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group:Landroid/widget/FrameLayout;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    check-cast v1, Landroid/view/ViewGroup;

    .line 111
    .line 112
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Landroid/view/ViewGroup;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    check-cast v0, Landroid/widget/TextView;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_tag_group_tag:Landroid/widget/TextView;

    .line 125
    .line 126
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lv/VImage;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_red_dot:Lv/VImage;

    .line 133
    .line 134
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Lv/VText;

    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/VoiceConversationsEntryInternal;->_num_red_dot:Lv/VText;

    .line 141
    .line 142
    return-void
.end method
