.class public final synthetic Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/reflect/InvocationHandler;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/SimpleTimeLimiter;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:J

.field public final synthetic f$3:Ljava/util/concurrent/TimeUnit;

.field public final synthetic f$4:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/SimpleTimeLimiter;Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/Set;)V
    .registers 7

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$0:Lcom/google/common/util/concurrent/SimpleTimeLimiter;

    iput-object p2, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$1:Ljava/lang/Object;

    iput-wide p3, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$2:J

    iput-object p5, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$3:Ljava/util/concurrent/TimeUnit;

    iput-object p6, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$4:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$0:Lcom/google/common/util/concurrent/SimpleTimeLimiter;

    iget-object v1, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$1:Ljava/lang/Object;

    iget-wide v2, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$2:J

    iget-object v4, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$3:Ljava/util/concurrent/TimeUnit;

    iget-object v5, p0, Lcom/google/common/util/concurrent/SimpleTimeLimiter$1;->f$4:Ljava/util/Set;

    move-object v6, p1

    move-object v7, p2

    move-object v8, p3

    invoke-virtual/range {v0 .. v8}, Lcom/google/common/util/concurrent/SimpleTimeLimiter;->lambda$newProxy$0$com-google-common-util-concurrent-SimpleTimeLimiter(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljava/util/Set;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
