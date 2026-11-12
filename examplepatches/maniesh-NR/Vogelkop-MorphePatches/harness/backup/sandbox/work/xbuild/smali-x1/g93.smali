.class public final Lg93;
.super Lt7j;
.source "SourceFile"


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lta7;

.field public final l:Ls9i;

.field public final m:Lp1c;

.field public final n:Lfue;

.field public final o:Lvx;

.field public final p:Ljtg;

.field public final q:Lesk;

.field public final r:Loue;

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lfue;Lta7;Ltm5;Ls9i;Lp1c;Lvx;Ljtg;Lesk;Loue;)V
    .registers 11

    invoke-direct {p0, p4}, Lt7j;-><init>(Ltm5;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lg93;->j:Landroid/content/Context;

    iput-object p2, p0, Lg93;->n:Lfue;

    iput-object p3, p0, Lg93;->k:Lta7;

    iput-object p5, p0, Lg93;->l:Ls9i;

    iput-object p6, p0, Lg93;->m:Lp1c;

    iput-object p7, p0, Lg93;->o:Lvx;

    iput-object p8, p0, Lg93;->p:Ljtg;

    iput-object p9, p0, Lg93;->q:Lesk;

    iput-object p10, p0, Lg93;->r:Loue;

    return-void
.end method


# virtual methods
.method public final a(Lisd;)Lk7j;
    .registers 3

    new-instance v0, Lf93;

    invoke-direct {v0, p0, p1}, Lf93;-><init>(Lg93;Lisd;)V

    return-object v0
.end method
