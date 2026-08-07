.class public Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/threadhook/PthreadHook;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThreadStackShrinkConfig"
.end annotation


# instance fields
.field public enabled:Z

.field public final ignoreCreatorSoPatterns:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->enabled:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashSet;

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public addIgnoreCreatorSoPatterns(Ljava/lang/String;)Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public setEnabled(Z)Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->enabled:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs setIgnoreCreatorSoPatterns([Ljava/lang/String;)Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;
    .locals 1
    .param p1    # [Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 8
    .line 9
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/threadhook/PthreadHook$ThreadStackShrinkConfig;->ignoreCreatorSoPatterns:Ljava/util/Set;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Set;->clear()V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
