.class public abstract Ldx4;
.super Lex4;
.source "SourceFile"

# interfaces
.implements Lt6j;


# instance fields
.field public final f:Lhx5;


# direct methods
.method public constructor <init>(I)V
    .registers 5

    invoke-direct {p0, p1}, Lex4;-><init>(I)V

    new-instance p1, Lhx5;

    iget-object v0, p0, Lv6j;->b:Lhx5;

    new-instance v1, Lbo3;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0, v1}, Lhx5;-><init>(Lekc;Lkotlin/jvm/functions/Function1;)V

    iput-object p1, p0, Ldx4;->f:Lhx5;

    return-void
.end method


# virtual methods
.method public final c()Lhx5;
    .registers 1

    iget-object p0, p0, Ldx4;->f:Lhx5;

    return-object p0
.end method

.method public final g(Lr6j;)V
    .registers 3

    iget-char v0, p0, Lv6j;->a:C

    invoke-virtual {p0, p1, v0}, Ldx4;->h(Lr6j;I)Lr6j;

    move-result-object p1

    iget-object p0, p0, Lv6j;->b:Lhx5;

    invoke-virtual {p0, p1}, Lekc;->n(Ljava/lang/Object;)V

    return-void
.end method

.method public h(Lr6j;I)Lr6j;
    .registers 10

    new-instance v2, Lx6j;

    new-instance v0, Lve5;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lve5;-><init>(B)V

    const-class v1, Lrj;

    invoke-direct {v2, v1, v0}, Lx6j;-><init>(Ljava/lang/Class;Lkotlin/jvm/functions/Function2;)V

    new-instance v6, Lz3;

    const/4 v0, 0x6

    invoke-direct {v6, p0, v0}, Lz3;-><init>(Ljava/lang/Object;B)V

    const v3, 0x7f140f50

    const v4, 0x7f0804dd

    const/4 v5, 0x1

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v6}, Lr6j;->a(ILx6j;IIZLkotlin/jvm/functions/Function1;)Lr6j;

    move-result-object p0

    return-object p0
.end method
