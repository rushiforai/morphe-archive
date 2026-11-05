.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda27;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda27;->f$0:Le/e/a/LocalPlaylists$Page;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda27;->f$0:Le/e/a/LocalPlaylists$Page;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists;->lambda$19(Le/e/a/LocalPlaylists$Page;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
