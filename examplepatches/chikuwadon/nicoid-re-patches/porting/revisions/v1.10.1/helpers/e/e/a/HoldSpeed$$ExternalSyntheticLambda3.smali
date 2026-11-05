.class public final synthetic Le/e/a/HoldSpeed$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/HoldSpeed$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/HoldSpeed$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda3;->f$0:Le/e/a/HoldSpeed$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/HoldSpeed$$ExternalSyntheticLambda3;->f$0:Le/e/a/HoldSpeed$State;

    invoke-static {v0}, Le/e/a/HoldSpeed;->lambda$2(Le/e/a/HoldSpeed$State;)V

    return-void
.end method
