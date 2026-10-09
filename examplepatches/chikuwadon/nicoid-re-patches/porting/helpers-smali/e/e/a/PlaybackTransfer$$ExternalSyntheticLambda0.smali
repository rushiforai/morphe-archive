.class public final synthetic Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/Class;

.field public final synthetic f$4:I

.field public final synthetic f$5:Ljava/lang/Object;

.field public final synthetic f$6:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;ILjava/lang/Object;Landroid/content/Intent;)V
    .registers 8

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$3:Ljava/lang/Class;

    iput p5, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$4:I

    iput-object p6, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Object;

    iput-object p7, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$6:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    .line 0
    iget-object v0, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-object v3, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$3:Ljava/lang/Class;

    iget v4, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$4:I

    iget-object v5, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Object;

    iget-object v6, p0, Le/e/a/PlaybackTransfer$$ExternalSyntheticLambda0;->f$6:Landroid/content/Intent;

    invoke-static/range {v0 .. v6}, Le/e/a/PlaybackTransfer;->lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;ILjava/lang/Object;Landroid/content/Intent;)V

    return-void
.end method
