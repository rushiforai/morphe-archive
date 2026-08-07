.class public abstract Lorg/spongycastle/asn1/x9/X9ECParametersHolder;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private params:Lorg/spongycastle/asn1/x9/X9ECParameters;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract createParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;
.end method

.method public declared-synchronized getParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->params:Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->createParameters()Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->params:Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/X9ECParametersHolder;->params:Lorg/spongycastle/asn1/x9/X9ECParameters;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-object v0

    .line 19
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method
