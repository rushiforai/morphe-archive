.class public final Lpkc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lqkc;


# direct methods
.method public constructor <init>(Lqkc;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpkc;->a:Lqkc;

    return-void
.end method


# virtual methods
.method public final a(Ltmc;)V
    .registers 7

    iget-object p0, p0, Lpkc;->a:Lqkc;

    iget-object p0, p0, Lqkc;->b:Ljs6;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-boolean v0, p1, Ltmc;->e:Z

    if-eqz v0, :cond_51

    iget-object v0, p1, Ltmc;->d:Ljava/lang/String;

    if-eqz v0, :cond_51

    const/4 v1, 0x1

    iput-boolean v1, p0, Ljs6;->b:Z

    sget-object v2, Llqm;->x:Llqm;

    const/4 v3, 0x0

    invoke-static {v0, v2, v3}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    const/4 v2, 0x2

    iput v2, v0, Lvx3;->b:I

    invoke-static {v0, v1, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    iget-object v0, p1, Ltmc;->a:Ljava/lang/String;

    if-eqz v0, :cond_51

    iget-object p1, p1, Ltmc;->b:Ljava/lang/String;

    if-eqz p1, :cond_51

    iget-object p0, p0, Ljs6;->g:Ljava/lang/Object;

    check-cast p0, Lxoc;

    iget-object p0, p0, Lxoc;->a:Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_51

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->e()Lhi0;

    move-result-object v1

    invoke-virtual {v1}, Lhi0;->a()Lvg0;

    move-result-object v1

    new-instance v4, Le5f;

    invoke-direct {v4, v0, p1, v3}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    const-string p1, "start_page"

    invoke-virtual {v1, p1, v4}, Lvg0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_51
    return-void
.end method
