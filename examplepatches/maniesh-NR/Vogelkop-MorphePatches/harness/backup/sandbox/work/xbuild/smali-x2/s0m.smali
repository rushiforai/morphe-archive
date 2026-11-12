.class public final Ls0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Lyzl;

.field public u:Luzl;

.field public v:Lh46;

.field public w:Ljava/math/BigInteger;

.field public x:Ljava/math/BigInteger;

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Lx0m;


# direct methods
.method public constructor <init>(Lx0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ls0m;->z:Lx0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Ls0m;->y:Ljava/lang/Object;

    iget p1, p0, Ls0m;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ls0m;->A:I

    iget-object p1, p0, Ls0m;->z:Lx0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lx0m;->b(Lyzl;Luzl;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
