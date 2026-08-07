.class public Ll/i0k$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lv/VDraweeView;


# direct methods
.method public constructor <init>(ILv/VDraweeView;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/i0k$a;->a:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/i0k$a;->b:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/fn2;-><init>()V

    .line 6
    .line 7
    .line 8
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
    if-nez p2, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget p3, p0, Ll/i0k$a;->a:I

    .line 16
    .line 17
    int-to-float p3, p3

    .line 18
    int-to-float p2, p2

    .line 19
    int-to-float p1, p1

    .line 20
    div-float/2addr p2, p1

    .line 21
    mul-float/2addr p3, p2

    .line 22
    float-to-int p1, p3

    .line 23
    iget-object p2, p0, Ll/i0k$a;->b:Lv/VDraweeView;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 30
    .line 31
    iget p1, p0, Ll/i0k$a;->a:I

    .line 32
    .line 33
    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 34
    .line 35
    iget-object p1, p0, Ll/i0k$a;->b:Lv/VDraweeView;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/i0k$a;->b:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    check-cast p0, Ll/wlj;

    .line 47
    .line 48
    sget-object p1, Ll/h1e0;->a:Ll/h1e0;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/wlj;->w(Ll/h1e0;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
