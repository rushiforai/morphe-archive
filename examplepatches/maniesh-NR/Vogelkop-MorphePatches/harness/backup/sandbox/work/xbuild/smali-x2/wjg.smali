.class public final synthetic Lwjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldkj;
.implements Ldcj;


# instance fields
.field public final synthetic a:Lakg;


# direct methods
.method public synthetic constructor <init>(Lakg;)V
    .registers 2

    iput-object p1, p0, Lwjg;->a:Lakg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-object p0, p0, Lwjg;->a:Lakg;

    iget-object v0, p0, Lakg;->l:Ljava/lang/Object;

    check-cast v0, Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lakg;->o:Ljava/lang/Object;

    check-cast v1, Lsvb;

    iget-object v1, v1, Lsvb;->c:Ljava/lang/Object;

    check-cast v1, Lre7;

    iget-object v0, v0, Ltjg;->k:Lokg;

    iget-object v2, v0, Lokg;->c:Llkg;

    new-instance v3, Lmgf;

    const/4 v4, 0x6

    invoke-direct {v3, v0, v1, v4}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v0, 0x0

    invoke-interface {v2, v3, v0}, Llkg;->h(Lod3;Z)V

    iget-object v0, p0, Lakg;->q:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v0

    iget-object v0, v0, Lsf7;->a:Lrf7;

    iget-object p0, p0, Lakg;->o:Ljava/lang/Object;

    check-cast p0, Lsvb;

    iget-object p0, p0, Lsvb;->c:Ljava/lang/Object;

    check-cast p0, Lre7;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final b(Ljjm;Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lwjg;->a:Lakg;

    iget-object p0, p0, Lakg;->n:Ljava/lang/Object;

    check-cast p0, Lga6;

    if-eqz p0, :cond_f

    iget-object p0, p0, Lga6;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_f
    return-void
.end method
