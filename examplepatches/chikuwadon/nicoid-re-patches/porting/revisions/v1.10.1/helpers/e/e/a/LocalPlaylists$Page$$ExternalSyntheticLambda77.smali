.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;Ljava/util/ArrayList;Ljava/util/Map;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$0:Le/e/a/LocalPlaylists$Page;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$2:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 14

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$0:Le/e/a/LocalPlaylists$Page;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda77;->f$2:Ljava/util/Map;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-virtual/range {v0 .. v7}, Le/e/a/LocalPlaylists$Page;->lambda$4$e-e-a-LocalPlaylists$Page(Ljava/util/ArrayList;Ljava/util/Map;Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
