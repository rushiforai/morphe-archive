.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/lang/String;

.field public final synthetic f$5:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$4:Ljava/lang/String;

    iput-object p6, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$5:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 9

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$4:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda34;->f$5:Ljava/lang/Object;

    move-object v6, p1

    invoke-static/range {v0 .. v6}, Le/e/a/LocalPlaylists;->lambda$10(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
