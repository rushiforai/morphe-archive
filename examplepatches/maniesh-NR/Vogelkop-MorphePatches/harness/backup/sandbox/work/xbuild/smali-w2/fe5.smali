.class public final Lfe5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final a:Lpde;

.field public final b:Lqdc;

.field public final c:Lk9;

.field public d:Z

.field public e:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>(Lpde;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfe5;->a:Lpde;

    new-instance p1, Lqdc;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lqdc;-><init>(Lndc;Z)V

    iput-object p1, p0, Lfe5;->b:Lqdc;

    new-instance p1, Lk9;

    const/16 v0, 0x1b

    invoke-direct {p1, p0, v0}, Lk9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lfe5;->c:Lk9;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Lfe5;->e:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lfe5;->e:Ljava/lang/Boolean;

    invoke-virtual {p0}, Lfe5;->b()V

    return-void
.end method

.method public final b()V
    .registers 4

    iget-boolean v0, p0, Lfe5;->d:Z

    iget-object v1, p0, Lfe5;->a:Lpde;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lfe5;->c:Lk9;

    invoke-virtual {v1, v0}, Lekc;->p(Lf7f;)V

    sget-object v0, Lqcc;->a:Lqcc;

    goto :goto_35

    :cond_e
    iget-object v0, p0, Lfe5;->e:Ljava/lang/Boolean;

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqcc;

    sget-object v1, Lqcc;->g:Lh58;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v2, 0x3

    if-le v0, v2, :cond_28

    move v0, v2

    :cond_28
    invoke-virtual {v1, v0}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqcc;

    goto :goto_35

    :cond_2f
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqcc;

    :goto_35
    iget-object p0, p0, Lfe5;->b:Lqdc;

    invoke-virtual {p0, v0}, Lqdc;->g(Lqcc;)V

    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lfe5;->b:Lqdc;

    return-object p0
.end method
