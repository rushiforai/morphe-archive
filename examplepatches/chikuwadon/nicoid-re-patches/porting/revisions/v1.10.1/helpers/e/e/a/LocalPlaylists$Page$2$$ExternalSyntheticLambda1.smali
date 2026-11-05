.class public final synthetic Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page$2;

.field public final synthetic f$1:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page$2;Lorg/json/JSONObject;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;->f$0:Le/e/a/LocalPlaylists$Page$2;

    iput-object p2, p0, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;->f$1:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;->f$0:Le/e/a/LocalPlaylists$Page$2;

    iget-object v1, p0, Le/e/a/LocalPlaylists$Page$2$$ExternalSyntheticLambda1;->f$1:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, p1}, Le/e/a/LocalPlaylists$Page$2;->lambda$0$e-e-a-LocalPlaylists$Page$2(Lorg/json/JSONObject;Landroid/view/View;)V

    return-void
.end method
