.class public final synthetic Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/ref/WeakReference;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Z

.field public final synthetic f$4:Z

.field public final synthetic f$5:Ljava/lang/Object;

.field public final synthetic f$6:J

.field public final synthetic f$7:F


# direct methods
.method public synthetic constructor <init>(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;ZZLjava/lang/Object;JF)V
    .registers 10

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iput-boolean p4, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$3:Z

    iput-boolean p5, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$4:Z

    iput-object p6, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Object;

    iput-wide p7, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$6:J

    iput p9, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$7:F

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    .line 0
    iget-object v0, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$0:Ljava/lang/ref/WeakReference;

    iget-object v1, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$2:Ljava/lang/String;

    iget-boolean v3, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$3:Z

    iget-boolean v4, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$4:Z

    iget-object v5, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$5:Ljava/lang/Object;

    iget-wide v6, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$6:J

    iget v8, p0, Le/e/a/PlaybackHandoff110$$ExternalSyntheticLambda0;->f$7:F

    invoke-static/range {v0 .. v8}, Le/e/a/PlaybackHandoff110;->lambda$0(Ljava/lang/ref/WeakReference;Ljava/lang/Object;Ljava/lang/String;ZZLjava/lang/Object;JF)V

    return-void
.end method
