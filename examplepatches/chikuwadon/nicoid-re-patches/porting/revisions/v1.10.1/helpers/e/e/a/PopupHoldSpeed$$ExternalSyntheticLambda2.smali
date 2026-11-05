.class public final synthetic Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/PopupHoldSpeed$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PopupHoldSpeed$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda2;->f$0:Le/e/a/PopupHoldSpeed$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/PopupHoldSpeed$$ExternalSyntheticLambda2;->f$0:Le/e/a/PopupHoldSpeed$State;

    invoke-static {v0}, Le/e/a/PopupHoldSpeed;->lambda$1(Le/e/a/PopupHoldSpeed$State;)V

    return-void
.end method
