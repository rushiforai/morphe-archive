.class public Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VText_AutoFit;

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/bnl0;->y0()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/high16 v0, 0x42e00000    # 112.0f

    .line 9
    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    sub-int/2addr p1, v0

    .line 15
    div-int/lit8 p1, p1, 0x3

    .line 16
    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x42e00000    # 112.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x3

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    invoke-static {}, Ll/bnl0;->y0()I

    move-result p1

    const/high16 p2, 0x42e00000    # 112.0f

    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    sub-int/2addr p1, p2

    div-int/lit8 p1, p1, 0x3

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    return-void
.end method


# virtual methods
.method public getBindViewData()Ll/p2i0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 5

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->e:Lv/VText_AutoFit;

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lv/VText_AutoFit;->setTypeface(Landroid/graphics/Typeface;)V

    .line 15
    .line 16
    .line 17
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->a:Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    new-array v3, v2, [Landroid/view/View;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    aput-object v1, v3, v4

    .line 26
    .line 27
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->a:Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    .line 33
    .line 34
    const/high16 v3, 0x41b80000    # 23.0f

    .line 35
    .line 36
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    add-int/2addr v1, v3

    .line 41
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->b:Lv/VFrame;

    .line 47
    .line 48
    new-array v2, v2, [Landroid/view/View;

    .line 49
    .line 50
    aput-object v1, v2, v4

    .line 51
    .line 52
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->b:Lv/VFrame;

    .line 56
    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->f:I

    .line 58
    .line 59
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ykb0;->a(Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setData(Ll/p2i0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSelected(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->e:Lv/VText_AutoFit;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purpose/PurposeItem;->d:Lv/VImage;

    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
