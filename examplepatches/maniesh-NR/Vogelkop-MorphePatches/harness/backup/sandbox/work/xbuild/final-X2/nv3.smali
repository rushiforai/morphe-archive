.class public final Lnv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lpvk;


# instance fields
.field public final a:Lh1b;

.field public b:Lpvk;

.field public final synthetic c:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ljava/util/ArrayList;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnv3;->c:Lcom/opera/android/BrowserActivity;

    invoke-static {p2}, Lh1b;->r(Ljava/lang/Iterable;)Lh1b;

    move-result-object p1

    iput-object p1, p0, Lnv3;->a:Lh1b;

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 4

    iget-object v0, p0, Lnv3;->c:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v0, :cond_7

    const/4 v0, 0x0

    :cond_7
    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v0

    if-nez v0, :cond_3c

    iget-object p0, p0, Lnv3;->a:Lh1b;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_18
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_30

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lpvk;

    invoke-interface {v1, p1}, Lpvk;->a(I)Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-static {v0}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object p0

    goto :goto_32

    :cond_30
    sget-object p0, Lh3;->a:Lh3;

    :goto_32
    invoke-virtual {p0}, Lorf;->j()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lpvk;

    if-eqz p0, :cond_3c

    const/4 p0, 0x1

    return p0

    :cond_3c
    const/4 p0, 0x0

    return p0
.end method

.method public final b(IIIIII)V
    .registers 7

    iget-object p0, p0, Lnv3;->b:Lpvk;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-interface/range {p0 .. p6}, Lpvk;->b(IIIIII)V

    return-void
.end method

.method public final c(IIIIII)V
    .registers 7

    iget-object p0, p0, Lnv3;->b:Lpvk;

    if-nez p0, :cond_5

    return-void

    :cond_5
    invoke-interface/range {p0 .. p6}, Lpvk;->c(IIIIII)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Lnv3;->b:Lpvk;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-interface {v0}, Lpvk;->d()V

    const/4 v0, 0x0

    iput-object v0, p0, Lnv3;->b:Lpvk;

    return-void
.end method

.method public final e(III)V
    .registers 7

    iget-object v0, p0, Lnv3;->a:Lh1b;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lpvk;

    invoke-interface {v2, p1}, Lpvk;->a(I)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-static {v1}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object v0

    goto :goto_23

    :cond_21
    sget-object v0, Lh3;->a:Lh3;

    :goto_23
    invoke-virtual {v0}, Lorf;->j()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lpvk;

    iput-object v0, p0, Lnv3;->b:Lpvk;

    if-nez v0, :cond_2e

    return-void

    :cond_2e
    invoke-interface {v0, p1, p2, p3}, Lpvk;->e(III)V

    return-void
.end method
