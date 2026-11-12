.class public final Lt74;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Lu74;

.field public v:I


# direct methods
.method public constructor <init>(Lu74;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lt74;->u:Lu74;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lt74;->t:Ljava/lang/Object;

    iget p1, p0, Lt74;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lt74;->v:I

    iget-object p1, p0, Lt74;->u:Lu74;

    invoke-virtual {p1, p0}, Lu74;->f(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_14

    return-object p0

    :cond_14
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
