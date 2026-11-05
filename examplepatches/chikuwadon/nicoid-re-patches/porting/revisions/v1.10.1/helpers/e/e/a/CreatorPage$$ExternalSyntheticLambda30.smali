.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda30;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/widget/LinearLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$2:Landroid/widget/LinearLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda30;->f$2:Landroid/widget/LinearLayout;

    invoke-static {v0, v1, v2}, Le/e/a/CreatorPage;->lambda$11(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;)V

    return-void
.end method
