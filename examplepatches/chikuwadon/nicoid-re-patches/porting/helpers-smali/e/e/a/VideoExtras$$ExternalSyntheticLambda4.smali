.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Landroid/view/View;

.field public final synthetic f$2:Landroid/os/Bundle;

.field public final synthetic f$3:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/Object;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$0:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$1:Landroid/view/View;

    iput-object p3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$2:Landroid/os/Bundle;

    iput-object p4, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$3:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$0:Ljava/lang/String;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$1:Landroid/view/View;

    iget-object v2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$2:Landroid/os/Bundle;

    iget-object v3, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda4;->f$3:Ljava/lang/Object;

    invoke-static {v0, v1, v2, v3}, Le/e/a/VideoExtras;->lambda$loadSeries$4(Ljava/lang/String;Landroid/view/View;Landroid/os/Bundle;Ljava/lang/Object;)V

    return-void
.end method
