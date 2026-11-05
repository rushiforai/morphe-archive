.class public final synthetic Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/ExistingMenu114$Guard;


# direct methods
.method public synthetic constructor <init>(Le/e/a/ExistingMenu114$Guard;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;->f$0:Le/e/a/ExistingMenu114$Guard;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/ExistingMenu114$$ExternalSyntheticLambda1;->f$0:Le/e/a/ExistingMenu114$Guard;

    invoke-virtual {v0}, Le/e/a/ExistingMenu114$Guard;->restore()V

    return-void
.end method
