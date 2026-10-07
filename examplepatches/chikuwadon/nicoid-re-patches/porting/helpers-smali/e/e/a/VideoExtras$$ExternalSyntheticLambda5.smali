.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Z

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Landroid/os/Bundle;

.field public final synthetic f$4:Z

.field public final synthetic f$5:Landroid/view/View;

.field public final synthetic f$6:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Bundle;ZLandroid/view/View;Landroid/widget/Button;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$0:Ljava/lang/String;

    iput-boolean p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$1:Z

    iput-object p3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$3:Landroid/os/Bundle;

    iput-boolean p5, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$4:Z

    iput-object p6, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$5:Landroid/view/View;

    iput-object p7, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$6:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$0:Ljava/lang/String;

    iget-boolean v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$1:Z

    iget-object v2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$3:Landroid/os/Bundle;

    iget-boolean v4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$4:Z

    iget-object v5, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$5:Landroid/view/View;

    iget-object v6, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda5;->f$6:Landroid/widget/Button;

    invoke-static/range {v0 .. v6}, Le/e/a/VideoExtras;->lambda$toggle$7(Ljava/lang/String;ZLjava/lang/String;Landroid/os/Bundle;ZLandroid/view/View;Landroid/widget/Button;)V

    return-void
.end method
