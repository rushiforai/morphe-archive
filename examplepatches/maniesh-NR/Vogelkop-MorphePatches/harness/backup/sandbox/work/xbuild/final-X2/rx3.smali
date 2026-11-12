.class public final Lrx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final a:Ljava/util/HashSet;

.field public final synthetic b:Lcom/opera/android/browser/BrowserFragment;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/BrowserFragment;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrx3;->b:Lcom/opera/android/browser/BrowserFragment;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lrx3;->a:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 9

    iget-object p1, p0, Lrx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object p3, p1, Lcom/opera/android/browser/BrowserFragment;->k:Laal;

    iput-object p2, p3, Laal;->e:Lb2l;

    iget-object p3, p3, Lr22;->c:Ljava/lang/Object;

    check-cast p3, Lqim;

    iput-object p2, p3, Lqim;->o:Lb2l;

    iget-object v0, p3, Lqim;->n:Lu7k;

    sget-object v1, Lhjm;->b:Lhjm;

    if-eqz v0, :cond_1c

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Lz9l;

    invoke-virtual {v0, v1}, Lz9l;->finish(Lhjm;)V

    const/4 v0, 0x0

    iput-object v0, p3, Lqim;->n:Lu7k;

    :cond_1c
    if-eqz p2, :cond_7c

    move-object v0, p2

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->l:Llqm;

    sget-object v2, Llqm;->i:Llqm;

    if-eq v0, v2, :cond_2b

    invoke-virtual {p3}, Lqim;->a()V

    goto :goto_7c

    :cond_2b
    iget-object v0, p3, Lqim;->h:Lp77;

    invoke-virtual {v0}, Lp77;->a()Lb87;

    move-result-object v2

    if-eqz v2, :cond_52

    iget-object v0, v0, Lp77;->b:Li7f;

    new-instance v3, Lg7f;

    invoke-direct {v3, v0}, Lg7f;-><init>(Li7f;)V

    :cond_3a
    :goto_3a
    invoke-virtual {v3}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-virtual {v3}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm9l;

    iget-object v4, v0, Lm9l;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-virtual {v0}, Lm9l;->a()V

    goto :goto_3a

    :cond_52
    iget-object v0, p3, Lqim;->i:Lqie;

    invoke-virtual {v0}, Lqie;->h()V

    iget-object v0, p3, Lqim;->j:Lisj;

    invoke-virtual {v0}, Lisj;->I()V

    iget-object v0, p3, Lqim;->l:Luwf;

    if-eqz v0, :cond_6b

    iget-object v0, v0, Luwf;->a:Landroid/util/Pair;

    if-eqz v0, :cond_6b

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Lq2f;

    invoke-virtual {v0, v1}, Lq2f;->f(Lhjm;)V

    :cond_6b
    iget-object p3, p3, Lqim;->m:Lz8b;

    if-eqz p3, :cond_7c

    iget-object p3, p3, Lz8b;->a:Ljava/lang/Object;

    check-cast p3, Landroid/util/Pair;

    if-eqz p3, :cond_7c

    iget-object p3, p3, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p3, Llz3;

    invoke-virtual {p3, v1}, Llz3;->b(Lhjm;)Z

    :cond_7c
    :goto_7c
    iget-object p0, p0, Lrx3;->a:Ljava/util/HashSet;

    invoke-virtual {p0, p2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_89

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/BrowserFragment;->h0(Z)V

    return-void

    :cond_89
    iget-object p0, p1, Lcom/opera/android/browser/BrowserFragment;->r:Lami;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p2, :cond_92

    const/4 p0, 0x3

    goto :goto_a8

    :cond_92
    move-object p0, p2

    check-cast p0, Ld7l;

    iget-object p3, p0, Ld7l;->j:Le7l;

    invoke-interface {p3}, Lb9l;->c0()Z

    move-result p3

    if-nez p3, :cond_a7

    iget-object p0, p0, Ld7l;->e:Lw6j;

    iget-object p0, p0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lknf;

    if-eqz p0, :cond_a7

    const/4 p0, 0x2

    goto :goto_a8

    :cond_a7
    const/4 p0, 0x1

    :goto_a8
    invoke-virtual {p1, p2, p0}, Lcom/opera/android/browser/BrowserFragment;->j0(Lb2l;I)V

    return-void
.end method

.method public final L(Lb2l;Z)V
    .registers 3

    iget-object p0, p0, Lrx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->k:Laal;

    invoke-virtual {p0, p1}, Laal;->T(Lb2l;)V

    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget-object p0, p0, Lrx3;->a:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method
