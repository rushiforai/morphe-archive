.class public Landroidx/gridlayout/widget/GridLayout$g$a;
.super Landroidx/gridlayout/widget/GridLayout$l;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/gridlayout/widget/GridLayout$g;->b()Landroidx/gridlayout/widget/GridLayout$l;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public d:I

.field public final synthetic e:Landroidx/gridlayout/widget/GridLayout$g;


# direct methods
.method public constructor <init>(Landroidx/gridlayout/widget/GridLayout$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/gridlayout/widget/GridLayout$g$a;->e:Landroidx/gridlayout/widget/GridLayout$g;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/gridlayout/widget/GridLayout$l;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroidx/gridlayout/widget/GridLayout;Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$i;IZ)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-super/range {p0 .. p5}, Landroidx/gridlayout/widget/GridLayout$l;->a(Landroidx/gridlayout/widget/GridLayout;Landroid/view/View;Landroidx/gridlayout/widget/GridLayout$i;IZ)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public b(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/gridlayout/widget/GridLayout$l;->b(II)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Landroidx/gridlayout/widget/GridLayout$g$a;->d:I

    .line 5
    .line 6
    add-int/2addr p1, p2

    .line 7
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Landroidx/gridlayout/widget/GridLayout$g$a;->d:I

    .line 12
    .line 13
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroidx/gridlayout/widget/GridLayout$l;->d()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x80000000

    .line 5
    .line 6
    iput v0, p0, Landroidx/gridlayout/widget/GridLayout$g$a;->d:I

    .line 7
    .line 8
    return-void
.end method

.method public e(Z)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroidx/gridlayout/widget/GridLayout$l;->e(Z)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget p0, p0, Landroidx/gridlayout/widget/GridLayout$g$a;->d:I

    .line 6
    .line 7
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
