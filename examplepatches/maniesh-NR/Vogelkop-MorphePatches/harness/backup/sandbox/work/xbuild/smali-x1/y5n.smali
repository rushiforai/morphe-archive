.class public final synthetic Ly5n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:Lz5n;

.field public final synthetic b:Lff2;

.field public final synthetic c:Lff2;

.field public final synthetic d:Lff2;

.field public final synthetic e:Lff2;

.field public final synthetic f:Lff2;

.field public final synthetic g:Lff2;

.field public final synthetic h:Lff2;


# direct methods
.method public synthetic constructor <init>(Lz5n;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly5n;->a:Lz5n;

    iput-object p2, p0, Ly5n;->b:Lff2;

    iput-object p3, p0, Ly5n;->c:Lff2;

    iput-object p4, p0, Ly5n;->d:Lff2;

    iput-object p5, p0, Ly5n;->e:Lff2;

    iput-object p6, p0, Ly5n;->f:Lff2;

    iput-object p7, p0, Ly5n;->g:Lff2;

    iput-object p8, p0, Ly5n;->h:Lff2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Ly5n;->a:Lz5n;

    iget-object v1, p0, Ly5n;->b:Lff2;

    if-eqz v1, :cond_18

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->q:Landroid/content/res/ColorStateList;

    :cond_18
    iget-object v1, p0, Ly5n;->c:Lff2;

    if-eqz v1, :cond_2e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->r:Landroid/content/res/ColorStateList;

    :cond_2e
    iget-object v1, p0, Ly5n;->d:Lff2;

    if-eqz v1, :cond_4a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->e:Landroid/content/res/ColorStateList;

    iput-object v1, v0, Lz5n;->d:Landroid/content/res/ColorStateList;

    iput-object v1, v0, Lz5n;->c:Landroid/content/res/ColorStateList;

    iput-object v1, v0, Lz5n;->b:Landroid/content/res/ColorStateList;

    :cond_4a
    iget-object v1, p0, Ly5n;->e:Lff2;

    if-eqz v1, :cond_60

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->b:Landroid/content/res/ColorStateList;

    :cond_60
    iget-object v1, p0, Ly5n;->f:Lff2;

    if-eqz v1, :cond_76

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->c:Landroid/content/res/ColorStateList;

    :cond_76
    iget-object v1, p0, Ly5n;->g:Lff2;

    if-eqz v1, :cond_8c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Lz5n;->d:Landroid/content/res/ColorStateList;

    :cond_8c
    iget-object p0, p0, Ly5n;->h:Lff2;

    if-eqz p0, :cond_a2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    iput-object p0, v0, Lz5n;->e:Landroid/content/res/ColorStateList;

    :cond_a2
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method
