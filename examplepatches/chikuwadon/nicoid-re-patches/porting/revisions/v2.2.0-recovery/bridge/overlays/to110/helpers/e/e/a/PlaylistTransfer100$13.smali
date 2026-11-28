.class public final synthetic Le/e/a/PlaylistTransfer100$13;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$back$14"
    proto = "(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Landroid/content/DialogInterface;I)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Le/e/a/PlaylistTransfer100;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$13;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/PlaylistTransfer100$13;->f$1:Le/e/a/PlaylistTransfer100;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$13;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/PlaylistTransfer100$13;->f$1:Le/e/a/PlaylistTransfer100;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PlaylistTransfer100;->lambda$back$14(Le/e/a/LocalPlaylists$Page;Le/e/a/PlaylistTransfer100;Landroid/content/DialogInterface;I)V

    return-void
.end method
