.class public Ll/g0p0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g0p0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Ll/g0p0;


# direct methods
.method public constructor <init>(Ll/g0p0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g0p0$a;->a:Ll/g0p0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/SweetGalleryLayoutManager;Landroid/view/View;F)V
    .locals 0

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
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 37
    .line 38
    .line 39
    const p1, 0x3f19999a    # 0.6f

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
    sub-float/2addr p0, p3

    .line 48
    invoke-virtual {p2, p0}, Landroid/view/View;->setAlpha(F)V

    .line 49
    .line 50
    .line 51
    return-void
.end method
