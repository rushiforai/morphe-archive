.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Landroid/app/AlertDialog;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Landroid/app/AlertDialog;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;->f$1:Landroid/app/AlertDialog;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda69;->f$1:Landroid/app/AlertDialog;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {v0, v1, p1}, Le/e/a/LocalPlaylists$Page;->lambda$21$e-e-a-LocalPlaylists$Page(Landroid/app/AlertDialog;Ljava/lang/Boolean;)V

    return-void
.end method
