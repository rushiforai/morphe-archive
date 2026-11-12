.class public final Lbx5;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic t:Ljava/lang/Object;

.field public u:I


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lbx5;->t:Ljava/lang/Object;

    iget p1, p0, Lbx5;->u:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lbx5;->u:I

    const/4 p1, 0x0

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1, p0}, Lp37;->q(Lcd5;JLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
