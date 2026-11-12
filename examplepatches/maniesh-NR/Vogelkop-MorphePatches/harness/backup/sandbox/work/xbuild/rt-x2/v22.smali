.class public final Lv22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final a:Lb2l;

.field public b:Z

.field public c:Z

.field public final d:Lpde;

.field public final e:Lqdc;

.field public final f:Lqdc;

.field public final g:Lzyk;

.field public h:Lr22;

.field public final synthetic i:Lx22;


# direct methods
.method public constructor <init>(Lx22;Lb2l;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv22;->i:Lx22;

    iput-object p2, p0, Lv22;->a:Lb2l;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lv22;->b:Z

    new-instance v0, Lpde;

    sget-object v1, Ll08;->a:Ll08;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lv22;->d:Lpde;

    new-instance v2, Lqdc;

    invoke-direct {v2, p0, p2}, Lqdc;-><init>(Lndc;Z)V

    iput-object v2, p0, Lv22;->e:Lqdc;

    iput-object v2, p0, Lv22;->f:Lqdc;

    new-instance v0, Lx2;

    const/16 v1, 0x13

    invoke-direct {v0, p1, p0, v1}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lv22;->g:Lzyk;

    new-instance v4, Ls22;

    invoke-direct {v4, p0, p2}, Ls22;-><init>(Lv22;B)V

    new-instance v5, Ls22;

    const/4 p1, 0x2

    invoke-direct {v5, p0, p1}, Ls22;-><init>(Lv22;B)V

    new-instance v6, Ls22;

    const/4 p1, 0x3

    invoke-direct {v6, p0, p1}, Ls22;-><init>(Lv22;B)V

    const/4 v7, 0x1

    const/4 v3, 0x0

    invoke-static/range {v2 .. v7}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    invoke-virtual {p0}, Lv22;->b()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 11

    iget-object v0, p0, Lv22;->h:Lr22;

    if-nez v0, :cond_65

    iget-object v0, p0, Lv22;->g:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lm02;

    new-instance v0, Lu22;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-class v2, Lv22;

    const-string v3, "active"

    const-string v4, "getActive()Z"

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lu22;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v9, v0

    new-instance v0, Lq2;

    const/4 v7, 0x5

    const/4 v1, 0x0

    const-string v4, "updateInitiallySubmittedFiles"

    const-string v5, "updateInitiallySubmittedFiles()V"

    move-object v3, v2

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    iget-object v2, p0, Lv22;->i:Lx22;

    iget-object v1, p0, Lv22;->a:Lb2l;

    move-object v3, p0

    move-object v5, v0

    move-object v0, v2

    move-object v2, v8

    move-object v4, v9

    invoke-virtual/range {v0 .. v5}, Lx22;->a(Lb2l;Lm02;Lv22;Lu22;Lq2;)Lr22;

    move-result-object v1

    iput-object v1, p0, Lv22;->h:Lr22;

    iget-object v1, p0, Lv22;->f:Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_4d

    iget-object v1, p0, Lv22;->h:Lr22;

    if-eqz v1, :cond_4d

    iput-object v1, v0, Lx22;->n:Lr22;

    invoke-virtual {v0, v1}, Lx22;->h(Lr22;)V

    :cond_4d
    iget-object v0, v0, Lx22;->o:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_53
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_65

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbx0;

    iget-object v1, v1, Lbx0;->a:Lex0;

    invoke-virtual {v1}, Lex0;->b()V

    goto :goto_53

    :cond_65
    return-void
.end method

.method public final b()V
    .registers 3

    iget-boolean v0, p0, Lv22;->b:Z

    iget-object v1, p0, Lv22;->e:Lqdc;

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lv22;->c:Z

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lv22;->i:Lx22;

    iget-object p0, p0, Lx22;->c:Ltcc;

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v0, Lqcc;->e:Lqcc;

    invoke-virtual {p0, v0}, Lqcc;->d(Lqcc;)Z

    move-result p0

    if-eqz p0, :cond_1e

    invoke-virtual {v1, v0}, Lqdc;->g(Lqcc;)V

    return-void

    :cond_1e
    sget-object p0, Lqcc;->d:Lqcc;

    invoke-virtual {v1, p0}, Lqdc;->g(Lqcc;)V

    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lv22;->f:Lqdc;

    return-object p0
.end method
