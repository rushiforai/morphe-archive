.class public Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final c:F


# instance fields
.field public a:Lv/VText;

.field public b:Lv/VDraweeView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x41400000    # 12.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    int-to-float v0, v0

    .line 8
    sput v0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->c:F

    .line 9
    .line 10
    return-void
.end method

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->a(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
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

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->a(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p0, p1, p0}, Ll/m9j0;->b(Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    const/high16 v0, 0x41400000    # 12.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    mul-int/lit8 v0, v0, 0x2

    .line 23
    .line 24
    sub-int/2addr p1, v0

    .line 25
    int-to-double v0, p1

    .line 26
    const-wide v2, 0x400399999999999aL    # 2.45

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    div-double/2addr v0, v2

    .line 32
    double-to-int p1, v0

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->b:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->b:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    new-instance p1, Lcom/facebook/drawee/generic/RoundingParams;

    .line 47
    .line 48
    invoke-direct {p1}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 49
    .line 50
    .line 51
    sget v0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->c:F

    .line 52
    .line 53
    invoke-virtual {p1, v0, v0, v0, v0}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->b:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Ll/wlj;

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicOfficialItemView;->b:Lv/VDraweeView;

    .line 68
    .line 69
    const/high16 p1, 0x41700000    # 15.0f

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/view/View;->setElevation(F)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
