.class public final synthetic Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/HoldSpeed$State;

.field public final synthetic f$1:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;->f$0:Le/e/a/HoldSpeed$State;

    iput-object p2, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;->f$1:Landroid/widget/FrameLayout;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;->f$0:Le/e/a/HoldSpeed$State;

    iget-object v1, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda1;->f$1:Landroid/widget/FrameLayout;

    invoke-static {v0, v1}, Le/e/a/HoldSpeed;->lambda$4(Le/e/a/HoldSpeed$State;Landroid/widget/FrameLayout;)V

    return-void
.end method
