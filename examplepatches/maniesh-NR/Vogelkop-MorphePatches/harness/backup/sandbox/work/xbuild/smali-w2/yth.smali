.class public final Lyth;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Lzth;

.field public C:I

.field public t:Lzth;

.field public u:Ltth;

.field public v:Lhzc;

.field public w:Lpqh;

.field public x:B

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Lzth;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lyth;->B:Lzth;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lyth;->A:Ljava/lang/Object;

    iget p1, p0, Lyth;->C:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lyth;->C:I

    const/4 p1, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lyth;->B:Lzth;

    invoke-static {v1, p1, v0, p0}, Lzth;->a(Lzth;Ltth;ILnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
