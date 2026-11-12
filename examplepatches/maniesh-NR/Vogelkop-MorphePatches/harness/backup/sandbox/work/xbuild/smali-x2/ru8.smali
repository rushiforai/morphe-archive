.class public final Lru8;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Lta7;

.field public final k:Ls9i;

.field public final l:Lstm;

.field public m:Lqtm;

.field public n:Z


# direct methods
.method public constructor <init>(Lta7;Ltm5;Ls9i;Lstm;)V
    .registers 5

    invoke-direct {p0, p2}, Lt7j;-><init>(Ltm5;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lru8;->n:Z

    iput-object p1, p0, Lru8;->j:Lta7;

    iput-object p3, p0, Lru8;->k:Ls9i;

    iput-object p4, p0, Lru8;->l:Lstm;

    return-void
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lqu8;

    invoke-direct {v0, p0, p1}, Lqu8;-><init>(Lru8;Lisd;)V

    return-object v0
.end method
