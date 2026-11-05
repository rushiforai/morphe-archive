.class public final synthetic Le/e/a/CacheControl110$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Thread;

.field public final synthetic f$1:Le/e/a/CacheControl110$Job;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Thread;

    iput-object p2, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;->f$1:Le/e/a/CacheControl110$Job;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;->f$0:Ljava/lang/Thread;

    iget-object v1, p0, Le/e/a/CacheControl110$$ExternalSyntheticLambda4;->f$1:Le/e/a/CacheControl110$Job;

    invoke-static {v0, v1}, Le/e/a/CacheControl110;->lambda$0(Ljava/lang/Thread;Le/e/a/CacheControl110$Job;)V

    return-void
.end method
