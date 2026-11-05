.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda52;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda52;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda52;->f$0:Ljava/lang/Runnable;

    invoke-static {v0, p1}, Le/e/a/LocalPlaylists$Page;->lambda$17(Ljava/lang/Runnable;Landroid/view/View;)Z

    move-result p1

    return p1
.end method
