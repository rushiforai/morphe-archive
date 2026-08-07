.class public Ll/zbn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/widget/TextView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Ll/zbn0;->a:Z

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Landroid/widget/TextView;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/qa00;->j:I

    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/qa00;->q:I

    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    iget-boolean p0, p0, Ll/zbn0;->a:Z

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Fb:I

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget v1, Ll/obc0;->A9:I

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const/high16 v1, 0x41b00000    # 22.0f

    .line 35
    .line 36
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    const/4 v3, 0x0

    .line 45
    invoke-virtual {p0, v3, v3, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->E5:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/zbn0;->a:Z

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->X8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zbn0;->H(Landroid/widget/TextView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
