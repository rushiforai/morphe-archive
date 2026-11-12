.class public final Lcom/opera/android/readlater/MigrationWorker;
.super Lajc;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B3\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006\u0012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0006\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Lcom/opera/android/readlater/MigrationWorker;",
        "Lajc;",
        "Landroid/content/Context;",
        "appContext",
        "Landroidx/work/WorkerParameters;",
        "workerParams",
        "Lesk;",
        "Lglh;",
        "content",
        "Lsyd;",
        "migrationController",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lesk;Lesk;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final e:Lesk;

.field public final f:Lesk;

.field public final g:Lbx1;

.field public h:Lac1;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lesk;Lesk;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lesk;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lesk;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/WorkerParameters;",
            "Lesk;",
            "Lesk;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lajc;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    iput-object p3, p0, Lcom/opera/android/readlater/MigrationWorker;->e:Lesk;

    iput-object p4, p0, Lcom/opera/android/readlater/MigrationWorker;->f:Lesk;

    new-instance p1, Lbx1;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Lbx1;-><init>(B)V

    iput-object p1, p0, Lcom/opera/android/readlater/MigrationWorker;->g:Lbx1;

    return-void
.end method


# virtual methods
.method public final a()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 8

    iget-object v0, p0, Lcom/opera/android/readlater/MigrationWorker;->h:Lac1;

    const/4 v1, 0x0

    const v2, 0x7f0a070c

    if-nez v0, :cond_3c

    new-instance v0, Lac1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v3, p0, Lajc;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    iput-object v3, v0, Lac1;->c:Ljava/lang/Object;

    new-instance v3, Lcm;

    const/4 v4, 0x0

    const/4 v5, 0x5

    invoke-direct {v3, v4, v2, v5}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string v4, "offline_pages_migration"

    invoke-static {v4, v3}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v3

    iput-object v3, v0, Lac1;->d:Ljava/lang/Object;

    const v4, 0x108007c

    invoke-virtual {v3, v4}, Lua7;->S(I)V

    iget-object v4, v3, Lua7;->b:Ljava/lang/Object;

    check-cast v4, Ll1f;

    const/16 v5, 0x8

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Ll1f;->h(IZ)V

    invoke-virtual {v3, v6}, Lua7;->R(Z)V

    invoke-virtual {v4, v1}, Ll1f;->d(Z)V

    iput-object v0, p0, Lcom/opera/android/readlater/MigrationWorker;->h:Lac1;

    :cond_3c
    new-instance p0, Lij9;

    invoke-virtual {v0}, Lac1;->c()Li16;

    move-result-object v0

    iget-object v0, v0, Li16;->b:Ljava/lang/Object;

    check-cast v0, Landroid/app/Notification;

    invoke-direct {p0, v2, v0, v1}, Lij9;-><init>(ILandroid/app/Notification;I)V

    invoke-static {p0}, Lyr9;->c(Ljava/lang/Object;)Lr0b;

    move-result-object p0

    return-object p0
.end method

.method public final b()Lo94;
    .registers 3

    new-instance v0, Lkqd;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lk1g;->z(Lm94;)Lo94;

    move-result-object p0

    return-object p0
.end method
