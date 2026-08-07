.class public Ll/yvg$b;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yvg;->j(Lcom/p1/mobile/putong/feed/data/Frame;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/yvg;


# direct methods
.method public constructor <init>(Ll/yvg;Lv/VDraweeView;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yvg$b;->c:Ll/yvg;

    .line 2
    .line 3
    iput-object p2, p0, Ll/yvg$b;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/yvg$b;->b:Landroid/view/View;

    .line 6
    .line 7
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 p3, 0x42a00000    # 80.0f

    .line 12
    .line 13
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    sub-int/2addr p1, p3

    .line 18
    int-to-float p3, p1

    .line 19
    const/high16 v0, 0x43e20000    # 452.0f

    .line 20
    .line 21
    mul-float/2addr p3, v0

    .line 22
    const v0, 0x43938000    # 295.0f

    .line 23
    .line 24
    .line 25
    div-float/2addr p3, v0

    .line 26
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    int-to-float v0, v0

    .line 31
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    float-to-int p3, p3

    .line 36
    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    int-to-float p2, p2

    .line 45
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iget-object p2, p0, Ll/yvg$b;->a:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 60
    .line 61
    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 62
    .line 63
    iget-object p1, p0, Ll/yvg$b;->a:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/yvg$b;->b:Landroid/view/View;

    .line 69
    .line 70
    const/4 p1, 0x0

    .line 71
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 72
    .line 73
    .line 74
    return-void
.end method
