.class public final synthetic Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda76;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Le/e/a/LocalPlaylists$Page;


# direct methods
.method public synthetic constructor <init>(Le/e/a/LocalPlaylists$Page;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda76;->f$0:Le/e/a/LocalPlaylists$Page;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/LocalPlaylists$Page$$ExternalSyntheticLambda76;->f$0:Le/e/a/LocalPlaylists$Page;

    check-cast p1, Lorg/json/JSONObject;

    check-cast p2, Lorg/json/JSONObject;

    invoke-virtual {v0, p1, p2}, Le/e/a/LocalPlaylists$Page;->lambda$3$e-e-a-LocalPlaylists$Page(Lorg/json/JSONObject;Lorg/json/JSONObject;)I

    move-result p1

    return p1
.end method
