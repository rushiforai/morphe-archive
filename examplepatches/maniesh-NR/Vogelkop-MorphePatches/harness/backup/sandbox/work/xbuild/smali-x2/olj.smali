.class public final Lolj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final a:Lm43;

.field public final b:Lr31;

.field public final c:Lsn3;

.field public final d:Ltji;

.field public e:Z


# direct methods
.method public constructor <init>(Lbz;Lm43;Lr31;Lsn3;Ltji;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lolj;->a:Lm43;

    iput-object p3, p0, Lolj;->b:Lr31;

    iput-object p4, p0, Lolj;->c:Lsn3;

    iput-object p5, p0, Lolj;->d:Ltji;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 5

    iget-object v0, p0, Lolj;->a:Lm43;

    invoke-virtual {v0}, Lm43;->b()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    new-instance v1, Lq01;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lq01;-><init>(Lolj;Lyz;Z)V

    iget-object p0, p0, Lolj;->b:Lr31;

    invoke-virtual {p0, p1, v0, v1}, Lr31;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p0, 0x1

    return p0
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 3

    iget-boolean v0, p0, Lolj;->e:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lolj;->e:Z

    iget-object p0, p0, Lolj;->d:Ltji;

    invoke-virtual {p0, p1}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
