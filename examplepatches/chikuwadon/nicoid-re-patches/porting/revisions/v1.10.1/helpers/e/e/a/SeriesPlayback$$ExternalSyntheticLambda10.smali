.class public final synthetic Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Lorg/json/JSONObject;

.field public final synthetic f$2:Ljava/util/ArrayList;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/util/ArrayList;I)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$1:Lorg/json/JSONObject;

    iput-object p3, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$2:Ljava/util/ArrayList;

    iput p4, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$3:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$1:Lorg/json/JSONObject;

    iget-object v2, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$2:Ljava/util/ArrayList;

    iget v3, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda10;->f$3:I

    invoke-static {v0, v1, v2, v3}, Le/e/a/SeriesPlayback;->lambda$4(Landroid/app/Activity;Lorg/json/JSONObject;Ljava/util/ArrayList;I)V

    return-void
.end method
