.class public final Lu0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lh46;

.field public u:Lnle;

.field public v:Ljava/math/BigInteger;

.field public w:Ljava/math/BigInteger;

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Lx0m;

.field public z:I


# direct methods
.method public constructor <init>(Lx0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lu0m;->y:Lx0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lu0m;->x:Ljava/lang/Object;

    iget p1, p0, Lu0m;->z:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lu0m;->z:I

    iget-object p1, p0, Lu0m;->y:Lx0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lx0m;->d(Lh46;Lnle;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
