.class public Lorg/fourthline/cling/model/DiscoveryOptions;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static simpleName:Ljava/lang/String; = "DiscoveryOptions"


# instance fields
.field protected advertised:Z

.field protected byeByeBeforeFirstAlive:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-boolean p1, p0, Lorg/fourthline/cling/model/DiscoveryOptions;->advertised:Z

    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/fourthline/cling/model/DiscoveryOptions;->advertised:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Lorg/fourthline/cling/model/DiscoveryOptions;->byeByeBeforeFirstAlive:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public isAdvertised()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/model/DiscoveryOptions;->advertised:Z

    .line 2
    .line 3
    return p0
.end method

.method public isByeByeBeforeFirstAlive()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/fourthline/cling/model/DiscoveryOptions;->byeByeBeforeFirstAlive:Z

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "("

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Lorg/fourthline/cling/model/DiscoveryOptions;->simpleName:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ") advertised: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DiscoveryOptions;->isAdvertised()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " byebyeBeforeFirstAlive: "

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lorg/fourthline/cling/model/DiscoveryOptions;->isByeByeBeforeFirstAlive()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method
