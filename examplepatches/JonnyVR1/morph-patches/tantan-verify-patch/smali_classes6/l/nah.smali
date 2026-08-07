.class public Ll/nah;
.super Ll/r4h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r4h<",
        "Lcom/p1/mobile/putong/feed/data/Interactive;",
        ">;"
    }
.end annotation


# instance fields
.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/kah;


# direct methods
.method public constructor <init>(Ll/kah;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/kah;->c()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Ll/r4h;-><init>(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/nah;->g:Ll/kah;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public B(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Interactive;II)V
    .locals 2

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 p3, 0x0

    .line 4
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    move-object p4, p1

    .line 9
    check-cast p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;

    .line 10
    .line 11
    iget-object v0, p0, Ll/nah;->g:Ll/kah;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/kah;->b()Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->a:Lv/VLinear;

    .line 24
    .line 25
    sget v1, Ll/lbc0;->T:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->c:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    sget v1, Ll/k9c0;->u:I

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->a:Lv/VLinear;

    .line 47
    .line 48
    sget v1, Ll/lbc0;->r4:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->c:Landroid/widget/TextView;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget v1, Ll/k9c0;->m:I

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iget-object p1, p4, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->c:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-static {p3}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p4, p2}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->u(Lcom/p1/mobile/putong/feed/data/Interactive;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/nah;->f:Ll/y20;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    iget-object p0, p0, Ll/nah;->f:Ll/y20;

    .line 89
    .line 90
    invoke-interface {p0, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Interactive;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r4h;->c:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public D(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nah;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Interactive;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/nah;->B(Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Interactive;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 4

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;

    .line 2
    .line 3
    iget-object p2, p0, Ll/nah;->g:Ll/kah;

    .line 4
    .line 5
    invoke-virtual {p2}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-direct {p1, p2}, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    new-instance p2, Lv/VFrame;

    .line 13
    .line 14
    iget-object v0, p0, Ll/nah;->g:Ll/kah;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/kah;->a()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-direct {p2, v0}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 27
    .line 28
    const/4 v1, -0x2

    .line 29
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/nah;->g:Ll/kah;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/kah;->h()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    move v1, v2

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const/high16 v1, 0x40800000    # 4.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :goto_0
    iget-object v3, p0, Ll/nah;->g:Ll/kah;

    .line 50
    .line 51
    invoke-virtual {v3}, Ll/kah;->d()I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/nah;->g:Ll/kah;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/kah;->h()Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/group/interactive/FeedInteractiveItemView;->a:Lv/VLinear;

    .line 67
    .line 68
    invoke-static {p0, v2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 69
    .line 70
    .line 71
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    return-object p2
.end method
