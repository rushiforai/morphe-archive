.class public final synthetic Le/e/a/PlaybackSession$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlaybackSession;"
    method = "lambda$prepared$3"
    proto = "(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;

.field public final synthetic f$1:Le/e/a/PlaybackSession$Session;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackSession$0;->f$0:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/PlaybackSession$0;->f$1:Le/e/a/PlaybackSession$Session;

    iput-boolean p3, p0, Le/e/a/PlaybackSession$0;->f$2:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/PlaybackSession$0;->f$0:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Le/e/a/PlaybackSession$0;->f$1:Le/e/a/PlaybackSession$Session;

    iget-boolean v2, p0, Le/e/a/PlaybackSession$0;->f$2:Z

    invoke-static {v0, v1, v2}, Le/e/a/PlaybackSession;->lambda$prepared$3(Ljava/lang/ref/WeakReference;Le/e/a/PlaybackSession$Session;Z)V

    return-void
.end method
