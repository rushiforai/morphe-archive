.class public final Lv59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final a:Ldj9;

.field public final b:J

.field public final c:Lx5f;

.field public final d:Lwsf;


# direct methods
.method public constructor <init>(Ldj9;JLx5f;Lwsf;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv59;->a:Ldj9;

    iput-wide p2, p0, Lv59;->b:J

    iput-object p4, p0, Lv59;->c:Lx5f;

    iput-object p5, p0, Lv59;->d:Lwsf;

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 16

    iget-object p1, p0, Lv59;->a:Ldj9;

    invoke-virtual {p1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj9;

    invoke-virtual {v0}, Lcj9;->isEmpty()Z

    move-result v1

    iget v0, v0, Lcj9;->c:I

    if-eqz v1, :cond_11

    return-void

    :cond_11
    int-to-long v0, v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v3

    iget-object v5, p0, Lv59;->c:Lx5f;

    iget-object v6, v5, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    invoke-virtual {v7, v6}, Lx56;->I(Lzpa;)Lin0;

    move-result-object v6

    iget-wide v10, p0, Lv59;->b:J

    sub-long v3, v10, v3

    const/4 v8, 0x1

    const/16 v9, 0x22

    invoke-virtual {v6, v9, v8, v3, v4}, Ljf0;->p(IIJ)V

    invoke-virtual {v5, v7}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v12

    new-instance v8, Lk5f;

    const/4 v9, 0x1

    invoke-direct/range {v8 .. v13}, Lk5f;-><init>(BJJ)V

    iget-object v0, p0, Lv59;->d:Lwsf;

    invoke-virtual {v0, v8}, Lwsf;->a(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p1, p0}, Lno7;->p(Lmo7;)V

    return-void
.end method
