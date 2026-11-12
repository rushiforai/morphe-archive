.class public final Lfy6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:Lwu5;

.field public synthetic B:Ljava/lang/Object;

.field public final synthetic C:Lgy6;

.field public D:I

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/Double;

.field public v:Ljava/lang/Double;

.field public w:Lcy6;

.field public x:Lcy6;

.field public y:Ljava/lang/Object;

.field public z:Lcy6;


# direct methods
.method public constructor <init>(Lgy6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lfy6;->C:Lgy6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lfy6;->B:Ljava/lang/Object;

    iget p1, p0, Lfy6;->D:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lfy6;->D:I

    iget-object p1, p0, Lfy6;->C:Lgy6;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, p0}, Lgy6;->b(Ljava/lang/String;Ljava/lang/Double;Ljava/lang/Double;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
