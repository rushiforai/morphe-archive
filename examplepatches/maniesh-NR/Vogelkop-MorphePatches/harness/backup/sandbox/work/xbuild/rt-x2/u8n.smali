.class public final Lu8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Lcll;


# static fields
.field public static final h:[I


# instance fields
.field public final a:Ldll;

.field public final b:Landroid/view/View;

.field public c:I

.field public d:Lff2;

.field public e:Ljava/util/ArrayDeque;

.field public final f:Ljava/util/ArrayList;

.field public g:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/high16 v0, 0x1010000

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lu8n;->h:[I

    return-void
.end method

.method public constructor <init>(Ldll;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lu8n;->f:Ljava/util/ArrayList;

    iput-object p1, p0, Lu8n;->a:Ldll;

    iput-object p2, p0, Lu8n;->b:Landroid/view/View;

    invoke-virtual {p2, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iget p1, p1, Ldll;->a:I

    iput p1, p0, Lu8n;->c:I

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_1e

    invoke-virtual {p0, p2}, Lu8n;->onViewAttachedToWindow(Landroid/view/View;)V

    :cond_1e
    return-void
.end method

.method public static a(Ldll;Lzg;Lr8n;)V
    .registers 5

    iget-object p1, p1, Lzg;->b:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    const v0, 0x7f0a0c96

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-nez v1, :cond_17

    new-instance v1, Lu8n;

    invoke-direct {v1, p0, p1}, Lu8n;-><init>(Ldll;Landroid/view/View;)V

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_17
    iget-object p0, v1, Lu8n;->f:Ljava/util/ArrayList;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void
.end method

.method public static b(Ldll;Landroid/view/View;Lr8n;)V
    .registers 5

    const v0, 0x7f0a0c96

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-nez v1, :cond_13

    new-instance v1, Lu8n;

    invoke-direct {v1, p0, p1}, Lu8n;-><init>(Ldll;Landroid/view/View;)V

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_13
    iget-object p0, v1, Lu8n;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static d(ILandroid/view/View;)V
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/View;

    if-eqz v1, :cond_40

    const v1, 0x7f0a0c96

    invoke-virtual {p1, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-eqz v1, :cond_40

    iget-object v2, v1, Lu8n;->d:Lff2;

    if-eqz v2, :cond_40

    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x1

    iput v3, v2, Landroid/util/TypedValue;->type:I

    iput p0, v2, Landroid/util/TypedValue;->resourceId:I

    iput p0, v2, Landroid/util/TypedValue;->data:I

    new-instance v3, Lff2;

    sget-object v4, Lu8n;->h:[I

    invoke-direct {v3, v4, v2}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    iput-object v3, v1, Lu8n;->d:Lff2;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-static {v1, v0, p0}, Lu8n;->i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V

    invoke-static {p1}, Lu8n;->g(Landroid/view/View;)V

    :cond_40
    return-void
.end method

.method public static e(Landroid/app/Dialog;)V
    .registers 8

    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-nez v1, :cond_f

    return-void

    :cond_f
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    :goto_18
    instance-of v3, p0, Landroid/view/ContextThemeWrapper;

    const/4 v4, 0x0

    if-eqz v3, :cond_3f

    instance-of v3, p0, Landroid/app/Activity;

    if-nez v3, :cond_3f

    check-cast p0, Landroid/view/ContextThemeWrapper;

    new-instance v3, Lt8n;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "getThemeResId"

    invoke-static {p0, v6, v4, v5}, Lmzg;->j(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {v3, p0, v4}, Lt8n;-><init>(Landroid/content/ContextWrapper;I)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_18

    :cond_3f
    invoke-static {v1, v0, v4, v2}, Lu8n;->f(Ldll;Landroid/view/View;Lff2;Ljava/util/ArrayDeque;)V

    new-instance p0, Lx8n;

    invoke-direct {p0}, Lx8n;-><init>()V

    invoke-static {v1, v0, p0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public static f(Ldll;Landroid/view/View;Lff2;Ljava/util/ArrayDeque;)V
    .registers 6

    const v0, 0x7f0a0c96

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-nez v1, :cond_13

    new-instance v1, Lu8n;

    invoke-direct {v1, p0, p1}, Lu8n;-><init>(Ldll;Landroid/view/View;)V

    invoke-virtual {p1, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_13
    iput-object p2, v1, Lu8n;->d:Lff2;

    iput-object p3, v1, Lu8n;->e:Ljava/util/ArrayDeque;

    return-void
.end method

.method public static g(Landroid/view/View;)V
    .registers 4

    const v0, 0x7f0a0c96

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lu8n;

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lu8n;->c(ZZ)V

    :cond_10
    instance-of v0, p0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_26

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    :goto_1a
    if-ge v1, v0, :cond_26

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lu8n;->g(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_26
    return-void
.end method

.method public static h(Landroid/view/View;)V
    .registers 3

    const v0, 0x7f0a0c96

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-eqz v1, :cond_10

    iget-object v1, v1, Lu8n;->f:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :cond_10
    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public static i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    const p1, 0x7f1501d5

    invoke-virtual {p0, p1}, Landroid/content/Context;->setTheme(I)V

    invoke-virtual {p0, p2}, Landroid/content/Context;->setTheme(I)V

    return-void
.end method


# virtual methods
.method public final K()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lu8n;->c(ZZ)V

    return-void
.end method

.method public final c(ZZ)V
    .registers 10

    iget-object v0, p0, Lu8n;->a:Ldll;

    if-nez p1, :cond_a

    iget p1, p0, Lu8n;->c:I

    iget v1, v0, Ldll;->a:I

    if-eq p1, v1, :cond_96

    :cond_a
    iget p1, v0, Ldll;->a:I

    iput p1, p0, Lu8n;->c:I

    iget-object p1, p0, Lu8n;->d:Lff2;

    iget-object v0, p0, Lu8n;->e:Ljava/util/ArrayDeque;

    const/4 v1, 0x0

    if-eqz v0, :cond_46

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_46

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt8n;

    iget-object v3, v2, Lt8n;->a:Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v2, Lt8n;->a:Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    iget v6, v2, Lt8n;->c:I

    if-eqz v6, :cond_40

    invoke-static {v6, v3, v1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v2

    goto :goto_42

    :cond_40
    iget v2, v2, Lt8n;->b:I

    :goto_42
    invoke-static {v4, v5, v2}, Lu8n;->i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V

    goto :goto_1f

    :cond_46
    iget-object v0, p0, Lu8n;->b:Landroid/view/View;

    if-eqz p1, :cond_82

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object v3, v2

    :cond_4f
    instance-of v4, v3, Landroid/content/ContextWrapper;

    if-eqz v4, :cond_67

    instance-of v4, v3, Landroid/app/Activity;

    if-nez v4, :cond_67

    check-cast v3, Landroid/content/ContextWrapper;

    invoke-virtual {v3}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    if-eq v4, v5, :cond_4f

    :cond_67
    invoke-virtual {p1, v3}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p1

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    iget p1, p1, Landroid/util/TypedValue;->data:I

    invoke-static {v2, v3, p1}, Lu8n;->i(Landroid/content/Context;Landroid/content/res/Resources$Theme;I)V

    if-eqz p2, :cond_82

    new-instance p1, Lbxl;

    const/16 p2, 0x16

    invoke-direct {p1, p2}, Lbxl;-><init>(B)V

    const-class p2, Landroid/view/View;

    invoke-static {v0, p2, p1}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    :cond_82
    iget-object p0, p0, Lu8n;->f:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_88
    if-ge v1, p1, :cond_96

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    add-int/lit8 v1, v1, 0x1

    check-cast p2, Lr8n;

    invoke-interface {p2, v0}, Lr8n;->a(Landroid/view/View;)V

    goto :goto_88

    :cond_96
    return-void
.end method

.method public final onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    iget-boolean p1, p0, Lu8n;->g:Z

    if-eqz p1, :cond_5

    return-void

    :cond_5
    const/4 p1, 0x1

    iput-boolean p1, p0, Lu8n;->g:Z

    iget-object v0, p0, Lu8n;->a:Ldll;

    invoke-virtual {v0, p0}, Ldll;->a(Lcll;)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lu8n;->c(ZZ)V

    return-void
.end method

.method public final onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Lu8n;->a:Ldll;

    invoke-virtual {p1, p0}, Ldll;->b(Lcll;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lu8n;->g:Z

    return-void
.end method
