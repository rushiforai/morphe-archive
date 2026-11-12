.class public final Lrm6;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ld98;

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lsm6;

.field public w:I


# direct methods
.method public constructor <init>(Lsm6;Lnt5;)V
    .registers 3

    iput-object p1, p0, Lrm6;->v:Lsm6;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lrm6;->u:Ljava/lang/Object;

    iget p1, p0, Lrm6;->w:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lrm6;->w:I

    iget-object p1, p0, Lrm6;->v:Lsm6;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p0}, Lsm6;->a(Ld98;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
