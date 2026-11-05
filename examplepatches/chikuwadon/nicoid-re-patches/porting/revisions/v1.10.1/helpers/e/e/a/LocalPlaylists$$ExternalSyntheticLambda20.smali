.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Le/e/a/LocalPlaylists$Edit;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Landroid/content/Context;Ljava/util/function/Consumer;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$1:Le/e/a/LocalPlaylists$Edit;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$2:Landroid/content/Context;

    iput-object p4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$3:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$1:Le/e/a/LocalPlaylists$Edit;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$2:Landroid/content/Context;

    iget-object v3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda20;->f$3:Ljava/util/function/Consumer;

    invoke-static {v0, v1, v2, v3}, Le/e/a/LocalPlaylists;->lambda$0(Landroid/content/Context;Le/e/a/LocalPlaylists$Edit;Landroid/content/Context;Ljava/util/function/Consumer;)V

    return-void
.end method
