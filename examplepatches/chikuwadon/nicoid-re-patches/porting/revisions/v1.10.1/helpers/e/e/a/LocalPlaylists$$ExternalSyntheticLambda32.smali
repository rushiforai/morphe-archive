.class public final synthetic Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Ljava/util/ArrayList;

.field public final synthetic f$1:Ljava/util/function/Consumer;

.field public final synthetic f$2:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/util/function/Consumer;Landroid/content/Context;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$0:Ljava/util/ArrayList;

    iput-object p2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$1:Ljava/util/function/Consumer;

    iput-object p3, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$2:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$0:Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$1:Ljava/util/function/Consumer;

    iget-object v2, p0, Le/e/a/LocalPlaylists$$ExternalSyntheticLambda32;->f$2:Landroid/content/Context;

    invoke-static {v0, v1, v2, p1, p2}, Le/e/a/LocalPlaylists;->lambda$2(Ljava/util/ArrayList;Ljava/util/function/Consumer;Landroid/content/Context;Landroid/content/DialogInterface;I)V

    return-void
.end method
