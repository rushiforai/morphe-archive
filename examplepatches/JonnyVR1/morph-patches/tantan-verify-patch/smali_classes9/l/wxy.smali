.class public Ll/wxy;
.super Ll/rxy;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/rxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Ll/wxy;->i:I

    .line 6
    .line 7
    iput p1, p0, Ll/wxy;->j:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V
    .locals 0

    .line 1
    const/4 p2, 0x2

    .line 2
    invoke-virtual {p0, p2}, Ll/rxy;->e(I)Z

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 9
    .line 10
    iget p3, p0, Ll/rxy;->c:I

    .line 11
    .line 12
    invoke-virtual {p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 16
    .line 17
    iget p3, p0, Ll/wxy;->j:I

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setColorFilter(I)V

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
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;->a:Lv/VImage;

    .line 31
    .line 32
    iget p3, p0, Ll/wxy;->i:I

    .line 33
    .line 34
    invoke-virtual {p2, p3}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    iget-boolean p2, p0, Ll/rxy;->d:Z

    .line 38
    .line 39
    iget-boolean p0, p0, Ll/rxy;->e:Z

    .line 40
    .line 41
    and-int/2addr p0, p2

    .line 42
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public l(I)Ll/wxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/wxy;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public m(I)Ll/wxy;
    .locals 0

    .line 1
    iput p1, p0, Ll/wxy;->j:I

    .line 2
    .line 3
    return-object p0
.end method
