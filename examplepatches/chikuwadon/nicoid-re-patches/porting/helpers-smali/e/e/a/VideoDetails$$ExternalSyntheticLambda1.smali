.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/widget/TextView;

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$1:Landroid/widget/TextView;

    iput-object p3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$1:Landroid/widget/TextView;

    iget-object v2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$2:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda1;->f$3:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Le/e/a/VideoDetails;->lambda$2(Le/e/a/NetworkTask;Landroid/widget/TextView;Landroid/widget/LinearLayout;Ljava/lang/String;)V

    return-void
.end method
