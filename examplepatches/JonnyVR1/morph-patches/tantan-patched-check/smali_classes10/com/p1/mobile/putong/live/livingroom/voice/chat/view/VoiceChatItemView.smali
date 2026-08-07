.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

.field public d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->g(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->f(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3}, Ll/yql;->e(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic f(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    invoke-interface {p1, p0, p2}, Ll/yql;->b(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method private synthetic g(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 2
    .line 3
    invoke-interface {p1, p0, p2}, Ll/yql;->b(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method


# virtual methods
.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->M()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->M()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u9n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Z)V
    .locals 9

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x2

    .line 12
    if-lt v3, v4, :cond_0

    .line 13
    .line 14
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 15
    .line 16
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {v3, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 22
    .line 23
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Landroid/text/SpannableStringBuilder;

    .line 28
    .line 29
    invoke-virtual {v3, p1, p2, v5, v4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 39
    .line 40
    invoke-virtual {v3, p1, p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget v4, Ll/qa00;->y:I

    .line 50
    .line 51
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v7, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 58
    .line 59
    iget-boolean v8, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 60
    .line 61
    invoke-virtual {v5, v6, v7, v8}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    new-instance v6, Ll/q9n0;

    .line 66
    .line 67
    invoke-direct {v6}, Ll/q9n0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v3, v4, v5, v1, v6}, Ll/biv;->d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget v1, Ll/qa00;->y:I

    .line 75
    .line 76
    const-string v4, "defaultUrl"

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    invoke-static {v3, v1, v4, v5, v5}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 83
    .line 84
    new-instance v3, Ll/r9n0;

    .line 85
    .line 86
    invoke-direct {v3, p1, v0, p2}, Ll/r9n0;-><init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 93
    .line 94
    new-instance v1, Ll/s9n0;

    .line 95
    .line 96
    invoke-direct {v1, p0, p1, p2}, Ll/s9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 103
    .line 104
    if-eqz v0, :cond_2

    .line 105
    .line 106
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isSystemReplaceMessage:Z

    .line 107
    .line 108
    if-nez v0, :cond_3

    .line 109
    .line 110
    :cond_2
    sget-object v0, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 111
    .line 112
    const-string v1, "indonesia"

    .line 113
    .line 114
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_3

    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 123
    .line 124
    new-instance v1, Ll/t9n0;

    .line 125
    .line 126
    invoke-direct {v1, p0, p1, p2}, Ll/t9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 135
    .line 136
    const/high16 p2, 0x41400000    # 12.0f

    .line 137
    .line 138
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    const/high16 v1, 0x41000000    # 8.0f

    .line 143
    .line 144
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result p2

    .line 152
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v1

    .line 156
    invoke-virtual {p1, v0, v3, p2, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 162
    .line 163
    const/high16 p2, 0x40000000    # 2.0f

    .line 164
    .line 165
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result p2

    .line 169
    invoke-static {p1, p2}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 173
    .line 174
    const/high16 p2, 0x40c00000    # 6.0f

    .line 175
    .line 176
    if-eqz p3, :cond_4

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_4
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    :goto_1
    invoke-static {p1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 187
    .line 188
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    invoke-static {p0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 193
    .line 194
    .line 195
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatItemView;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;->CONTENT:Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->setLongClickArea(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
