.class public Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->f0(Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

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
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 13
    .line 14
    sget p3, Ll/qa00;->q:I

    .line 15
    .line 16
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 17
    .line 18
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    div-float/2addr v0, v1

    .line 29
    int-to-float p3, p3

    .line 30
    mul-float/2addr v0, p3

    .line 31
    float-to-int p3, v0

    .line 32
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 33
    .line 34
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 43
    .line 44
    if-ne p3, p2, :cond_0

    .line 45
    .line 46
    iget-object p2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 47
    .line 48
    sget p3, Ll/dbc0;->S2:I

    .line 49
    .line 50
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-object p2, v0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 55
    .line 56
    const/4 p3, 0x0

    .line 57
    invoke-virtual {p2, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView$a;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->m:Lv/VDraweeView;

    .line 63
    .line 64
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
