.class public final synthetic Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Intent;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Intent;Ljava/util/ArrayList;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$0:Landroid/content/Intent;

    iput-object p2, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$1:Ljava/util/ArrayList;

    iput p3, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$0:Landroid/content/Intent;

    iget-object v1, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$1:Ljava/util/ArrayList;

    iget v2, p0, Le/e/a/PlaylistPlayback$$ExternalSyntheticLambda0;->f$2:I

    invoke-static {v0, v1, v2}, Le/e/a/PlaylistPlayback;->lambda$0(Landroid/content/Intent;Ljava/util/ArrayList;I)V

    return-void
.end method
