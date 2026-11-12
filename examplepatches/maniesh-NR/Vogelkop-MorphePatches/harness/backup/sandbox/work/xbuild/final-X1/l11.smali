.class public final Ll11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhxj;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:B

.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Lk11;


# direct methods
.method public synthetic constructor <init>(IIILandroid/view/View;)V
    .registers 12

    const/4 v5, 0x0

    .line 17
    sget-object v6, Lk11;->a:Lk11;

    const/4 v4, 0x0

    move-object v0, p0

    move v2, p1

    move v3, p2

    move-object v1, p4

    .line 18
    invoke-direct/range {v0 .. v6}, Ll11;-><init>(Landroid/view/View;IIIZLk11;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .registers 5

    const/16 v0, 0x38

    .line 16
    invoke-direct {p0, p2, p3, v0, p1}, Ll11;-><init>(IIILandroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;IIIZLk11;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll11;->a:Landroid/view/View;

    iput-byte p2, p0, Ll11;->b:B

    iput p3, p0, Ll11;->c:I

    iput p4, p0, Ll11;->d:I

    iput-boolean p5, p0, Ll11;->e:Z

    iput-object p6, p0, Ll11;->f:Lk11;

    return-void
.end method


# virtual methods
.method public final c()Lixj;
    .registers 11

    new-instance v0, Lixj;

    iget-object v1, p0, Ll11;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    invoke-static {v1}, Lcs5;->W(Landroid/view/View;)Z

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_28

    invoke-static {v1}, Lq9n;->x(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_28

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v4}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v6

    if-nez v6, :cond_29

    :cond_28
    move-object v4, v5

    :cond_29
    if-eqz v4, :cond_66

    iget-object v6, p0, Ll11;->f:Lk11;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    iget v7, p0, Ll11;->c:I

    if-eqz v6, :cond_53

    const/4 v8, 0x1

    if-eq v6, v8, :cond_4b

    const/4 v8, 0x2

    if-ne v6, v8, :cond_47

    if-eqz v3, :cond_42

    iget v3, v4, Landroid/graphics/Rect;->right:I

    :goto_3f
    add-int/lit8 v6, v3, -0x1

    goto :goto_5a

    :cond_42
    iget v6, v4, Landroid/graphics/Rect;->left:I

    :goto_44
    add-int/lit8 v3, v6, 0x1

    goto :goto_5a

    :cond_47
    invoke-static {}, Lh9o;->p()V

    return-object v5

    :cond_4b
    if-eqz v3, :cond_50

    iget v6, v4, Landroid/graphics/Rect;->left:I

    goto :goto_44

    :cond_50
    iget v3, v4, Landroid/graphics/Rect;->right:I

    goto :goto_3f

    :cond_53
    iget v3, v4, Landroid/graphics/Rect;->left:I

    add-int v6, v3, v7

    iget v3, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v7

    :goto_5a
    new-instance v8, Landroid/graphics/Rect;

    iget v9, v4, Landroid/graphics/Rect;->top:I

    add-int/2addr v9, v7

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, v7

    invoke-direct {v8, v6, v9, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_67

    :cond_66
    move-object v8, v5

    :goto_67
    invoke-static {v1}, Lcs5;->W(Landroid/view/View;)Z

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_83

    invoke-static {v1}, Lq9n;->x(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_83

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v3}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_83

    move-object v5, v3

    :cond_83
    iget v3, p0, Ll11;->d:I

    const/4 v4, 0x0

    move v1, v2

    move-object v2, v8

    move-object v8, v5

    iget-byte v5, p0, Ll11;->b:B

    iget-boolean v7, p0, Ll11;->e:Z

    invoke-direct/range {v0 .. v8}, Lixj;-><init>(ILandroid/graphics/Rect;IIIZZLandroid/graphics/Rect;)V

    return-object v0
.end method
