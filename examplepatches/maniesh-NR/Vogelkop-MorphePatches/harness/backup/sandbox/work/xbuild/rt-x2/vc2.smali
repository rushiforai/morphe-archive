.class public final Lvc2;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Ljava/lang/Object;

.field public u:Lkuk;

.field public v:Ljava/lang/Object;

.field public w:Ljava/lang/Object;

.field public x:Lpfe;

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Lqb7;


# direct methods
.method public constructor <init>(Lqb7;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lvc2;->z:Lqb7;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lvc2;->y:Ljava/lang/Object;

    iget p1, p0, Lvc2;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lvc2;->A:I

    iget-object p1, p0, Lvc2;->z:Lqb7;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lqb7;->n(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
