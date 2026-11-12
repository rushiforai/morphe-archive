.class public final Lnz1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Li07;

.field public u:Ljava/util/List;

.field public v:Lpqh;

.field public w:Lpqh;

.field public x:Ljava/util/Map;

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Ltz1;


# direct methods
.method public constructor <init>(Ltz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lnz1;->z:Ltz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lnz1;->y:Ljava/lang/Object;

    iget p1, p0, Lnz1;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lnz1;->A:I

    iget-object p1, p0, Lnz1;->z:Ltz1;

    invoke-virtual {p1, p0}, Ltz1;->c(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
