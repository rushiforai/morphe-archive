.class public final synthetic Le/e/a/VideoOutput227$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/VideoOutput227$$ExternalSyntheticLambda2;->f$0:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/VideoOutput227$$ExternalSyntheticLambda2;->f$0:Ljava/lang/ref/WeakReference;

    invoke-static {v0}, Le/e/a/VideoOutput227;->lambda$1(Ljava/lang/ref/WeakReference;)V

    return-void
.end method
