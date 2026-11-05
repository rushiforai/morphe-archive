.class public final synthetic Le/e/a/CreatorPage$$ExternalSyntheticLambda24;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Landroid/widget/LinearLayout;

.field public final synthetic f$3:Landroid/view/View;

.field public final synthetic f$4:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;ZLandroid/widget/LinearLayout;Landroid/view/View;Landroid/content/Context;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$0:Landroid/app/Activity;

    iput-boolean p2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$1:Z

    iput-object p3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$2:Landroid/widget/LinearLayout;

    iput-object p4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$3:Landroid/view/View;

    iput-object p5, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$4:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$0:Landroid/app/Activity;

    iget-boolean v1, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$1:Z

    iget-object v2, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$2:Landroid/widget/LinearLayout;

    iget-object v3, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$3:Landroid/view/View;

    iget-object v4, p0, Le/e/a/CreatorPage$$ExternalSyntheticLambda24;->f$4:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3, v4}, Le/e/a/CreatorPage;->lambda$32(Landroid/app/Activity;ZLandroid/widget/LinearLayout;Landroid/view/View;Landroid/content/Context;)V

    return-void
.end method
