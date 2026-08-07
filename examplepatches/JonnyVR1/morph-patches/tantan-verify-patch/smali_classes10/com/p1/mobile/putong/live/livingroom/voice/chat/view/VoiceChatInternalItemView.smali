.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# static fields
.field public static i:I


# instance fields
.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Lv/VLinear;

.field public g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

.field public h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V
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

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->r0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->q0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->n0()V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static o0(JLjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, p2, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Ljava/util/Date;

    .line 11
    .line 12
    invoke-direct {p2, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public static p0(J)Z
    .locals 3

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-ne v2, p0, :cond_0

    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method


# virtual methods
.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->M()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->M()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/d9n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0()V
    .locals 6

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/a;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/constraintlayout/widget/a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->c(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 7
    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->i:I

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v1}, Ll/bnl0;->J(Landroid/content/Context;)Landroid/graphics/Point;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v1, v1, Landroid/graphics/Point;->x:I

    .line 24
    .line 25
    int-to-float v1, v1

    .line 26
    const/high16 v2, 0x40000000    # 2.0f

    .line 27
    .line 28
    div-float/2addr v1, v2

    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    int-to-float v3, v3

    .line 36
    div-float/2addr v3, v2

    .line 37
    sub-float/2addr v1, v3

    .line 38
    float-to-int v1, v1

    .line 39
    sput v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->i:I

    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    const/4 v4, 0x6

    .line 48
    sget v5, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->i:I

    .line 49
    .line 50
    const/4 v2, 0x6

    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual/range {v0 .. v5}, Landroidx/constraintlayout/widget/a;->f(IIIII)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 56
    .line 57
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    const/4 v2, 0x0

    .line 62
    invoke-virtual {v0, v1, v2}, Landroidx/constraintlayout/widget/a;->s(II)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/widget/a;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

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

.method public final synthetic q0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

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

.method public final synthetic r0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

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

.method public s0(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Z)V
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    const/4 v3, 0x2

    .line 11
    if-lt v2, v3, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {v2, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    check-cast v4, Landroid/text/SpannableStringBuilder;

    .line 27
    .line 28
    invoke-virtual {v2, p1, p2, v4, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 39
    .line 40
    invoke-virtual {v2, p1, p2, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    sget v3, Ll/qa00;->y:I

    .line 50
    .line 51
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 58
    .line 59
    iget-boolean v7, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 60
    .line 61
    invoke-virtual {v4, v5, v6, v7}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    new-instance v5, Ll/y8n0;

    .line 66
    .line 67
    invoke-direct {v5}, Ll/y8n0;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v2, v3, v4, v5, v1}, Ll/biv;->c(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;I)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    sget v3, Ll/qa00;->y:I

    .line 75
    .line 76
    const-string v4, "defaultUrl"

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    invoke-static {v2, v3, v4, v5, v5}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 83
    .line 84
    new-instance v3, Ll/z8n0;

    .line 85
    .line 86
    invoke-direct {v3, p1, v0, p2}, Ll/z8n0;-><init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 93
    .line 94
    new-instance v2, Ll/a9n0;

    .line 95
    .line 96
    invoke-direct {v2, p0, p1, p2}, Ll/a9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

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
    const-string v2, "indonesia"

    .line 113
    .line 114
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-nez v0, :cond_3

    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 123
    .line 124
    new-instance v2, Ll/b9n0;

    .line 125
    .line 126
    invoke-direct {v2, p0, p1, p2}, Ll/b9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 133
    .line 134
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 135
    .line 136
    const/high16 v0, 0x41400000    # 12.0f

    .line 137
    .line 138
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    const/high16 v3, 0x41000000    # 8.0f

    .line 143
    .line 144
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    invoke-virtual {p1, v2, v4, v0, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 157
    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 162
    .line 163
    const/high16 v0, 0x40000000    # 2.0f

    .line 164
    .line 165
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    invoke-static {p1, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->h:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 173
    .line 174
    const/high16 v0, 0x40c00000    # 6.0f

    .line 175
    .line 176
    if-eqz p3, :cond_4

    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_4
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    :goto_1
    invoke-static {p1, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 184
    .line 185
    .line 186
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->g:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 187
    .line 188
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 189
    .line 190
    .line 191
    move-result p3

    .line 192
    invoke-static {p1, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 193
    .line 194
    .line 195
    iget-wide v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->createTime:J

    .line 196
    .line 197
    iget-wide v2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->preMessageTime:J

    .line 198
    .line 199
    sub-long/2addr v0, v2

    .line 200
    const-wide/32 v2, 0x927c0

    .line 201
    .line 202
    .line 203
    cmp-long p1, v0, v2

    .line 204
    .line 205
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 206
    .line 207
    if-lez p1, :cond_6

    .line 208
    .line 209
    const/4 p1, 0x4

    .line 210
    invoke-virtual {p3, p1}, Landroid/view/View;->setVisibility(I)V

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 214
    .line 215
    iget-wide p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->createTime:J

    .line 216
    .line 217
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->p0(J)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_5

    .line 222
    .line 223
    const-string v0, "MM\u6708dd\u65e5 HH:mm"

    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_5
    const-string v0, "yyyy\u5e74MM\u6708dd\u65e5 HH:mm"

    .line 227
    .line 228
    :goto_2
    invoke-static {p2, p3, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->o0(JLjava/lang/String;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p2

    .line 232
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;->d:Lv/VText;

    .line 236
    .line 237
    new-instance p2, Ll/c9n0;

    .line 238
    .line 239
    invoke-direct {p2, p0}, Ll/c9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInternalItemView;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_6
    const/16 p0, 0x8

    .line 247
    .line 248
    invoke-virtual {p3, p0}, Landroid/view/View;->setVisibility(I)V

    .line 249
    .line 250
    .line 251
    return-void
.end method
