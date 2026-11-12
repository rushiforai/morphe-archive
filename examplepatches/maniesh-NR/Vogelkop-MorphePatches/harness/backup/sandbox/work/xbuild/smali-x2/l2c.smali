.class public final Ll2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# static fields
.field public static volatile j:Lc2c;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lk2c;

.field public c:Lk2c;

.field public final d:Landroid/view/View;

.field public e:I

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lpza;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lpza;-><init>(B)V

    sput-object v0, Ll2c;->j:Lc2c;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Ll2c;->f:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Ll2c;->a:Landroid/content/Context;

    iput-object p1, p0, Ll2c;->d:Landroid/view/View;

    iput-object p2, p0, Ll2c;->b:Lk2c;

    invoke-virtual {p1, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object p2, Lmhh;->c:[I

    invoke-virtual {v0, p3, p2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 p3, 0x4

    const/4 v0, 0x2

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p3

    iput p3, p0, Ll2c;->e:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p1}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p2

    if-eqz p2, :cond_2d

    invoke-virtual {p0, p1}, Ll2c;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_2d
    return-void
.end method

.method public static a(Landroid/content/Context;)I
    .registers 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_10

    return v0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final b()Z
    .registers 2

    invoke-virtual {p0}, Ll2c;->c()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_8

    return v0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final c()I
    .registers 8

    iget-boolean v0, p0, Ll2c;->h:Z

    if-eqz v0, :cond_7

    iget p0, p0, Ll2c;->f:I

    return p0

    :cond_7
    iget v0, p0, Ll2c;->e:I

    const/4 v1, 0x2

    iget-object v2, p0, Ll2c;->b:Lk2c;

    const/4 v3, 0x1

    iget-object v4, p0, Ll2c;->a:Landroid/content/Context;

    if-ne v0, v1, :cond_67

    iget-object v0, p0, Ll2c;->c:Lk2c;

    const/4 v1, 0x0

    sget-object v5, Lk2c;->xp:Lj2c;

    if-nez v0, :cond_36

    iget-object v0, p0, Ll2c;->d:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    :goto_1e
    if-eqz v0, :cond_2c

    instance-of v6, v0, Lk2c;

    if-eqz v6, :cond_27

    check-cast v0, Lk2c;

    goto :goto_2d

    :cond_27
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_1e

    :cond_2c
    move-object v0, v1

    :goto_2d
    if-nez v0, :cond_34

    iget-boolean v6, p0, Ll2c;->i:Z

    if-eqz v6, :cond_34

    move-object v0, v5

    :cond_34
    iput-object v0, p0, Ll2c;->c:Lk2c;

    :cond_36
    if-eq v0, v5, :cond_39

    move-object v1, v0

    :cond_39
    if-nez v1, :cond_5e

    iget-boolean v0, p0, Ll2c;->i:Z

    if-nez v0, :cond_59

    iget-boolean v0, p0, Ll2c;->g:Z

    if-nez v0, :cond_56

    invoke-static {v4}, Ll2c;->a(Landroid/content/Context;)I

    move-result v0

    iget-boolean v1, p0, Ll2c;->g:Z

    if-eqz v1, :cond_4f

    iget v1, p0, Ll2c;->f:I

    if-eq v1, v0, :cond_56

    :cond_4f
    iput-boolean v3, p0, Ll2c;->g:Z

    iput v0, p0, Ll2c;->f:I

    invoke-interface {v2, v0}, Lk2c;->i(I)V

    :cond_56
    iget p0, p0, Ll2c;->f:I

    return p0

    :cond_59
    invoke-static {v4}, Ll2c;->a(Landroid/content/Context;)I

    move-result v0

    goto :goto_6e

    :cond_5e
    invoke-interface {v1}, Lk2c;->b()Ll2c;

    move-result-object v0

    invoke-virtual {v0}, Ll2c;->c()I

    move-result v0

    goto :goto_6e

    :cond_67
    const/4 v1, 0x3

    if-ne v0, v1, :cond_6e

    invoke-static {v4}, Ll2c;->a(Landroid/content/Context;)I

    move-result v0

    :cond_6e
    :goto_6e
    iput-boolean v3, p0, Ll2c;->h:Z

    iget-boolean v1, p0, Ll2c;->g:Z

    if-eqz v1, :cond_79

    iget v1, p0, Ll2c;->f:I

    if-ne v1, v0, :cond_79

    return v0

    :cond_79
    iput-boolean v3, p0, Ll2c;->g:Z

    iput v0, p0, Ll2c;->f:I

    invoke-interface {v2, v0}, Lk2c;->i(I)V

    return v0
.end method

.method public final d(I)V
    .registers 3

    iget v0, p0, Ll2c;->e:I

    if-eq p1, v0, :cond_a

    iput p1, p0, Ll2c;->e:I

    iget-boolean p1, p0, Ll2c;->h:Z

    if-nez p1, :cond_b

    :cond_a
    return-void

    :cond_b
    const/4 p1, 0x0

    iput-boolean p1, p0, Ll2c;->h:Z

    invoke-virtual {p0}, Ll2c;->c()I

    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Ll2c;->i:Z

    invoke-virtual {p0}, Ll2c;->c()I

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    iget p1, p0, Ll2c;->e:I

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-ne p1, v0, :cond_8

    iput-boolean v1, p0, Ll2c;->h:Z

    :cond_8
    const/4 p1, 0x0

    iput-object p1, p0, Ll2c;->c:Lk2c;

    iput-boolean v1, p0, Ll2c;->i:Z

    return-void
.end method
