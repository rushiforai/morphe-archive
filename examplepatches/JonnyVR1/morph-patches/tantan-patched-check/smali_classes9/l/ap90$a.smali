.class public Ll/ap90$a;
.super Ll/fn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ap90;->O0(Lcom/p1/mobile/putong/data/User;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ap90;


# direct methods
.method public constructor <init>(Ll/ap90;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ap90$a;->a:Ll/ap90;

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
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fn2;->h(Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ap90$a;->a:Ll/ap90;

    .line 5
    .line 6
    iget-object p1, p1, Ll/ap90;->N0:Ll/eo90;

    .line 7
    .line 8
    iget-object p1, p1, Ll/eo90;->w:Lv/VDraweeView;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 15
    .line 16
    sget p3, Ll/qa00;->o:I

    .line 17
    .line 18
    iput p3, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 19
    .line 20
    invoke-interface {p2}, Ll/qim;->getWidth()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    int-to-float v0, v0

    .line 25
    invoke-interface {p2}, Ll/qim;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    int-to-float p2, p2

    .line 30
    div-float/2addr v0, p2

    .line 31
    int-to-float p2, p3

    .line 32
    mul-float/2addr v0, p2

    .line 33
    float-to-int p2, v0

    .line 34
    iput p2, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 35
    .line 36
    iget-object p0, p0, Ll/ap90$a;->a:Ll/ap90;

    .line 37
    .line 38
    iget-object p0, p0, Ll/ap90;->N0:Ll/eo90;

    .line 39
    .line 40
    iget-object p0, p0, Ll/eo90;->w:Lv/VDraweeView;

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
