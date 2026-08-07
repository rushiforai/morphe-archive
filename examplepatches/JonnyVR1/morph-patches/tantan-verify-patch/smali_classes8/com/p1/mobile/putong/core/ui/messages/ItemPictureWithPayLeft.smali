.class public Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;

.field public b:Lv/AutoVDraweeView;

.field public c:Lv/AutoVDraweeView;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VCheckBox;

.field public m:Lv/VText;

.field public final n:Ll/zdq;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/zdq;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/zdq;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

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
    new-instance p1, Ll/zdq;

    invoke-direct {p1}, Ll/zdq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

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
    new-instance p1, Ll/zdq;

    invoke-direct {p1}, Ll/zdq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 17
    new-instance p1, Ll/zdq;

    invoke-direct {p1}, Ll/zdq;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zdq;->x(Lcom/p1/mobile/putong/core/data/Message;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

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
    invoke-static {p0, p1}, Ll/ceq;->a(Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/zdq;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Landroid/view/View;->onFinishInflate()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v0}, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->a(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    const/high16 v1, 0x41000000    # 8.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v1, v1

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-static {v2, v1, v3, v3}, Lcom/facebook/drawee/generic/RoundingParams;->b(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, -0x1

    .line 27
    invoke-virtual {v1, v2}, Lcom/facebook/drawee/generic/RoundingParams;->t(I)Lcom/facebook/drawee/generic/RoundingParams;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->b:Lv/AutoVDraweeView;

    .line 32
    .line 33
    invoke-virtual {v2}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    check-cast v2, Ll/wlj;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 40
    .line 41
    .line 42
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    .line 43
    .line 44
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;

    .line 45
    .line 46
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->b:Lv/AutoVDraweeView;

    .line 47
    .line 48
    iget-object v6, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->c:Lv/AutoVDraweeView;

    .line 49
    .line 50
    iget-object v7, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->e:Lv/VText;

    .line 51
    .line 52
    iget-object v8, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->j:Lv/VText;

    .line 53
    .line 54
    iget-object v9, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->k:Lv/VText;

    .line 55
    .line 56
    iget-object v10, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->d:Landroid/widget/LinearLayout;

    .line 57
    .line 58
    invoke-virtual/range {v3 .. v10}, Ll/udq;->l(Landroid/view/ViewGroup;Lv/AutoVDraweeView;Lv/AutoVDraweeView;Lv/VText;Lv/VText;Lv/VText;Landroid/widget/LinearLayout;)V

    .line 59
    .line 60
    .line 61
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->n:Ll/zdq;

    .line 62
    .line 63
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->f:Landroid/widget/RelativeLayout;

    .line 64
    .line 65
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->g:Lv/VImage;

    .line 66
    .line 67
    iget-object v14, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->h:Lv/VText;

    .line 68
    .line 69
    iget-object v15, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->m:Lv/VText;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/ItemPictureWithPayLeft;->l:Lv/VCheckBox;

    .line 72
    .line 73
    move-object/from16 v16, v0

    .line 74
    .line 75
    invoke-virtual/range {v11 .. v16}, Ll/zdq;->M(Landroid/widget/RelativeLayout;Lv/VImage;Lv/VText;Lv/VText;Lv/VCheckBox;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
