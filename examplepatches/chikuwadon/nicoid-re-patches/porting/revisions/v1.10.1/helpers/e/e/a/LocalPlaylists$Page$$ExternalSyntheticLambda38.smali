.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;->f$0:Ljava/util/Set;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;->f$0:Ljava/util/Set;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda38;->f$1:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Le/e/a/LocalPlaylists$Page;->lambda$34(Ljava/util/Set;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
