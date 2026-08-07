.class public Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$k;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout$a;->a:Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;Ll/foh0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/SwitchVerticalFrameLayout;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;F)V
    .locals 2

    .line 1
    const/high16 p0, -0x40800000    # -1.0f

    .line 2
    .line 3
    cmpg-float p0, p2, p0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-gez p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/high16 p0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    cmpg-float v1, p2, p0

    .line 15
    .line 16
    if-gtz v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    int-to-float p0, p0

    .line 26
    neg-float v0, p2

    .line 27
    mul-float/2addr p0, v0

    .line 28
    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    int-to-float p0, p0

    .line 36
    mul-float/2addr p2, p0

    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationY(F)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
