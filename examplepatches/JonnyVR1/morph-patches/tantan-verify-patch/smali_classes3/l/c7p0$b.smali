.class public Ll/c7p0$b;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/c7p0;->i()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Ll/c7p0;


# direct methods
.method public constructor <init>(Ll/c7p0;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/c7p0$b;->b:Ll/c7p0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/c7p0$b;->a:Lv/VDraweeView;

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
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/c7p0$b;->a:Lv/VDraweeView;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    sget p3, Ll/qa00;->k:I

    .line 13
    .line 14
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 15
    .line 16
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr v0, p2

    .line 27
    int-to-float p2, p3

    .line 28
    mul-float/2addr v0, p2

    .line 29
    float-to-int p2, v0

    .line 30
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 31
    .line 32
    iget-object p0, p0, Ll/c7p0$b;->a:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
