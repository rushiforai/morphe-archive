.class public final synthetic Le/e/a/PlaylistTransfer100$3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$immediate$8"
    proto = "(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/util/List;

.field public final synthetic f$3:Z


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;Z)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$3;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$3;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/PlaylistTransfer100$3;->f$2:Ljava/util/List;

    iput-boolean p4, p0, Le/e/a/PlaylistTransfer100$3;->f$3:Z

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$3;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$3;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/PlaylistTransfer100$3;->f$2:Ljava/util/List;

    iget-boolean v3, p0, Le/e/a/PlaylistTransfer100$3;->f$3:Z

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/PlaylistTransfer100;->lambda$immediate$8(Le/e/a/LocalPlaylists$Page;Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V

    return-void
.end method
