.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public final h:Ll/udq;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/udq;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/udq;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 12
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 13
    new-instance p1, Ll/udq;

    invoke-direct {p1}, Ll/udq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 14
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 15
    new-instance p1, Ll/udq;

    invoke-direct {p1}, Ll/udq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 17
    new-instance p1, Ll/udq;

    invoke-direct {p1}, Ll/udq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/udq;->x(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/udq;->u()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aeq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/udq;->n(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/udq;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 10

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/high16 v0, 0x41000000    # 8.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    int-to-float v0, v0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v1, v0, v2, v2}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v1, -0x1

    .line 25
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/generic/RoundingParams;->t(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->b:Lv/AutoVDraweeView;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ll/wlj;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->h:Ll/udq;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;

    .line 43
    .line 44
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->b:Lv/AutoVDraweeView;

    .line 45
    .line 46
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->c:Lv/AutoVDraweeView;

    .line 47
    .line 48
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->e:Lv/VText;

    .line 49
    .line 50
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->f:Lv/VText;

    .line 51
    .line 52
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->g:Lv/VText;

    .line 53
    .line 54
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureTextLeft;->d:Landroid/widget/LinearLayout;

    .line 55
    .line 56
    invoke-virtual/range {v2 .. v9}, Ll/udq;->l(Landroid/view/ViewGroup;Lv/AutoVDraweeView;Lv/AutoVDraweeView;Lv/VText;Lv/VText;Lv/VText;Landroid/widget/LinearLayout;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method
