.class public final Lpbi;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Lghf;

.field public u:Ljava/lang/String;

.field public synthetic v:Ljava/lang/Object;

.field public final synthetic w:Lghf;

.field public x:I


# direct methods
.method public constructor <init>(Lghf;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lpbi;->w:Lghf;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lpbi;->v:Ljava/lang/Object;

    iget p1, p0, Lpbi;->x:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lpbi;->x:I

    iget-object p1, p0, Lpbi;->w:Lghf;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lghf;->x(Ljava/lang/String;Ljava/util/Map;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
