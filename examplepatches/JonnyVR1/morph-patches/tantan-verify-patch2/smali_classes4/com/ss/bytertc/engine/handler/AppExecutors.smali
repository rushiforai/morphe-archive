.class public Lcom/ss/bytertc/engine/handler/AppExecutors;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/handler/AppExecutors$MainThreadExecutor;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/ss/bytertc/engine/handler/AppExecutors;


# instance fields
.field private final mMainThread:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/handler/AppExecutors;

    .line 2
    .line 3
    new-instance v1, Lcom/ss/bytertc/engine/handler/AppExecutors$MainThreadExecutor;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Lcom/ss/bytertc/engine/handler/AppExecutors$MainThreadExecutor;-><init>(Lcom/ss/bytertc/engine/handler/AppExecutors$1;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {v0, v1}, Lcom/ss/bytertc/engine/handler/AppExecutors;-><init>(Ljava/util/concurrent/Executor;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/ss/bytertc/engine/handler/AppExecutors;->INSTANCE:Lcom/ss/bytertc/engine/handler/AppExecutors;

    .line 13
    .line 14
    return-void
.end method

.method private constructor <init>(Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/AppExecutors;->mMainThread:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    return-void
.end method

.method public static getInstance()Lcom/ss/bytertc/engine/handler/AppExecutors;
    .locals 1

    .line 1
    sget-object v0, Lcom/ss/bytertc/engine/handler/AppExecutors;->INSTANCE:Lcom/ss/bytertc/engine/handler/AppExecutors;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public mainThread()Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/AppExecutors;->mMainThread:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    return-object p0
.end method
