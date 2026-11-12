.class public final La22;
.super Lr22;
.source "SourceFile"


# instance fields
.field public final e:Lxy3;

.field public final f:Lvsn;

.field public final g:I


# direct methods
.method public constructor <init>(Lb22;Lxy3;Lvsn;I)V
    .registers 9

    iget-object v0, p1, Lx22;->l:Lmrn;

    iget-object v1, p1, Lx22;->m:Lnrl;

    new-instance v2, Ly12;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Ly12;-><init>(Lb22;B)V

    invoke-direct {p0, p1, v0, v1, v2}, Lr22;-><init>(Lx22;Lmrn;Lnrl;Lkotlin/jvm/functions/Function1;)V

    iput-object p2, p0, La22;->e:Lxy3;

    iput-object p3, p0, La22;->f:Lvsn;

    iput p4, p0, La22;->g:I

    return-void
.end method


# virtual methods
.method public final g()Lvsn;
    .registers 1

    iget-object p0, p0, La22;->f:Lvsn;

    return-object p0
.end method

.method public final h()Ls62;
    .registers 1

    iget-object p0, p0, La22;->e:Lxy3;

    return-object p0
.end method
