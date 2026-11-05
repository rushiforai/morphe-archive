.class public final synthetic Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/BaseAdapter;

.field public final synthetic f$1:Ljava/util/ArrayList;

.field public final synthetic f$2:Ljava/lang/Object;

.field public final synthetic f$3:Landroid/widget/ListView;

.field public final synthetic f$4:Lorg/json/JSONObject;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;Ljava/lang/Object;Landroid/widget/ListView;Lorg/json/JSONObject;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$0:Landroid/widget/BaseAdapter;

    iput-object p2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$1:Ljava/util/ArrayList;

    iput-object p3, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    iput-object p4, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$3:Landroid/widget/ListView;

    iput-object p5, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$4:Lorg/json/JSONObject;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$0:Landroid/widget/BaseAdapter;

    iget-object v1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$1:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$2:Ljava/lang/Object;

    iget-object v3, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$3:Landroid/widget/ListView;

    iget-object v4, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda0;->f$4:Lorg/json/JSONObject;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/FeedbackDev10;->lambda$refreshNg$6(Landroid/widget/BaseAdapter;Ljava/util/ArrayList;Ljava/lang/Object;Landroid/widget/ListView;Lorg/json/JSONObject;)V

    return-void
.end method
