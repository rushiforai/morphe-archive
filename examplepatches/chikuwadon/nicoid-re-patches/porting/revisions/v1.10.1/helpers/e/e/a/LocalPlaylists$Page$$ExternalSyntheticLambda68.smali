.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final synthetic f$0:Z

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$0:Z

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 5

    .line 0
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$0:Z

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda68;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Le/e/a/LocalPlaylists$Page;->lambda$20(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
