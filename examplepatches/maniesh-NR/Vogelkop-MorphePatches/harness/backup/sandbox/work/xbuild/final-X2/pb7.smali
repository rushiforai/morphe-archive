.class public final Lpb7;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Llrl;

.field public u:Lnak;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lqb7;

.field public x:I


# direct methods
.method public constructor <init>(Lqb7;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lpb7;->w:Lqb7;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lpb7;->v:Ljava/lang/Object;

    iget p1, p0, Lpb7;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lpb7;->x:I

    iget-object p1, p0, Lpb7;->w:Lqb7;

    invoke-virtual {p1, p0}, Lqb7;->w(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
