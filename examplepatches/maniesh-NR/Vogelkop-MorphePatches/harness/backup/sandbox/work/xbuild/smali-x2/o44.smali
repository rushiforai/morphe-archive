.class public final Lo44;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public t:Ld44;

.field public u:Loqh;

.field public v:Lo02;

.field public w:Ld44;

.field public x:Lo02;

.field public y:J

.field public synthetic z:Ljava/lang/Object;


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lo44;->z:Ljava/lang/Object;

    iget p1, p0, Lo44;->A:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lo44;->A:I

    const/4 p1, 0x0

    const-wide/16 v0, 0x0

    invoke-static {p1, p1, v0, v1, p0}, Lp37;->y(Ld44;Ljava/nio/channels/WritableByteChannel;JLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
