.class public final Lf0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public final synthetic A:Lj0m;

.field public B:I

.field public t:Lw8e;

.field public u:Lyzl;

.field public v:Lw8e;

.field public w:Lw8e;

.field public x:Lw8e;

.field public y:Lrzl;

.field public synthetic z:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lj0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lf0m;->A:Lj0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lf0m;->z:Ljava/lang/Object;

    iget p1, p0, Lf0m;->B:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lf0m;->B:I

    iget-object p1, p0, Lf0m;->A:Lj0m;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, p0}, Lj0m;->a(Lxzl;Lw8e;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
