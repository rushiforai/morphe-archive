.class public final Lqf4;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Ljava/lang/String;

.field public u:Lab4;

.field public v:Lhh2;

.field public w:I

.field public x:J

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Lp12;


# direct methods
.method public constructor <init>(Lp12;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lqf4;->z:Lp12;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iput-object p1, p0, Lqf4;->y:Ljava/lang/Object;

    iget p1, p0, Lqf4;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lqf4;->A:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v0, p0, Lqf4;->z:Lp12;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v7, p0

    invoke-virtual/range {v0 .. v7}, Lp12;->z(Ljava/lang/String;IJLab4;Lhh2;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
