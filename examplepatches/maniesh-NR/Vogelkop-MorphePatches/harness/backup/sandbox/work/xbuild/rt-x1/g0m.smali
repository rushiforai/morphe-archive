.class public final Lg0m;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Lj0m;

.field public C:I

.field public t:Lnle;

.field public u:Lwv;

.field public v:Lw8e;

.field public w:Lw8e;

.field public x:Leme;

.field public y:Lrzl;

.field public z:Lxzl;


# direct methods
.method public constructor <init>(Lj0m;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lg0m;->B:Lj0m;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iput-object p1, p0, Lg0m;->A:Ljava/lang/Object;

    iget p1, p0, Lg0m;->C:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lg0m;->C:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v0, p0, Lg0m;->B:Lj0m;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v6, p0

    invoke-virtual/range {v0 .. v6}, Lj0m;->b(Lnle;Lwv;Lwv;Lw8e;Lw8e;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
