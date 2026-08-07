.class public Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;
.super Lv/VLinear;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->R(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;)Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    return-object p0
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->setTimeDuration(J)V

    return-void
.end method

.method private R(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/tec0;->l0:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x5

    .line 16
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->add(II)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0xb

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 23
    .line 24
    .line 25
    const/16 v0, 0xc

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 28
    .line 29
    .line 30
    const/16 v0, 0xd

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0xe

    .line 36
    .line 37
    invoke-virtual {p1, v0, v1}, Ljava/util/Calendar;->set(II)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 41
    .line 42
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;J)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 50
    .line 51
    return-void
.end method

.method private setTimeDuration(J)V
    .locals 5

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p1, v0

    .line 4
    const-wide/16 v0, 0xe10

    .line 5
    .line 6
    div-long v2, p1, v0

    .line 7
    .line 8
    long-to-int v2, v2

    .line 9
    rem-long v0, p1, v0

    .line 10
    .line 11
    const-wide/16 v3, 0x3c

    .line 12
    .line 13
    div-long/2addr v0, v3

    .line 14
    long-to-int v0, v0

    .line 15
    rem-long/2addr p1, v3

    .line 16
    long-to-int p1, p1

    .line 17
    sget-object p2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 18
    .line 19
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {v1, v0, p1}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "%02d:%02d:%02d"

    .line 36
    .line 37
    invoke-static {p2, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 p2, 0x0

    .line 42
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-ge p2, v0, :cond_0

    .line 47
    .line 48
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/TextView;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    add-int/lit8 p2, p2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    return-void
.end method


# virtual methods
.method public setCountTarget(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;J)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView;->c:Lcom/p1/mobile/putong/feed/newui/featured/FeedCountDownView$a;

    .line 14
    .line 15
    return-void
.end method
