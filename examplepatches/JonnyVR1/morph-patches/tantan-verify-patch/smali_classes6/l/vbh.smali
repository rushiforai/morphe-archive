.class public abstract Ll/vbh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/zxh;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/zxh<",
        "Landroid/widget/TextView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:I


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

.method public static synthetic e(Ll/vbh;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/vbh;->g()V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/zxh;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/vbh;->h(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget p1, p0, Ll/vbh;->b:I

    .line 5
    .line 6
    add-int/lit8 p1, p1, 0x1

    .line 7
    .line 8
    iput p1, p0, Ll/vbh;->b:I

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, -0x2

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget p1, p0, Ll/vbh;->b:I

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    iput p1, p0, Ll/vbh;->b:I

    .line 19
    .line 20
    :cond_1
    :goto_0
    iget p1, p0, Ll/vbh;->b:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/vbh;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public bridge synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/vbh;->f(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vbh;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vbh;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/vbh;->a:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    neg-int v0, v0

    .line 8
    const/high16 v1, 0x40c00000    # 6.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    invoke-static {p0, v0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final h(I)V
    .locals 2

    .line 1
    iput p1, p0, Ll/vbh;->b:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/vbh;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    if-lez p1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/vbh;->a:Landroid/widget/TextView;

    .line 12
    .line 13
    const/16 v1, 0x63

    .line 14
    .line 15
    if-le p1, v1, :cond_0

    .line 16
    .line 17
    const-string p1, "99+"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/vbh;->a:Landroid/widget/TextView;

    .line 28
    .line 29
    new-instance v0, Ll/ubh;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/ubh;-><init>(Ll/vbh;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    const/16 p0, 0x8

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
