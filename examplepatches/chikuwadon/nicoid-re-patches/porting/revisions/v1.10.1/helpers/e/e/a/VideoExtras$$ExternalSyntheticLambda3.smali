.class public final synthetic Le/e/a/VideoExtras$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/VideoExtras$$ExternalSyntheticLambda3;->f$1:Landroid/view/View;

    invoke-static {v0, v1}, Le/e/a/VideoExtras;->lambda$bind$1(Ljava/lang/Object;Landroid/view/View;)V

    return-void
.end method
