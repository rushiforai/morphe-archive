.class public final Llxo;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Lmro;


# instance fields
.field public final o:Lbzo;

.field public final p:Ldcl;

.field public final q:Lw6j;

.field public r:Ly9p;

.field public final s:Ltmo;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lbzo;Lw6j;Ldn;Lbl;Lfio;)V
    .registers 7

    invoke-direct {p0, p4}, Lk8;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Llxo;->o:Lbzo;

    iput-object p3, p0, Llxo;->q:Lw6j;

    new-instance p2, Ldcl;

    new-instance p3, Lz4k;

    const/16 p4, 0x14

    invoke-direct {p3, p0, p4}, Lz4k;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, p1, p3, p5, p6}, Ldcl;-><init>(Landroid/content/Context;Lz4k;Lbl;Lfio;)V

    iput-object p2, p0, Llxo;->p:Ldcl;

    new-instance p1, Ltmo;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Ltmo;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Llxo;->s:Ltmo;

    new-instance p2, Lttn;

    const/16 p3, 0xf

    invoke-direct {p2, p0, p3}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Li7c;->b(Li7c;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final unregister()V
    .registers 2

    iget-object v0, p0, Llxo;->r:Ly9p;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Laoo;->unregister()V

    iget-object p0, p0, Llxo;->r:Ly9p;

    invoke-static {p0}, Lupj;->j(Landroid/view/View;)V

    :cond_c
    return-void
.end method
