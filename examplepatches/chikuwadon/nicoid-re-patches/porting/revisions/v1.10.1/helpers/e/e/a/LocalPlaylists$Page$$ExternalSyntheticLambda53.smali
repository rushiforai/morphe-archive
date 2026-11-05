.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda53;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final synthetic f$0:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda53;->f$0:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda53;->f$0:Ljava/util/Set;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists$Page;->lambda$38(Ljava/util/Set;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
