.class public final Lq42;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lhq3;

.field public final f:Lvsn;


# direct methods
.method public constructor <init>(Lt42;Lhq3;Lvsn;)V
    .registers 8

    iget-object v0, p1, Lx22;->l:Lmrn;

    iget-object v1, p1, Lx22;->m:Lnrl;

    new-instance v2, Lp42;

    const/4 v3, 0x2

    invoke-direct {v2, p1, v3}, Lp42;-><init>(Lt42;B)V

    invoke-direct {p0, p1, v0, v1, v2}, Lr22;-><init>(Lx22;Lmrn;Lnrl;Lkotlin/jvm/functions/Function1;)V

    iput-object p2, p0, Lq42;->e:Lhq3;

    iput-object p3, p0, Lq42;->f:Lvsn;

    return-void
.end method


# virtual methods
.method public final g()Lvsn;
    .registers 1

    iget-object p0, p0, Lq42;->f:Lvsn;

    return-object p0
.end method

.method public final h()Ls62;
    .registers 1

    iget-object p0, p0, Lq42;->e:Lhq3;

    return-object p0
.end method
