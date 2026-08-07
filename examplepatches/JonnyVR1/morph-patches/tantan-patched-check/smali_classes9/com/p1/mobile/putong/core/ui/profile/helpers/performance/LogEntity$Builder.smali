.class public abstract Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;",
        "K:",
        "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity<",
        "TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field bindHash:I

.field logDescription:Ljava/lang/String;

.field logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field logTime:J

.field tranceHash:I

.field type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->bindHash:I

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logTime:J

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logDescription:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public bindHash(I)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->bindHash:I

    .line 2
    .line 3
    return-object p0
.end method

.method public build()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->newInstance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->bindHash:I

    .line 14
    .line 15
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->bindHash:I

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logDescription:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logDescription:Ljava/lang/String;

    .line 28
    .line 29
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logTime:J

    .line 30
    .line 31
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->logTime:J

    .line 32
    .line 33
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->tranceHash:I

    .line 34
    .line 35
    iput p0, v0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;->traceHash:I

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_0
    const-string p0, "check you log!!!"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    return-object p0
.end method

.method public logDescription(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logDescription:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public logName(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logName:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogName;

    .line 2
    .line 3
    return-object p0
.end method

.method public logTime(J)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->logTime:J

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract newInstance()Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation
.end method

.method public tranceHash(I)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->tranceHash:I

    .line 2
    .line 3
    return-object p0
.end method

.method public type(Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;)Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;",
            ")",
            "Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder<",
            "TT;TK;>;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$Builder;->type:Lcom/p1/mobile/putong/core/ui/profile/helpers/performance/LogEntity$LogType;

    .line 2
    .line 3
    return-object p0
.end method
