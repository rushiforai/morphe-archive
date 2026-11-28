.class public final synthetic Le/e/a/PlaylistTransfer100$14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnDragListener;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaylistTransfer100;"
    method = "lambda$installVideoDrop$16"
    proto = "(Le/e/a/LocalPlaylists$Page;Landroid/view/View;Landroid/view/DragEvent;)Z"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistTransfer100$14;->f$0:Le/e/a/LocalPlaylists$Page;

    return-void
.end method


# virtual methods
.method public final onDrag(Landroid/view/View;Landroid/view/DragEvent;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistTransfer100$14;->f$0:Le/e/a/LocalPlaylists$Page;

    invoke-static {v0, p1, p2}, Le/e/a/PlaylistTransfer100;->lambda$installVideoDrop$16(Le/e/a/LocalPlaylists$Page;Landroid/view/View;Landroid/view/DragEvent;)Z

    move-result p1

    return p1
.end method
