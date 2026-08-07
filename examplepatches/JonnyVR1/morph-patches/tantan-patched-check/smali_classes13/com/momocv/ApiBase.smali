.class public Lcom/momocv/ApiBase;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static clientInfo_:Lcom/momocv/ClientInfo;

.field private static sListener_:Lcom/momocv/OnEventTrackingListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getClientInfo()Lcom/momocv/ClientInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/momocv/ApiBase;->clientInfo_:Lcom/momocv/ClientInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getsListener()Lcom/momocv/OnEventTrackingListener;
    .locals 1

    .line 1
    sget-object v0, Lcom/momocv/ApiBase;->sListener_:Lcom/momocv/OnEventTrackingListener;

    .line 2
    .line 3
    return-object v0
.end method

.method public static setClientInfo(Lcom/momocv/ClientInfo;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momocv/ApiBase;->clientInfo_:Lcom/momocv/ClientInfo;

    .line 2
    .line 3
    return-void
.end method

.method public static setsListener(Lcom/momocv/OnEventTrackingListener;)V
    .locals 0

    .line 1
    sput-object p0, Lcom/momocv/ApiBase;->sListener_:Lcom/momocv/OnEventTrackingListener;

    .line 2
    .line 3
    return-void
.end method
