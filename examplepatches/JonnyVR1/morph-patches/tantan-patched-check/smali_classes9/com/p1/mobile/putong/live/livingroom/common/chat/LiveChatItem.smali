.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# static fields
.field public static final i:I

.field public static final j:I


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

.field public d:Landroid/view/View;

.field public e:Lv/VDraweeView;

.field public f:Landroid/text/SpannableStringBuilder;

.field public g:I

.field public h:Ll/ft5;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#34000000"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->i:I

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
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->j:I

    .line 16
    .line 17
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
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 6
    .line 7
    new-instance p1, Ll/ft5;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h:Ll/ft5;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 17
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h:Ll/ft5;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 19
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 20
    new-instance p1, Ll/ft5;

    invoke-direct {p1}, Ll/ft5;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h:Ll/ft5;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/a5s;)V
    .locals 0

    .line 1
    invoke-virtual {p2, p0, p1}, Ll/a5s;->d(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private d()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

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

.method private setCommonBackgroundWithCorner(I)V
    .locals 3

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
    const/4 v1, 0x1

    .line 10
    aput p1, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    aput p1, v0, v1

    .line 14
    .line 15
    const/4 v2, 0x3

    .line 16
    aput p1, v0, v2

    .line 17
    .line 18
    const/4 v2, 0x4

    .line 19
    aput p1, v0, v2

    .line 20
    .line 21
    const/4 v2, 0x5

    .line 22
    aput p1, v0, v2

    .line 23
    .line 24
    const/4 v2, 0x6

    .line 25
    aput p1, v0, v2

    .line 26
    .line 27
    const/4 v2, 0x7

    .line 28
    aput p1, v0, v2

    .line 29
    .line 30
    new-instance p1, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-direct {p1, v0, v2, v2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

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
    invoke-static {v1}, Ll/wft;->b(I)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    sget v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->j:I

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->i:I

    .line 55
    .line 56
    :goto_0
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method private setVipBackgroundWithCorner(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    invoke-static {p1, p0, v0}, Ll/l35;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Landroid/view/View;I)Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public M()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h:Ll/ft5;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/ft5;->c()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

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
    invoke-static {p0, p1}, Ll/l4s;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    check-cast p1, Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-ne v0, v2, :cond_2

    .line 13
    .line 14
    instance-of v0, v1, Landroid/text/Spanned;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    float-to-int v0, v0

    .line 23
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    float-to-int p2, p2

    .line 28
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingLeft()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    sub-int/2addr v0, v3

    .line 33
    invoke-virtual {p1}, Landroid/widget/TextView;->getTotalPaddingTop()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    sub-int/2addr p2, v3

    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    add-int/2addr v0, v3

    .line 43
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    add-int/2addr p2, v3

    .line 48
    const/4 v3, 0x0

    .line 49
    new-array v4, v3, [Landroid/text/style/ClickableSpan;

    .line 50
    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    invoke-virtual {v5, p2}, Landroid/text/Layout;->getLineForVertical(I)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    int-to-float v0, v0

    .line 60
    invoke-virtual {v5, p2, v0}, Landroid/text/Layout;->getOffsetForHorizontal(IF)I

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    check-cast v1, Landroid/text/Spanned;

    .line 65
    .line 66
    const-class v0, Landroid/text/style/ClickableSpan;

    .line 67
    .line 68
    invoke-interface {v1, p2, p2, v0}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, [Landroid/text/style/ClickableSpan;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    move-object v4, p2

    .line 75
    goto :goto_0

    .line 76
    :catch_0
    move-exception p2

    .line 77
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :goto_0
    array-length p2, v4

    .line 81
    if-eqz p2, :cond_0

    .line 82
    .line 83
    aget-object p0, v4, v3

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/text/style/ClickableSpan;->onClick(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->hasOnClickListeners()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->hasOnClickListeners()Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 106
    .line 107
    .line 108
    :cond_2
    :goto_1
    return v2
.end method

.method public f(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/text/SpannableStringBuilder;I)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 5
    .line 6
    iput p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 7
    .line 8
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->d:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isOpenGradientFlow()Z

    .line 20
    .line 21
    .line 22
    move-result p4

    .line 23
    invoke-virtual {p0, p1, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->i(Ll/yql;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p3, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h(Landroid/text/SpannableStringBuilder;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p1, p2, p0}, Ll/dy4;->v(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Landroid/view/View;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->isGiftMessage()Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    invoke-static {p2}, Ll/muj;->t(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    return-void
.end method

.method public final g(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yql;)V
    .locals 2

    .line 1
    sget v0, Ll/qa00;->i:I

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    if-eq v1, p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x2

    .line 11
    if-eq v1, p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->n()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->l(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;ILl/yql;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final h(Landroid/text/SpannableStringBuilder;Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->m()V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/j4s;

    .line 21
    .line 22
    invoke-direct {v0, p2, p3}, Ll/j4s;-><init>(Ll/yql;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    const/high16 p3, 0x40800000    # 4.0f

    .line 37
    .line 38
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 39
    .line 40
    .line 41
    move-result p3

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    const/high16 p3, 0x41000000    # 8.0f

    .line 59
    .line 60
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final i(Ll/yql;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;->setRefresh(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 9
    .line 10
    sget v1, Ll/qa00;->E:I

    .line 11
    .line 12
    invoke-static {p2, v0, p1, v1}, Ll/dy4;->y(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {p2, v0, p1, v2}, Ll/dy4;->x(Landroid/text/SpannableStringBuilder;Landroid/widget/TextView;Ll/yql;Lcom/p1/mobile/android/app/Act;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 27
    .line 28
    invoke-interface {p1}, Ll/yql;->getAdapter()Ll/gt4;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 33
    .line 34
    invoke-interface {p1}, Ll/yql;->getAdapter()Ll/gt4;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ll/gt4;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-static {p2, v0, v2, p1, v1}, Ll/dy4;->A(Landroid/text/SpannableStringBuilder;Ll/gt4;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;I)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result p2

    .line 50
    if-nez p2, :cond_0

    .line 51
    .line 52
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-eqz p2, :cond_0

    .line 61
    .line 62
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    check-cast p2, Ll/kcg0;

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->h:Ll/ft5;

    .line 69
    .line 70
    invoke-virtual {v0, p2}, Ll/ft5;->a(Ll/kcg0;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->f:Landroid/text/SpannableStringBuilder;

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPictureUrl()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->d:Landroid/view/View;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e:Lv/VDraweeView;

    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPictureUrl()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    const-string v2, "context_livingAct"

    .line 41
    .line 42
    invoke-static {v2, v1, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;->getPosition()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e:Lv/VDraweeView;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    instance-of v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 56
    .line 57
    if-eqz v2, :cond_5

    .line 58
    .line 59
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 60
    .line 61
    const-wide/16 v2, 0x1

    .line 62
    .line 63
    cmp-long v2, v0, v2

    .line 64
    .line 65
    if-nez v2, :cond_2

    .line 66
    .line 67
    const v0, 0x800035

    .line 68
    .line 69
    .line 70
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    const-wide/16 v2, 0x2

    .line 74
    .line 75
    cmp-long v2, v0, v2

    .line 76
    .line 77
    if-nez v2, :cond_3

    .line 78
    .line 79
    const v0, 0x800015

    .line 80
    .line 81
    .line 82
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_3
    const-wide/16 v2, 0x3

    .line 86
    .line 87
    cmp-long v0, v0, v2

    .line 88
    .line 89
    if-nez v0, :cond_4

    .line 90
    .line 91
    const v0, 0x800055

    .line 92
    .line 93
    .line 94
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 95
    .line 96
    :cond_4
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->e:Lv/VDraweeView;

    .line 97
    .line 98
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 99
    .line 100
    .line 101
    :cond_5
    :goto_1
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;I)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->hasChatShadeConfig()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->chatShadeConfig:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->setVipBackgroundWithCorner(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->setCommonBackgroundWithCorner(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final l(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;ILl/yql;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->k(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;I)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p3}, Ll/yql;->getChatScene()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/j35;->i(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->b:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    new-instance p1, Landroid/graphics/Rect;

    .line 17
    .line 18
    const/high16 p2, 0x40800000    # 4.0f

    .line 19
    .line 20
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-direct {p1, v0, p3, v0, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0, p1}, Ll/ynp0;->C(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/k4s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k4s;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->d:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->g:I

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 28
    .line 29
    const/high16 v1, 0x42000000    # 32.0f

    .line 30
    .line 31
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c:Lcom/p1/mobile/putong/live/livingroom/view/AutoRefreshTextView;

    .line 39
    .line 40
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/LiveChatItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
