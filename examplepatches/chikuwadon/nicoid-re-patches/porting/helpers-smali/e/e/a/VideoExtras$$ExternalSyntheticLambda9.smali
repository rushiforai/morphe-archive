.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/view/View;

.field public final synthetic f$1:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Landroid/view/View;Landroid/widget/Button;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;->f$0:Landroid/view/View;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;->f$1:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;->f$0:Landroid/view/View;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda9;->f$1:Landroid/widget/Button;

    invoke-static {v0, v1}, Le/e/a/VideoExtras;->lambda$toggle$6(Landroid/view/View;Landroid/widget/Button;)V

    return-void
.end method
