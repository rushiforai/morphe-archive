.class public final Lkq6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ls9i;

.field public y:I


# direct methods
.method public constructor <init>(Ls9i;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lkq6;->x:Ls9i;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lkq6;->w:Ljava/lang/Object;

    iget p1, p0, Lkq6;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lkq6;->y:I

    iget-object p1, p0, Lkq6;->x:Ls9i;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ls9i;->V(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_15

    return-object p0

    :cond_15
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
