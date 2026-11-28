.class public final synthetic Le/e/a/PlaylistSort219$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic f$0:I


# direct methods
.method public synthetic constructor <init>(I)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda1;->f$0:I

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4

    .line 0
    iget v0, p0, Le/e/a/PlaylistSort219$$ExternalSyntheticLambda1;->f$0:I

    check-cast p1, Lorg/json/JSONObject;

    check-cast p2, Lorg/json/JSONObject;

    invoke-static {v0, p1, p2}, Le/e/a/PlaylistSort219;->lambda$sortLocal$0(ILorg/json/JSONObject;Lorg/json/JSONObject;)I

    move-result p1

    return p1
.end method
