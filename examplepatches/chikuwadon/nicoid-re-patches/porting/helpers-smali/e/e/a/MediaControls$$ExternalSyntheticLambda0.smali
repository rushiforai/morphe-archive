.class public final synthetic Le/e/a/MediaControls$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/MediaControls$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/MediaControls$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/MediaControls$$ExternalSyntheticLambda0;->f$0:Le/e/a/MediaControls$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/MediaControls$$ExternalSyntheticLambda0;->f$0:Le/e/a/MediaControls$State;

    invoke-static {v0}, Le/e/a/MediaControls;->lambda$attach$0(Le/e/a/MediaControls$State;)V

    return-void
.end method
