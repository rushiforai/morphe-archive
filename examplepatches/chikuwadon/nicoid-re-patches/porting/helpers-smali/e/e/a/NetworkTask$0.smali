.class public final synthetic Le/e/a/NetworkTask$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/NetworkTask;"
    method = "lambda$start$1"
    proto = "(Ljava/lang/Runnable;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/NetworkTask;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Le/e/a/NetworkTask;Ljava/lang/Runnable;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/NetworkTask$0;->f$0:Le/e/a/NetworkTask;

    iput-object p2, p0, Le/e/a/NetworkTask$0;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/NetworkTask$0;->f$0:Le/e/a/NetworkTask;

    iget-object v1, p0, Le/e/a/NetworkTask$0;->f$1:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Le/e/a/NetworkTask;->lambda$start$1$e-e-a-NetworkTask(Ljava/lang/Runnable;)V

    return-void
.end method
