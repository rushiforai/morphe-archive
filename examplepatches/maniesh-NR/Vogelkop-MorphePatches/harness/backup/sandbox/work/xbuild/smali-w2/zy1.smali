.class public final Lzy1;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Ldz1;

.field public C:I

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Lesd;

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Ldz1;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lzy1;->B:Ldz1;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iput-object p1, p0, Lzy1;->A:Ljava/lang/Object;

    iget p1, p0, Lzy1;->C:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lzy1;->C:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v0, p0, Lzy1;->B:Ldz1;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Ldz1;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lesd;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
