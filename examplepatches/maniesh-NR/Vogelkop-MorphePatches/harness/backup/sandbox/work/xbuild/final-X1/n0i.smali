.class public final Ln0i;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:B

.field public u:I

.field public v:I

.field public w:J

.field public x:Lkotlin/jvm/functions/Function1;

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Lo0i;


# direct methods
.method public constructor <init>(Lo0i;Lnt5;)V
    .registers 3

    iput-object p1, p0, Ln0i;->z:Lo0i;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iput-object p1, p0, Ln0i;->y:Ljava/lang/Object;

    iget p1, p0, Ln0i;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Ln0i;->A:I

    const-wide/16 v2, 0x0

    const/4 v4, 0x0

    iget-object v0, p0, Ln0i;->z:Lo0i;

    const/4 v1, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lo0i;->a(IJLkotlin/jvm/functions/Function1;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
