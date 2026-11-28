.class public final synthetic Le/e/a/PlaylistTransfer100$10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Le/e/a/LocalPlaylists$Edit;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$finish$12"
    proto = "(Le/e/a/PlaylistTransfer100;Le/e/a/LocalPlaylistData;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/PlaylistTransfer100;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PlaylistTransfer100;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$10;->f$0:Le/e/a/PlaylistTransfer100;

    return-void
.end method


# virtual methods
.method public final apply(Le/e/a/LocalPlaylistData;)V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$10;->f$0:Le/e/a/PlaylistTransfer100;

    invoke-static {v0, p1}, Le/e/a/PlaylistTransfer100;->lambda$finish$12(Le/e/a/PlaylistTransfer100;Le/e/a/LocalPlaylistData;)V

    return-void
.end method
