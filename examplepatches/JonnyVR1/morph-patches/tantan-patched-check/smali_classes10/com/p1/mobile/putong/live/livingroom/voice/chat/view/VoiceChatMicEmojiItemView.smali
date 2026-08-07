.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

.field public h:Lv/VDraweeView;

.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z

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

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->m(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method private synthetic i(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->M()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->q()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 11
    .line 12
    return-void
.end method

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aan0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiResult:Ljava/util/List;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiType:Ljava/lang/String;

    .line 10
    .line 11
    iget-wide v3, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->localCreateTime:J

    .line 12
    .line 13
    invoke-virtual {p0, v2, v1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->k(Ljava/util/List;Ljava/lang/String;J)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final g(Ljava/lang/String;J)I
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/i9n;->b()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0

    .line 17
    :cond_1
    const-wide/16 p0, 0x0

    .line 18
    .line 19
    cmp-long p0, p2, p0

    .line 20
    .line 21
    if-lez p0, :cond_2

    .line 22
    .line 23
    const/16 p0, 0xa

    .line 24
    .line 25
    return p0

    .line 26
    :cond_2
    const/4 p0, 0x2

    .line 27
    return p0
.end method

.method public final h(Ljava/util/List;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 1
    const-string p0, "emojiRandomTripleDice"

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 p1, 0x3

    .line 14
    if-lt p0, p1, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final j(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v1, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->o(ZZZ)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 14
    .line 15
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getLoadingSvg()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-virtual {p0, p1, v1, v2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final k(Ljava/util/List;Ljava/lang/String;J)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getLoadingDurationS()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    sub-long/2addr v3, p3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->q()V

    .line 27
    .line 28
    .line 29
    const-wide/16 p3, 0x3e8

    .line 30
    .line 31
    mul-long/2addr v1, p3

    .line 32
    cmp-long p3, v3, v1

    .line 33
    .line 34
    if-lez p3, :cond_1

    .line 35
    .line 36
    const/4 p3, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move p3, v0

    .line 39
    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->h(Ljava/util/List;Ljava/lang/String;)Z

    .line 40
    .line 41
    .line 42
    move-result p4

    .line 43
    if-nez p4, :cond_3

    .line 44
    .line 45
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p4

    .line 49
    check-cast p4, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 50
    .line 51
    invoke-virtual {p4}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    if-eqz p4, :cond_3

    .line 60
    .line 61
    if-eqz p3, :cond_2

    .line 62
    .line 63
    invoke-static {}, Ll/i9n;->b()Z

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    if-eqz p3, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->j(Ljava/util/List;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->p(Ljava/util/List;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    if-eqz p3, :cond_4

    .line 78
    .line 79
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->m(Ljava/util/List;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->p(Ljava/util/List;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_5
    :goto_1
    return-void
.end method

.method public l(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 8

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->spanList:Ljava/util/List;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-lt v2, v1, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 17
    .line 18
    const/4 v3, 0x0

    .line 19
    invoke-virtual {v2, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 23
    .line 24
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/text/SpannableStringBuilder;

    .line 29
    .line 30
    const/4 v3, 0x2

    .line 31
    invoke-virtual {v2, p1, p2, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 35
    .line 36
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    sget v3, Ll/qa00;->y:I

    .line 41
    .line 42
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object v5, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v6, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 49
    .line 50
    iget-boolean v7, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->isMaskMode:Z

    .line 51
    .line 52
    invoke-virtual {v4, v5, v6, v7}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    new-instance v5, Ll/x9n0;

    .line 57
    .line 58
    invoke-direct {v5}, Ll/x9n0;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v2, v3, v4, v1, v5}, Ll/biv;->d(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;ZLl/qcj;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    sget v1, Ll/qa00;->y:I

    .line 66
    .line 67
    const-string v3, "defaultUrl"

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-static {v2, v1, v3, v4, v4}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 74
    .line 75
    new-instance v2, Ll/y9n0;

    .line 76
    .line 77
    invoke-direct {v2, p1, v0, p2}, Ll/y9n0;-><init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->a:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 84
    .line 85
    new-instance v2, Ll/z9n0;

    .line 86
    .line 87
    invoke-direct {v2, p0, p1, p2}, Ll/z9n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->d:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    sget v1, Ll/obc0;->O:I

    .line 96
    .line 97
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 103
    .line 104
    const/high16 v1, 0x40000000    # 2.0f

    .line 105
    .line 106
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    invoke-static {p1, v1}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->d:Landroid/widget/FrameLayout;

    .line 114
    .line 115
    const/high16 v1, 0x40c00000    # 6.0f

    .line 116
    .line 117
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-static {p1, v2}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->c:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

    .line 125
    .line 126
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-static {p1, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    const/high16 p1, -0x40000000    # -2.0f

    .line 134
    .line 135
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 140
    .line 141
    .line 142
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiResult:Ljava/util/List;

    .line 143
    .line 144
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->emojiType:Ljava/lang/String;

    .line 145
    .line 146
    iget-wide v1, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->localCreateTime:J

    .line 147
    .line 148
    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->k(Ljava/util/List;Ljava/lang/String;J)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public final m(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->h(Ljava/util/List;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 10
    .line 11
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->g()V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 19
    .line 20
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0, v1, v1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->o(ZZZ)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 35
    .line 36
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    check-cast p2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v1, 0x2

    .line 57
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-lt p2, v0, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->q()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->o(ZZZ)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->h:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    check-cast p1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    const-string p2, "context_single_room"

    .line 96
    .line 97
    invoke-static {p2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    return-void
.end method

.method public n(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 18
    .line 19
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 20
    .line 21
    iget-object p3, p3, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->mid:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    if-eqz p3, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->m(Ljava/util/List;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final o(ZZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->h:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 12
    .line 13
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 8
    .line 9
    const/high16 v0, 0x420c0000    # 35.0f

    .line 10
    .line 11
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v2, 0x40e00000    # 7.0f

    .line 20
    .line 21
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    neg-int v2, v2

    .line 26
    const/high16 v3, 0x41280000    # 10.5f

    .line 27
    .line 28
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    neg-int v3, v3

    .line 33
    invoke-virtual {p0, v1, v0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->d(IIII)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final p(Ljava/util/List;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->h(Ljava/util/List;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v2, v2, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->o(ZZZ)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->f(Ljava/util/List;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0, v1, v2, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->o(ZZZ)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 29
    .line 30
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getLoadingSvg()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 45
    .line 46
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getContentPic()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;

    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;->getResultShowDurationS()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    invoke-virtual {p0, v3, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g(Ljava/lang/String;J)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;

    .line 65
    .line 66
    invoke-direct {v3, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;Ljava/util/List;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->f:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatMicEmojiItemView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/emoji/VoiceTripleDiceView;->g()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method
