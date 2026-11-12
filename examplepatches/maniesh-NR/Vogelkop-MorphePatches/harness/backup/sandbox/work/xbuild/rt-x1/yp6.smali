.class public final Lyp6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/lang/Object;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lcq6;

.field public w:I


# direct methods
.method public constructor <init>(Lcq6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lyp6;->v:Lcq6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lyp6;->u:Ljava/lang/Object;

    iget p1, p0, Lyp6;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lyp6;->w:I

    iget-object p1, p0, Lyp6;->v:Lcq6;

    invoke-virtual {p1, p0}, Lcq6;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_14

    return-object p0

    :cond_14
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
