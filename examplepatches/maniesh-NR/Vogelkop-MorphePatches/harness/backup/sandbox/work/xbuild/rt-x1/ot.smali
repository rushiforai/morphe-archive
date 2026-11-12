.class public final Lot;
.super Loy;
.source "SourceFile"


# instance fields
.field public final k:Lnt;

.field public final l:Ltw2;


# direct methods
.method public constructor <init>(Lnt;Ltw2;)V
    .registers 5

    new-instance v0, Lshf;

    invoke-direct {v0}, Lshf;-><init>()V

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Loy;-><init>(Lysi;Lshf;Ljava/util/Locale;)V

    iput-object p1, p0, Lot;->k:Lnt;

    iput-object p2, p0, Lot;->l:Ltw2;

    return-void
.end method


# virtual methods
.method public final h()V
    .registers 3

    iget-object p0, p0, Lot;->l:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lorm;

    sget-object v0, Lgt;->f:Lgt;

    invoke-static {v0}, Ltw2;->t(Lgt;)Ljava/lang/String;

    move-result-object v0

    check-cast p0, Lx5f;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-nez v1, :cond_13

    return-void

    :cond_13
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0, v1}, Lx5f;->j(ILjava/lang/String;Z)V

    return-void
.end method
