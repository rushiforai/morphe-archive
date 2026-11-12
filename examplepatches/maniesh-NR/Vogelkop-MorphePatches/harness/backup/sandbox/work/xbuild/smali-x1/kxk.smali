.class public final Lkxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhxk;


# instance fields
.field public final a:Lji;

.field public final b:Lwv1;

.field public final c:Lj4c;

.field public final d:Lwv1;

.field public final e:Lcom/opera/android/BrowserActivity;

.field public final f:Landroidx/fragment/app/w;

.field public final g:Ldu3;


# direct methods
.method public constructor <init>(Lji;Lwv1;Lj4c;Lwv1;Lcom/opera/android/BrowserActivity;Landroidx/fragment/app/w;Ldu3;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkxk;->a:Lji;

    iput-object p2, p0, Lkxk;->b:Lwv1;

    iput-object p3, p0, Lkxk;->c:Lj4c;

    iput-object p4, p0, Lkxk;->d:Lwv1;

    iput-object p5, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iput-object p6, p0, Lkxk;->f:Landroidx/fragment/app/w;

    iput-object p7, p0, Lkxk;->g:Ldu3;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 11

    iget-object v0, p0, Lkxk;->f:Landroidx/fragment/app/w;

    const-string v1, "SyncSettingsFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_e

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    :cond_e
    invoke-static {p1}, Ls16;->n([I)Landroid/os/Bundle;

    move-result-object p1

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x4

    const/4 v3, 0x0

    const-class v4, Luxk;

    invoke-direct {v2, v3, v4, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz p1, :cond_21

    move-object v3, p1

    :cond_21
    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final b(II)V
    .registers 3

    iget-object p0, p0, Lkxk;->g:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqim;

    iget-object p0, p0, Lqim;->e:Lysj;

    invoke-static {p1, p2, p0}, Lam2;->i(IILysj;)Lglj;

    move-result-object p1

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
