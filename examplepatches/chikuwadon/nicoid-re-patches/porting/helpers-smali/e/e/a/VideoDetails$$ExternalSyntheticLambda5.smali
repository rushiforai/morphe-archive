.class public final synthetic Le/e/a/VideoDetails$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:[Z


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;[Z)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;->f$1:[Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Le/e/a/VideoDetails$$ExternalSyntheticLambda5;->f$1:[Z

    invoke-static {v0, v1}, Le/e/a/VideoDetails;->lambda$5(Landroid/widget/Button;[Z)V

    return-void
.end method
