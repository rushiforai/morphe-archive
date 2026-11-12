.class public final Lcom/opera/android/autofill/PasswordImporter;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lm4g;

.field public b:Ljava/util/ArrayList;

.field public c:J


# direct methods
.method public constructor <init>(Lm4g;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/opera/android/autofill/PasswordImporter;->b:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/opera/android/autofill/PasswordImporter;->a:Lm4g;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_e

    invoke-static {p0}, LJ/N;->MykmBerU(Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    :cond_e
    invoke-static {v0, v1, p1}, LJ/N;->M1JiKHyV(JLjava/lang/Object;)V

    return-void
.end method

.method public final addConflictEntry(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/autofill/PasswordImporter;->b:Ljava/util/ArrayList;

    new-instance p2, Ln4g;

    invoke-direct {p2, p1}, Ln4g;-><init>(I)V

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onConflict()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/autofill/PasswordImporter;->b:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/opera/android/autofill/PasswordImporter;->b:Ljava/util/ArrayList;

    new-instance v1, Lo8f;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v2}, Lo8f;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lvdf;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lcom/opera/android/autofill/PasswordImporter;->a:Lm4g;

    invoke-interface {p0, v0, v1, v2}, Lm4g;->t(Ljava/util/ArrayList;Lo8f;Lvdf;)V

    return-void
.end method

.method public final onFailure(I)V
    .registers 7

    iget-wide v0, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_d

    invoke-static {v0, v1}, LJ/N;->MZLGJDmT(J)V

    iput-wide v2, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    :cond_d
    iget-object p0, p0, Lcom/opera/android/autofill/PasswordImporter;->a:Lm4g;

    invoke-interface {p0, p1}, Lm4g;->a(I)V

    return-void
.end method

.method public final onSuccess(I)V
    .registers 7

    iget-wide v0, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_d

    invoke-static {v0, v1}, LJ/N;->MZLGJDmT(J)V

    iput-wide v2, p0, Lcom/opera/android/autofill/PasswordImporter;->c:J

    :cond_d
    iget-object p0, p0, Lcom/opera/android/autofill/PasswordImporter;->a:Lm4g;

    invoke-interface {p0, p1}, Lm4g;->g(I)V

    return-void
.end method
