.class public final Lcwn;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Ldwn;

.field public C:I

.field public t:Lqfb;

.field public u:Lkotlinx/serialization/json/b;

.field public v:Lkotlinx/serialization/json/c;

.field public w:Ltvn;

.field public x:Lpfe;

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>(Ldwn;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lcwn;->B:Ldwn;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lcwn;->A:Ljava/lang/Object;

    iget p1, p0, Lcwn;->C:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lcwn;->C:I

    iget-object p1, p0, Lcwn;->B:Ldwn;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Ldwn;->f(Lqfb;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
