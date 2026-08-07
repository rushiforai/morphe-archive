.class public Ll/sxy;
.super Ll/zxy;
.source "SourceFile"


# instance fields
.field public n:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, p1, p2, v0}, Ll/zxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 3
    .line 4
    .line 5
    iput p3, p0, Ll/sxy;->n:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Ll/rxy;->e(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    const/4 p2, 0x1

    .line 9
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 16
    .line 17
    iget p3, p0, Ll/sxy;->n:I

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 24
    .line 25
    iget p3, p0, Ll/rxy;->b:I

    .line 26
    .line 27
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 31
    .line 32
    const/4 p3, -0x1

    .line 33
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 34
    .line 35
    .line 36
    iget-boolean p2, p0, Ll/rxy;->d:Z

    .line 37
    .line 38
    iget-boolean p0, p0, Ll/rxy;->e:Z

    .line 39
    .line 40
    and-int/2addr p0, p2

    .line 41
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-super {p0, p1, p2, p3}, Ll/zxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic l(I)Ll/yxy;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxy;->p(I)Ll/sxy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic n(I)Ll/yxy;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/sxy;->q(I)Ll/sxy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(I)Ll/sxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/yxy;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public q(I)Ll/sxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/yxy;->j:I

    .line 2
    .line 3
    return-object p0
.end method
