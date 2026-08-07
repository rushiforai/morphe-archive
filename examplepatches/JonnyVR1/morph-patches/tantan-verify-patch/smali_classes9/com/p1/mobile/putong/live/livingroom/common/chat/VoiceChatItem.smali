.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;
.implements Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea;


# static fields
.field public static final l:I

.field public static final m:I

.field public static final n:I

.field public static final o:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/kcg0;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/text/SpannableStringBuilder;

.field public i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public j:I

.field public k:Ll/ft5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#33000000"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->l:I

    .line 8
    .line 9
    const-string v0, "#4D000000"

    .line 10
    .line 11
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->m:I

    .line 16
    .line 17
    const/high16 v0, 0x3fc00000    # 1.5f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->n:I

    .line 24
    .line 25
    const/high16 v0, 0x41400000    # 12.0f

    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->o:I

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g:Ljava/util/List;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 9
    .line 10
    new-instance p1, Ll/ft5;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k:Ll/ft5;

    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g:Ljava/util/List;

    const/4 p1, 0x0

    .line 20
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 21
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k:Ll/ft5;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g:Ljava/util/List;

    const/4 p1, 0x0

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 25
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k:Ll/ft5;

    return-void
.end method

.method public static synthetic a(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Ll/a5s;->d(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    check-cast p0, Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    instance-of v0, v1, Landroid/text/Spanned;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    float-to-int v0, v0

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    float-to-int p1, p1

    .line 28
    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-int/2addr v0, v3

    .line 33
    invoke-virtual {p0}, Landroid/widget/TextView;->getTotalPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sub-int/2addr p1, v3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-int/2addr v0, v3

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-int/2addr p1, v3

    .line 48
    new-array v3, v2, [Landroid/text/style/ClickableSpan;

    .line 49
    .line 50
    :try_start_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4, p1}, Landroid/text/Layout;->getLineForVertical(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    int-to-float v0, v0

    .line 59
    invoke-virtual {v4, p1, v0}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    check-cast v1, Landroid/text/Spanned;

    .line 64
    .line 65
    const-class v0, Landroid/text/style/ClickableSpan;

    .line 66
    .line 67
    invoke-interface {v1, p1, p1, v0}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, [Landroid/text/style/ClickableSpan;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    move-object v3, p1

    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception p1

    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    array-length p1, v3

    .line 80
    if-eqz p1, :cond_0

    .line 81
    .line 82
    aget-object p1, v3, v2

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    .line 85
    .line 86
    .line 87
    const/4 v2, 0x1

    .line 88
    :cond_0
    return v2
.end method

.method private f(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 2

    .line 1
    const/high16 v0, 0x41600000    # 14.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    if-eq v1, p1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x2

    .line 15
    if-eq v1, p1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->l(Ll/yql;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->setVoiceContentConfig(Ll/yql;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_2
    invoke-direct {p0, p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;ILl/yql;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method private g(Landroid/text/SpannableStringBuilder;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/a5s;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1, v2, v0, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, [Ll/a5s;

    .line 13
    .line 14
    array-length v0, p1

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k()V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/f9n0;

    .line 21
    .line 22
    invoke-direct {p0, p2, p3}, Ll/f9n0;-><init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V
    .locals 12

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPictureUrl()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->d(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e:Lv/VDraweeView;

    .line 35
    .line 36
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e:Lv/VDraweeView;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPictureUrl()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    const/high16 p1, 0x41f00000    # 30.0f

    .line 50
    .line 51
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 52
    .line 53
    .line 54
    move-result v6

    .line 55
    invoke-static {p1}, Ll/bnl0;->w(F)I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    invoke-static {}, Ll/irn;->a()Z

    .line 60
    .line 61
    .line 62
    move-result v10

    .line 63
    const/4 v11, 0x0

    .line 64
    const-string v3, "context_livingAct"

    .line 65
    .line 66
    const/4 v8, 0x0

    .line 67
    const/4 v9, 0x0

    .line 68
    invoke-static/range {v3 .. v11}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPosition()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e:Lv/VDraweeView;

    .line 76
    .line 77
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    instance-of v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 82
    .line 83
    if-eqz v3, :cond_5

    .line 84
    .line 85
    move-object v3, v2

    .line 86
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    const-wide/16 v4, 0x1

    .line 89
    .line 90
    cmp-long v4, v0, v4

    .line 91
    .line 92
    if-nez v4, :cond_2

    .line 93
    .line 94
    const v0, 0x800035

    .line 95
    .line 96
    .line 97
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_2
    const-wide/16 v4, 0x2

    .line 101
    .line 102
    cmp-long v4, v0, v4

    .line 103
    .line 104
    if-nez v4, :cond_3

    .line 105
    .line 106
    const v0, 0x800015

    .line 107
    .line 108
    .line 109
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    const-wide/16 v4, 0x3

    .line 113
    .line 114
    cmp-long v0, v0, v4

    .line 115
    .line 116
    if-nez v0, :cond_4

    .line 117
    .line 118
    const v0, 0x800055

    .line 119
    .line 120
    .line 121
    iput v0, v3, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 122
    .line 123
    :cond_4
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 128
    .line 129
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    iput p1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e:Lv/VDraweeView;

    .line 136
    .line 137
    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 141
    .line 142
    const/high16 p1, 0x41700000    # 15.0f

    .line 143
    .line 144
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 149
    .line 150
    .line 151
    :cond_5
    return-void
.end method

.method private i(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->hasChatShadeConfig()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->setVipBackgroundWithCorner(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/high16 p1, 0x41200000    # 10.0f

    .line 14
    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->setCommonBackgroundWithCorner(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private j(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;ILl/yql;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 2
    .line 3
    const/high16 v0, 0x42180000    # 38.0f

    .line 4
    .line 5
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->i(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private k()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 2
    .line 3
    new-instance v0, Ll/g9n0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/g9n0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private setCommonBackgroundWithCorner(I)V
    .locals 4

    .line 1
    int-to-float p1, p1

    .line 2
    const/16 v0, 0x8

    .line 3
    .line 4
    new-array v0, v0, [F

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aput p1, v0, v1

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    aput p1, v0, v2

    .line 11
    .line 12
    const/4 v2, 0x2

    .line 13
    aput p1, v0, v2

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    aput p1, v0, v2

    .line 17
    .line 18
    const/4 v3, 0x4

    .line 19
    aput p1, v0, v3

    .line 20
    .line 21
    const/4 v3, 0x5

    .line 22
    aput p1, v0, v3

    .line 23
    .line 24
    const/4 v3, 0x6

    .line 25
    aput p1, v0, v3

    .line 26
    .line 27
    const/4 v3, 0x7

    .line 28
    aput p1, v0, v3

    .line 29
    .line 30
    new-instance p1, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {p1, v0, v3, v3}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    .line 37
    .line 38
    invoke-direct {v0, p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-static {v2}, Ll/wft;->b(I)Z

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-nez v2, :cond_0

    .line 50
    .line 51
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->m:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->l:I

    .line 55
    .line 56
    :goto_0
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 74
    .line 75
    invoke-static {p0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method private setVipBackgroundWithCorner(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    invoke-static {p1, p0, v0}, Ll/l35;->h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setVoiceContentConfig(Ll/yql;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->l(Ll/yql;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 5
    .line 6
    const/high16 v0, 0x41200000    # 10.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->i(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->h:Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k:Ll/ft5;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->h:Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/dy4;->t(Landroid/text/SpannableStringBuilder;Lv/VText;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/v9n0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 2
    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->hasChatShadeConfig()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/high16 p0, 0x41b00000    # 22.0f

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/high16 p0, 0x41c00000    # 24.0f

    .line 19
    .line 20
    :goto_0
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public e(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V
    .locals 3

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->h:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->i:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 7
    .line 8
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 9
    .line 10
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->e:Lv/VDraweeView;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->d(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 20
    .line 21
    sget v0, Ll/qa00;->E:I

    .line 22
    .line 23
    invoke-static {p3, p4, p1, v0}, Ll/dy4;->y(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;I)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ll/yql;->getAdapter()Ll/gt4;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 31
    .line 32
    invoke-virtual {p4}, Ll/gt4;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {p3, p4, v1, v2, v0}, Ll/dy4;->A(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;I)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p4

    .line 40
    iput-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result p4

    .line 46
    if-nez p4, :cond_1

    .line 47
    .line 48
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g:Ljava/util/List;

    .line 49
    .line 50
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 51
    .line 52
    .line 53
    move-result-object p4

    .line 54
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Ll/kcg0;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->k:Ll/ft5;

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-direct {p0, p3, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->g(Landroid/text/SpannableStringBuilder;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 73
    .line 74
    .line 75
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 76
    .line 77
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, p2, p0}, Ll/dy4;->v(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    invoke-direct {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->f(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public getClickTarget()Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    return-object p0
.end method

.method public getLongClickArea()Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l(Ll/yql;)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 7
    .line 8
    const/high16 v1, 0x42000000    # 32.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1}, Ll/yql;->getLiveMode()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {p1}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c:Lv/VText;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const-string p1, "#ccffffff"

    .line 30
    .line 31
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    const/4 p1, -0x1

    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setLongClickArea(Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/VoiceChatItem;->f:Lcom/p1/mobile/putong/live/livingroom/common/chat/IChatItemLongClickArea$LongClickArea;

    .line 2
    .line 3
    return-void
.end method
