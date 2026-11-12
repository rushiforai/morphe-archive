.class public final Lplc;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public synthetic A:Ljava/lang/Object;

.field public final synthetic B:Lwlc;

.field public C:I

.field public t:Lwlc;

.field public u:Ljava/util/List;

.field public v:Ljava/util/Set;

.field public w:Ljava/util/List;

.field public x:Ljava/util/Iterator;

.field public y:Lruc;

.field public z:J


# direct methods
.method public constructor <init>(Lwlc;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lplc;->B:Lwlc;

    invoke-direct {p0, p2}, Lnt5;-><init>(Lmt5;)V

    return-void
.end method


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iput-object p1, p0, Lplc;->A:Ljava/lang/Object;

    iget p1, p0, Lplc;->C:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lplc;->C:I

    iget-object p1, p0, Lplc;->B:Lwlc;

    const-wide/16 v0, 0x0

    invoke-static {p1, v0, v1, p0}, Lwlc;->c(Lwlc;JLmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
