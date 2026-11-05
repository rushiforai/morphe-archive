.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Landroid/os/Bundle;

.field public final synthetic f$2:Landroid/view/View;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$1:Landroid/os/Bundle;

    iput-object p3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$2:Landroid/view/View;

    iput-object p4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$1:Landroid/os/Bundle;

    iget-object v2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$2:Landroid/view/View;

    iget-object v3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda2;->f$3:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p1}, Le/e/a/VideoExtras;->lambda$bind$0(Landroid/widget/Button;Landroid/os/Bundle;Landroid/view/View;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
