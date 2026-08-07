.class public Lcom/google/common/cache/LocalCache$Segment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/cache/LocalCache$Segment;->loadAsync(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$k;Lcom/google/common/cache/CacheLoader;)Ll/hpr;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:I

.field public final synthetic c:Lcom/google/common/cache/LocalCache$k;

.field public final synthetic d:Ll/hpr;

.field public final synthetic e:Lcom/google/common/cache/LocalCache$Segment;


# direct methods
.method public constructor <init>(Lcom/google/common/cache/LocalCache$Segment;Ljava/lang/Object;ILcom/google/common/cache/LocalCache$k;Ll/hpr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/common/cache/LocalCache$Segment$a;->e:Lcom/google/common/cache/LocalCache$Segment;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/common/cache/LocalCache$Segment$a;->a:Ljava/lang/Object;

    .line 4
    .line 5
    iput p3, p0, Lcom/google/common/cache/LocalCache$Segment$a;->b:I

    .line 6
    .line 7
    iput-object p4, p0, Lcom/google/common/cache/LocalCache$Segment$a;->c:Lcom/google/common/cache/LocalCache$k;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/google/common/cache/LocalCache$Segment$a;->d:Ll/hpr;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/google/common/cache/LocalCache$Segment$a;->e:Lcom/google/common/cache/LocalCache$Segment;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/common/cache/LocalCache$Segment$a;->a:Ljava/lang/Object;

    .line 4
    .line 5
    iget v2, p0, Lcom/google/common/cache/LocalCache$Segment$a;->b:I

    .line 6
    .line 7
    iget-object v3, p0, Lcom/google/common/cache/LocalCache$Segment$a;->c:Lcom/google/common/cache/LocalCache$k;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/google/common/cache/LocalCache$Segment$a;->d:Ll/hpr;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/common/cache/LocalCache$Segment;->getAndRecordStats(Ljava/lang/Object;ILcom/google/common/cache/LocalCache$k;Ll/hpr;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    sget-object v1, Lcom/google/common/cache/LocalCache;->w:Ljava/util/logging/Logger;

    .line 17
    .line 18
    sget-object v2, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 19
    .line 20
    const-string v3, "Exception thrown during refresh"

    .line 21
    .line 22
    invoke-virtual {v1, v2, v3, v0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/google/common/cache/LocalCache$Segment$a;->c:Lcom/google/common/cache/LocalCache$k;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Lcom/google/common/cache/LocalCache$k;->l(Ljava/lang/Throwable;)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method
