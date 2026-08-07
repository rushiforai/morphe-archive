.class public Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public localProxyIp:Ljava/lang/String;

.field public localProxyPassword:Ljava/lang/String;

.field public localProxyPort:I

.field public localProxyType:Lcom/ss/bytertc/engine/type/LocalProxyType;

.field public localProxyUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/LocalProxyType;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyType:Lcom/ss/bytertc/engine/type/LocalProxyType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyIp:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyPort:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyUsername:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyPassword:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method
