.class public final synthetic Lgif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgif;->a:Lcom/opera/android/OperaApplication;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Landroid/app/ApplicationStartInfo;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lgif;->a:Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    invoke-virtual {p1}, Landroid/app/ApplicationStartInfo;->wasForceStopped()Z

    move-result p1

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_15

    return-void

    :cond_15
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v2}, Lck0;->c()Ltb0;

    move-result-object v0

    iget-object v0, v0, Ltb0;->b:Lq56;

    const/16 v2, 0x19

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void
.end method
