.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda23;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Landroid/app/Activity;

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Landroid/widget/Button;

.field public final synthetic f$4:I


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$1:Landroid/app/Activity;

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$3:Landroid/widget/Button;

    iput p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$4:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$1:Landroid/app/Activity;

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$2:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$3:Landroid/widget/Button;

    iget v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda23;->f$4:I

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/CreatorPage;->lambda$23(Le/e/a/NetworkTask;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;I)V

    return-void
.end method
