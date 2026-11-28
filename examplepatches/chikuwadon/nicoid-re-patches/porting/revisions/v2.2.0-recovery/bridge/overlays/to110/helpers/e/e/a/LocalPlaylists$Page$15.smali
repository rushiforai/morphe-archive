.class public final synthetic Le/e/a/LocalPlaylists$Page$15;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# instance fields
.field public final direction97:I

.field public final synthetic f$0:Z

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page$15;->f$0:Z

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$15;->f$1:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/LocalPlaylists$Page$15;->f$2:Ljava/lang/String;

    iput p3, p0, Le/e/a/LocalPlaylists$Page$15;->direction97:I

    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Le/e/a/LocalPlaylists$Page$15;->f$0:Z

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$15;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$15;->f$2:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Le/e/a/LocalPlaylists$Page$15;->direction97:I

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 5

    .line 0
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page$15;->f$0:Z

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$15;->f$1:Ljava/lang/String;

    iget v2, p0, Le/e/a/LocalPlaylists$Page$15;->direction97:I

    if-eqz v2, :cond_0

    invoke-virtual {p1, v0, v1, v2}, Le/e/a/LocalPlaylistData;->moveCatalog97(ZLjava/lang/String;I)V

    return-void

    :cond_0
    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$15;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Le/e/a/LocalPlaylists$Page;->lambda$24(ZLjava/lang/String;Ljava/lang/String;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
