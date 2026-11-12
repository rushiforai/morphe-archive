.class public final Lstm;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Lta7;

.field public final k:Ls9i;

.field public final l:Lg93;

.field public final m:Landroid/content/Context;

.field public final n:Lx5f;

.field public final o:Lx5f;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lta7;Ltm5;Ls9i;Lg93;Lx5f;Lx5f;)V
    .registers 8

    invoke-direct {p0, p3}, Lt7j;-><init>(Ltm5;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lstm;->m:Landroid/content/Context;

    iput-object p2, p0, Lstm;->j:Lta7;

    iput-object p4, p0, Lstm;->k:Ls9i;

    iput-object p5, p0, Lstm;->l:Lg93;

    iput-object p6, p0, Lstm;->n:Lx5f;

    iput-object p7, p0, Lstm;->o:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lrtm;

    invoke-direct {v0, p0, p1}, Lrtm;-><init>(Lstm;Lisd;)V

    return-object v0
.end method
