.class public final Lkgc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxbd;


# instance fields
.field public final synthetic a:Lks3;

.field public final synthetic b:Llgc;


# direct methods
.method public constructor <init>(Lks3;Llgc;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkgc;->a:Lks3;

    iput-object p2, p0, Lkgc;->b:Llgc;

    return-void
.end method


# virtual methods
.method public final a(Ls9i;Lk73;)V
    .registers 15

    iget-object v0, p1, Ls9i;->c:Ljava/lang/Object;

    check-cast v0, Ljc9;

    check-cast p2, Lyma;

    iget-object v1, p0, Lkgc;->b:Llgc;

    iget-object v2, v1, Llgc;->a:Lo5h;

    iget-object v3, p2, Lyma;->g:Ljava/lang/String;

    iget-object p0, p0, Lkgc;->a:Lks3;

    iget-object v4, p0, Lks3;->e:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    iget-object p0, p0, Lks3;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_4f

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result p1

    const-string v1, ""

    :cond_23
    :goto_23
    iget-object p2, p2, Lk73;->f:Ljava/lang/Object;

    check-cast p2, Lk73;

    if-eqz p2, :cond_46

    instance-of v3, p2, Lyma;

    if-eqz v3, :cond_38

    move-object v3, p2

    check-cast v3, Lyma;

    iget-object v3, v3, Lyma;->g:Ljava/lang/String;

    invoke-static {v3, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_46

    :cond_38
    instance-of v3, p2, Lnel;

    if-eqz v3, :cond_23

    move-object v3, p2

    check-cast v3, Lnel;

    iget-object v3, v3, Lnel;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_23

    :cond_46
    new-instance p0, Lmgc;

    invoke-direct {p0, p1, v1}, Lmgc;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, v2, p0}, Ljc9;->b(Lo5h;Ljava/lang/Object;)V

    return-void

    :cond_4f
    iget-object p2, p2, Lyma;->g:Ljava/lang/String;

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8c

    iget-object p0, v0, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {p0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmgc;

    if-eqz p0, :cond_8c

    iget-object p2, v0, Ljc9;->a:Ljava/util/HashMap;

    invoke-virtual {p2, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p2, p1, Ls9i;->d:Ljava/lang/Object;

    move-object v7, p2

    check-cast v7, Lcxj;

    iget v10, p0, Lmgc;->a:I

    invoke-virtual {p1}, Ls9i;->a0()I

    move-result v11

    iget-object v6, v1, Llgc;->b:Lks3;

    iget-object p1, v6, Lks3;->i:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    const/4 p2, 0x0

    if-eqz p1, :cond_86

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_84

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p2

    :cond_84
    check-cast p2, Ljava/lang/String;

    :cond_86
    move-object v8, p2

    iget-object v9, p0, Lmgc;->b:Ljava/lang/String;

    invoke-virtual/range {v6 .. v11}, Lks3;->K(Lcxj;Ljava/lang/String;Ljava/lang/String;II)V

    :cond_8c
    return-void
.end method
