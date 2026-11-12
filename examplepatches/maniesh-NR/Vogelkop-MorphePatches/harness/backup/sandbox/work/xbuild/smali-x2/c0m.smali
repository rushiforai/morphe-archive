.class public final Lc0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lzzl;

.field public u:Ljava/math/BigInteger;

.field public v:Lpfe;

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ld0m;

.field public y:I


# direct methods
.method public constructor <init>(Ld0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lc0m;->x:Ld0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lc0m;->w:Ljava/lang/Object;

    iget p1, p0, Lc0m;->y:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lc0m;->y:I

    iget-object p1, p0, Lc0m;->x:Ld0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Ld0m;->c(Lzzl;Ljava/math/BigInteger;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
