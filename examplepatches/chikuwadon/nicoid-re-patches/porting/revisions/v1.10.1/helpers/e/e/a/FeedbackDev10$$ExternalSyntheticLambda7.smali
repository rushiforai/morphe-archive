.class public final synthetic Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/BaseAdapter;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Landroid/widget/ListView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/BaseAdapter;Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$0:Landroid/widget/BaseAdapter;

    iput-object p2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$2:Landroid/widget/ListView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$0:Landroid/widget/BaseAdapter;

    iget-object v1, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/FeedbackDev10$$ExternalSyntheticLambda7;->f$2:Landroid/widget/ListView;

    invoke-static {v0, v1, v2}, Le/e/a/FeedbackDev10;->lambda$refreshNg$7(Landroid/widget/BaseAdapter;Ljava/lang/Object;Landroid/widget/ListView;)V

    return-void
.end method
