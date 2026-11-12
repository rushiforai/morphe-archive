.class public final Lgwo;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Loxo;

.field public v:I


# direct methods
.method public constructor <init>(Loxo;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lgwo;->u:Loxo;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iput-object p1, p0, Lgwo;->t:Ljava/lang/Object;

    iget p1, p0, Lgwo;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lgwo;->v:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-object v0, p0, Lgwo;->u:Loxo;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v9, p0

    invoke-virtual/range {v0 .. v9}, Loxo;->f(Landroid/content/Context;Ljava/lang/String;Lsm;Ljava/lang/String;Leq;Lwjo;Ljava/lang/Boolean;Lako;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_1d

    return-object p0

    :cond_1d
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
