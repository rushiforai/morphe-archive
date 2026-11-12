.class public final Lose;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;
.implements Lb6j;
.implements Lf7f;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lwnm;

.field public c:Z

.field public d:Lc6j;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lose;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object p1, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p1, p1, Lxv1;->j0:Lj4c;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldse;

    iget-object p1, p1, Ldse;->a:Lwnm;

    iput-object p1, p0, Lose;->b:Lwnm;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lose;->e:Z

    if-nez v0, :cond_19

    iget-boolean v0, p0, Lose;->f:Z

    if-eqz v0, :cond_19

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, p0, Lose;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v0

    invoke-virtual {v0, p0}, Lfqe;->a(Lq8j;)V

    :cond_19
    return-void
.end method

.method public final b()V
    .registers 3

    iget-boolean v0, p0, Lose;->e:Z

    if-nez v0, :cond_18

    iget-object v0, p0, Lose;->d:Lc6j;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    iget-object v0, v0, Lc6j;->b:Ljava/lang/Object;

    check-cast v0, Lnre;

    goto :goto_f

    :cond_e
    move-object v0, v1

    :goto_f
    if-eqz v0, :cond_13

    iget-object v1, v0, Lnre;->b:Ljava/net/URL;

    :cond_13
    if-eqz v1, :cond_18

    const/4 v0, 0x1

    iput-boolean v0, p0, Lose;->c:Z

    :cond_18
    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ll1c;

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Lcse;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_17

    if-eq p1, v0, :cond_f

    const/4 v1, 0x2

    if-eq p1, v1, :cond_6c

    goto :goto_1d

    :cond_f
    iget-boolean p1, p0, Lose;->f:Z

    if-eqz p1, :cond_6c

    const/4 p1, 0x0

    iput-boolean p1, p0, Lose;->f:Z

    goto :goto_1d

    :cond_17
    iget-boolean p1, p0, Lose;->f:Z

    if-nez p1, :cond_6c

    iput-boolean v0, p0, Lose;->f:Z

    :goto_1d
    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lose;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-boolean v2, p0, Lose;->f:Z

    if-eqz v2, :cond_60

    iget-boolean v3, p0, Lose;->e:Z

    if-nez v3, :cond_58

    if-eqz v2, :cond_58

    iget-object v2, p0, Lose;->d:Lc6j;

    if-nez v2, :cond_58

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    invoke-virtual {p1}, Lfqe;->c()Luqe;

    move-result-object p1

    invoke-virtual {p1}, Luqe;->h()Lc6j;

    move-result-object p1

    iput-object p1, p0, Lose;->d:Lc6j;

    iget-boolean v2, p0, Lose;->c:Z

    if-nez v2, :cond_53

    iget-object v2, p1, Lc6j;->b:Ljava/lang/Object;

    check-cast v2, Lnre;

    iput-boolean v0, p0, Lose;->c:Z

    :cond_53
    iget-object p1, p1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_58
    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    invoke-virtual {p1, p0}, Lfqe;->a(Lq8j;)V

    return-void

    :cond_60
    iget-object p1, p0, Lose;->d:Lc6j;

    if-eqz p1, :cond_6c

    iget-object p1, p1, Lc6j;->c:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lose;->d:Lc6j;

    :cond_6c
    return-void
.end method
