.class public final La2f;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public A:I

.field public synthetic B:Ljava/lang/Object;

.field public final synthetic C:Le2f;

.field public D:I

.field public t:Ljoc;

.field public u:Ly1f;

.field public v:Lxlc;

.field public w:J

.field public x:Z

.field public y:Z

.field public z:I


# direct methods
.method public constructor <init>(Le2f;Lnt5;)V
    .registers 3

    iput-object p1, p0, La2f;->C:Le2f;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iput-object p1, p0, La2f;->B:Ljava/lang/Object;

    iget p1, p0, La2f;->D:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, La2f;->D:I

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    iget-object v0, p0, La2f;->C:Le2f;

    const/4 v1, 0x0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Le2f;->a(Ljoc;Ly1f;JLnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
