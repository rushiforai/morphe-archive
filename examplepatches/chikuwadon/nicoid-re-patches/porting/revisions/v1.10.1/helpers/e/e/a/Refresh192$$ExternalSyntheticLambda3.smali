.class public final synthetic Le/e/a/Refresh192$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:Le/e/a/Refresh192$Session;

.field public final synthetic f$2:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic f$3:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic f$4:Lorg/json/JSONObject;

.field public final synthetic f$5:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$1:Le/e/a/Refresh192$Session;

    iput-object p3, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p4, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$3:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p5, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$4:Lorg/json/JSONObject;

    iput-object p6, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$5:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    .line 0
    iget-object v0, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$0:Ljava/lang/Object;

    iget-object v1, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$1:Le/e/a/Refresh192$Session;

    iget-object v2, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$2:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v3, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$3:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v4, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$4:Lorg/json/JSONObject;

    iget-object v5, p0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;->f$5:Ljava/lang/Object;

    invoke-static/range {v0 .. v5}, Le/e/a/Refresh192;->lambda$1(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V

    return-void
.end method
