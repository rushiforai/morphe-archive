.class public Lcom/p1/mobile/putong/feed/newui/status/share/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager$c;


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


# virtual methods
.method public a(Lcom/p1/mobile/putong/feed/newui/status/share/FeedGalleryLayoutManager;Landroid/view/View;F)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    int-to-float p0, p0

    .line 6
    const/high16 p1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr p0, p1

    .line 9
    invoke-virtual {p2, p0}, Landroid/view/View;->setPivotX(F)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    int-to-float p0, p0

    .line 17
    div-float/2addr p0, p1

    .line 18
    invoke-virtual {p2, p0}, Landroid/view/View;->setPivotY(F)V

    .line 19
    .line 20
    .line 21
    const p0, 0x3e99999a    # 0.3f

    .line 22
    .line 23
    .line 24
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    mul-float/2addr p1, p0

    .line 29
    const/high16 p0, 0x3f800000    # 1.0f

    .line 30
    .line 31
    sub-float p1, p0, p1

    .line 32
    .line 33
    invoke-static {}, Ll/cmg;->A()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_0

    .line 38
    .line 39
    const p1, 0x3ecccccd    # 0.4f

    .line 40
    .line 41
    .line 42
    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    mul-float/2addr p3, p1

    .line 47
    sub-float p1, p0, p3

    .line 48
    .line 49
    :cond_0
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
