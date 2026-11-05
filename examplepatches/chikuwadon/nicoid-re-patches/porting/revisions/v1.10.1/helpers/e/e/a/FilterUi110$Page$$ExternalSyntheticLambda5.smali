.class public final synthetic Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/FilterUi110$Page;


# direct methods
.method public synthetic constructor <init>(Le/e/a/FilterUi110$Page;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;->f$0:Le/e/a/FilterUi110$Page;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/FilterUi110$Page$$ExternalSyntheticLambda5;->f$0:Le/e/a/FilterUi110$Page;

    invoke-virtual {v0}, Le/e/a/FilterUi110$Page;->render()V

    return-void
.end method
