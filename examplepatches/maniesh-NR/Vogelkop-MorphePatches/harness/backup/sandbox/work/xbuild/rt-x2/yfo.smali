.class public final Lyfo;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Lzfo;

.field public v:I


# direct methods
.method public constructor <init>(Lzfo;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lyfo;->u:Lzfo;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iput-object p1, p0, Lyfo;->t:Ljava/lang/Object;

    iget p1, p0, Lyfo;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lyfo;->v:I

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    iget-object v0, p0, Lyfo;->u:Lzfo;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    move-object v8, p0

    invoke-virtual/range {v0 .. v8}, Lzfo;->c(JLjava/lang/String;JJLnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_1c

    return-object p0

    :cond_1c
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
