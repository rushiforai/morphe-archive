.class public final Lzxn;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public final synthetic u:Layn;

.field public v:I


# direct methods
.method public constructor <init>(Layn;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lzxn;->u:Layn;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lzxn;->t:Ljava/lang/Object;

    iget p1, p0, Lzxn;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lzxn;->v:I

    iget-object p1, p0, Lzxn;->u:Layn;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Layn;->a(Lwc1;Lnt5;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0
.end method
