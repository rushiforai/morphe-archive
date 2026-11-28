.class public final synthetic Le/e/a/PlaylistTransfer100$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$immediate$6"
    proto = "([ILjava/util/List;Ljava/lang/String;Ljava/lang/String;ZLe/e/a/LocalPlaylistData;)V"
.end annotation


# instance fields
.field public final synthetic f$0:[I

.field public final synthetic f$1:Ljava/util/List;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Z


# direct methods
.method public synthetic constructor <init>([ILjava/util/List;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$5;->f$0:[I

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$5;->f$1:Ljava/util/List;

    iput-object p3, p0, Le/e/a/PlaylistTransfer100$5;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/PlaylistTransfer100$5;->f$3:Ljava/lang/String;

    iput-boolean p5, p0, Le/e/a/PlaylistTransfer100$5;->f$4:Z

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$5;->f$0:[I

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$5;->f$1:Ljava/util/List;

    iget-object v2, p0, Le/e/a/PlaylistTransfer100$5;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/PlaylistTransfer100$5;->f$3:Ljava/lang/String;

    iget-boolean v4, p0, Le/e/a/PlaylistTransfer100$5;->f$4:Z

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Le/e/a/PlaylistTransfer100;->lambda$immediate$6([ILjava/util/List;Ljava/lang/String;Ljava/lang/String;ZLe/e/a/LocalPlaylistData;)V

    return-void
.end method
