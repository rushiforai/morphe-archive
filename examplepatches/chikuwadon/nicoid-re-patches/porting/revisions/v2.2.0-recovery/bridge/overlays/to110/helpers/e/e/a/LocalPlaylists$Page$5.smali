.class public final synthetic Le/e/a/LocalPlaylists$Page$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final catalog97:Z

.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$5;->f$0:Le/e/a/LocalPlaylists$Page;

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/LocalPlaylists$Page$5;->catalog97:Z

    return-void
.end method

.method public constructor <init>(Le/e/a/LocalPlaylists$Page;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$5;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-boolean p2, p0, Le/e/a/LocalPlaylists$Page$5;->catalog97:Z

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 3

    .line 0
    iget-boolean v0, p0, Le/e/a/LocalPlaylists$Page$5;->catalog97:Z

    iget-object p0, p0, Le/e/a/LocalPlaylists$Page$5;->f$0:Le/e/a/LocalPlaylists$Page;

    check-cast p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->catalogMoveFinished97(Ljava/lang/Boolean;)V

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Le/e/a/LocalPlaylists$Page;->lambda$28$e-e-a-LocalPlaylists$Page(Ljava/lang/Boolean;)V

    return-void
.end method
