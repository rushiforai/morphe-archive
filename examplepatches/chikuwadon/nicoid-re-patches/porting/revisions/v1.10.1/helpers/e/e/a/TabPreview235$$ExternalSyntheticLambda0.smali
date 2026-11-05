.class public final synthetic Le/e/a/TabPreview235$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Le/e/a/TabPreview235$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    invoke-static {v0, v1}, Le/e/a/TabPreview235;->lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/String;)V

    return-void
.end method
