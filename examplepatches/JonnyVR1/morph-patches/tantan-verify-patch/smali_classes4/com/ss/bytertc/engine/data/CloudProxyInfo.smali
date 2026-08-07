.class public Lcom/ss/bytertc/engine/data/CloudProxyInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cloudProxyIp:Ljava/lang/String;

.field public cloudProxyPort:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/data/CloudProxyInfo;->cloudProxyIp:Ljava/lang/String;

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/data/CloudProxyInfo;->cloudProxyPort:I

    .line 7
    .line 8
    return-void
.end method
