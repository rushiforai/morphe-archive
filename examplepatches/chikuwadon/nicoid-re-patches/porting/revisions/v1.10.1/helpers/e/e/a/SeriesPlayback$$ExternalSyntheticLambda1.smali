.class public final synthetic Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Le/e/a/NetworkTask;

.field public final synthetic f$3:Landroid/content/Context;

.field public final synthetic f$4:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Lorg/json/JSONObject;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$2:Le/e/a/NetworkTask;

    iput-object p4, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$3:Landroid/content/Context;

    iput-object p5, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$4:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$2:Le/e/a/NetworkTask;

    iget-object v3, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$3:Landroid/content/Context;

    iget-object v4, p0, Le/e/a/SeriesPlayback$$ExternalSyntheticLambda1;->f$4:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/SeriesPlayback;->lambda$3(Landroid/app/Activity;Ljava/lang/String;Le/e/a/NetworkTask;Landroid/content/Context;Lorg/json/JSONObject;)V

    return-void
.end method
