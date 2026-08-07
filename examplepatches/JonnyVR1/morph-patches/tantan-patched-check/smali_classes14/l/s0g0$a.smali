.class public Ll/s0g0$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/s0g0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/s0g0;


# direct methods
.method public constructor <init>(Ll/s0g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s0g0$a;->a:Ll/s0g0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    int-to-float p1, p1

    .line 17
    const/high16 p3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    mul-float/2addr p1, p3

    .line 20
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    int-to-float p2, p2

    .line 25
    div-float/2addr p1, p2

    .line 26
    iget-object p2, p0, Ll/s0g0$a;->a:Ll/s0g0;

    .line 27
    .line 28
    invoke-static {p2}, Ll/s0g0;->d(Ll/s0g0;)Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;->c:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    sget p3, Ll/bnl0;->e:I

    .line 39
    .line 40
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 41
    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    int-to-float p3, p3

    .line 47
    mul-float/2addr p3, p1

    .line 48
    float-to-int p1, p3

    .line 49
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 50
    .line 51
    iget-object p0, p0, Ll/s0g0$a;->a:Ll/s0g0;

    .line 52
    .line 53
    invoke-static {p0}, Ll/s0g0;->d(Ll/s0g0;)Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;->c:Lv/VDraweeView;

    .line 58
    .line 59
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    return-void
.end method
