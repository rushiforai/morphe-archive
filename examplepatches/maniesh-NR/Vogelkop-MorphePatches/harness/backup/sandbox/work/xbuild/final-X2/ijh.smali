.class public final Lijh;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public final synthetic A:Lxbf;

.field public B:I

.field public t:Lqnn;

.field public u:Landroid/graphics/Point;

.field public v:F

.field public w:F

.field public x:F

.field public y:I

.field public synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lxbf;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lijh;->A:Lxbf;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lijh;->z:Ljava/lang/Object;

    iget p1, p0, Lijh;->B:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lijh;->B:I

    iget-object p1, p0, Lijh;->A:Lxbf;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lxbf;->D(Landroid/graphics/Point;Lqnn;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
