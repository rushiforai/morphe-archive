.class public final synthetic Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:Ljava/util/IdentityHashMap;

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/IdentityHashMap;Z)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;->f$0:Ljava/util/IdentityHashMap;

    iput-boolean p2, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;->f$1:Z

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;->f$0:Ljava/util/IdentityHashMap;

    iget-boolean v1, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda2;->f$1:Z

    check-cast p1, Lorg/json/JSONObject;

    check-cast p2, Lorg/json/JSONObject;

    invoke-static {v0, v1, p1, p2}, Le/e/a/PlaylistSort219;->lambda$sortLocal$1(Ljava/util/IdentityHashMap;ZLorg/json/JSONObject;Lorg/json/JSONObject;)I

    move-result p1

    return p1
.end method
