.class public final Lf7d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Le4i;

.field public final d:Lumi;

.field public final e:Lx5f;

.field public final f:Lxb;

.field public final g:Ldb;

.field public final h:Ljtg;

.field public final i:Lslk;

.field public final j:Lyug;

.field public final k:Lpt3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Le4i;Lumi;Lx5f;Lxb;Ldb;Ljtg;Lslk;Lyug;Lpt3;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lf7d;->b:Lgjm;

    iput-object p3, p0, Lf7d;->c:Le4i;

    iput-object p4, p0, Lf7d;->d:Lumi;

    iput-object p5, p0, Lf7d;->e:Lx5f;

    iput-object p6, p0, Lf7d;->f:Lxb;

    iput-object p7, p0, Lf7d;->g:Ldb;

    iput-object p8, p0, Lf7d;->h:Ljtg;

    iput-object p9, p0, Lf7d;->i:Lslk;

    iput-object p10, p0, Lf7d;->j:Lyug;

    iput-object p11, p0, Lf7d;->k:Lpt3;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;)V
    .registers 11

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v2, Lwzg;

    const/4 v1, 0x4

    const/4 v3, 0x0

    invoke-direct {v2, v3, p1, v1}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lzhj;

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    const/4 v4, 0x2

    const/16 v5, 0x1003

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v1 .. v8}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v1

    iget-object v2, v1, Lgom;->a:Llom;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_16

    const/4 v4, 0x3

    if-ne v2, v4, :cond_2d

    :cond_16
    iget-object v2, v1, Lgom;->b:Lkom;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    iget-object p0, p0, Lf7d;->e:Lx5f;

    if-eqz v2, :cond_28

    if-ne v2, v3, :cond_2d

    sget-object v2, Lht0;->d:Lht0;

    invoke-virtual {p0, v2}, Lx5f;->e0(Lht0;)V

    goto :goto_2d

    :cond_28
    sget-object v2, Lht0;->c:Lht0;

    invoke-virtual {p0, v2}, Lx5f;->e0(Lht0;)V

    :cond_2d
    :goto_2d
    invoke-static {v0, v1}, Lmom;->b(Lt5d;Lgom;)V

    return-void
.end method
