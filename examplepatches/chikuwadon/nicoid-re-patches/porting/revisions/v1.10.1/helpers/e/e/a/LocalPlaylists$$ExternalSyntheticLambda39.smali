.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$0:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$5:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$0:Landroid/content/Context;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda39;->f$5:Ljava/lang/Object;

    move-object v6, p1

    check-cast v6, Ljava/lang/String;

    invoke-static/range {v0 .. v6}, Le/e/a/LocalPlaylists;->lambda$9(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
