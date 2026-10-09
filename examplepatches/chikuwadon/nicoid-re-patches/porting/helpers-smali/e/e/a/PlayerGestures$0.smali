.class public final synthetic Le/e/a/PlayerGestures$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/PlayerGestures;"
    method = "lambda$hud$0"
    proto = "(Le/e/a/PlayerGestures$State;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/PlayerGestures$State;


# direct methods
.method public synthetic constructor <init>(Le/e/a/PlayerGestures$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/PlayerGestures$0;->f$0:Le/e/a/PlayerGestures$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Le/e/a/PlayerGestures$0;->f$0:Le/e/a/PlayerGestures$State;

    invoke-static {v0}, Le/e/a/PlayerGestures;->lambda$hud$0(Le/e/a/PlayerGestures$State;)V

    return-void
.end method
