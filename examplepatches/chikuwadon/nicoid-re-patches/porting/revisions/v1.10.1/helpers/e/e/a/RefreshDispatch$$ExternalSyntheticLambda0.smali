.class public final synthetic Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/RefreshDispatch$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    invoke-static {v0, v1}, Le/e/a/RefreshDispatch;->lambda$accept$0(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
