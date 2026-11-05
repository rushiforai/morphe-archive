.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ZLjava/util/function/Consumer;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$0:Landroid/content/Context;

    iput-boolean p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$1:Z

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$2:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$0:Landroid/content/Context;

    iget-boolean v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$1:Z

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda37;->f$2:Ljava/util/function/Consumer;

    invoke-static {v0, v1, v2}, Le/e/a/LocalPlaylists;->lambda$1(Landroid/content/Context;ZLjava/util/function/Consumer;)V

    return-void
.end method
