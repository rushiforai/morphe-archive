.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$1:Ljava/util/List;

    iput p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$2:I

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$1:Ljava/util/List;

    iget v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda48;->f$2:I

    invoke-static {v0, v1, v2, p1}, Le/e/a/LocalPlaylists$Page;->lambda$23(Ljava/lang/String;Ljava/util/List;ILe/e/a/LocalPlaylistData;)V

    return-void
.end method
