.class public final Ly0l;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lu7k;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lu7k;

.field public w:I


# direct methods
.method public constructor <init>(Lu7k;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ly0l;->v:Lu7k;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ly0l;->u:Ljava/lang/Object;

    iget p1, p0, Ly0l;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ly0l;->w:I

    iget-object p1, p0, Ly0l;->v:Lu7k;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lu7k;->o(Ljava/lang/String;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_15

    return-object p0

    :cond_15
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
