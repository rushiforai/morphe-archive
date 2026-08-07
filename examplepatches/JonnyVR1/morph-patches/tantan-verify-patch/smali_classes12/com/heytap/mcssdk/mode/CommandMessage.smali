.class public Lcom/heytap/mcssdk/mode/CommandMessage;
.super Lcom/heytap/mcssdk/mode/Message;


# static fields
.field public static final APP_KEY:Ljava/lang/String; = "appKey"

.field public static final APP_SECRET:Ljava/lang/String; = "appSecret"

.field public static final CODE:Ljava/lang/String; = "code"

.field public static final COMMANAD_NOTIFICATION_ALLOWANCE:I = 0x3019

.field public static final COMMAND:Ljava/lang/String; = "command"

.field public static final COMMAND_BASE:I = 0x3000

.field public static final COMMAND_CLEAR_ALL_NOTIFICATION:I = 0x3011

.field public static final COMMAND_CLEAR_NOTIFICATION:I = 0x3010

.field public static final COMMAND_CLEAR_NOTIFICATION_TYPE:I = 0x3014

.field public static final COMMAND_CLEAR_PKG_NOTIFICATION:I = 0x3017

.field public static final COMMAND_GET_ACCOUNTS:I = 0x300e

.field public static final COMMAND_GET_ALIAS:I = 0x3005

.field public static final COMMAND_GET_NOTIFICATION_STATUS:I = 0x3015

.field public static final COMMAND_GET_PUSH_STATUS:I = 0x3012

.field public static final COMMAND_GET_TAGS:I = 0x3008

.field public static final COMMAND_PAUSE_PUSH:I = 0x300b

.field public static final COMMAND_REGISTER:I = 0x3001

.field public static final COMMAND_RESUME_PUSH:I = 0x300c

.field public static final COMMAND_SEND_INSTANT_ACK:I = 0x3018

.field public static final COMMAND_SET_ACCOUNTS:I = 0x300d

.field public static final COMMAND_SET_ALIAS:I = 0x3004

.field public static final COMMAND_SET_NOTIFICATION_SETTINGS:I = 0x3016

.field public static final COMMAND_SET_NOTIFICATION_TYPE:I = 0x3013

.field public static final COMMAND_SET_PUSH_TIME:I = 0x300a

.field public static final COMMAND_SET_TAGS:I = 0x3007

.field public static final COMMAND_STATISTIC:I = 0x3003

.field public static final COMMAND_UNREGISTER:I = 0x3002

.field public static final COMMAND_UNSET_ACCOUNTS:I = 0x300f

.field public static final COMMAND_UNSET_ALIAS:I = 0x3006

.field public static final COMMAND_UNSET_TAGS:I = 0x3009

.field public static final PARAMS:Ljava/lang/String; = "params"

.field public static final REGISTER_ID:Ljava/lang/String; = "registerID"

.field public static final SDK_VERSION:Ljava/lang/String; = "sdkVersion"

.field private static final SPLITTER:Ljava/lang/String; = "&"

.field public static final TYPE_ALIAS:Ljava/lang/String; = "alias"

.field public static final TYPE_NULL:Ljava/lang/String; = null

.field public static final TYPE_TAGS:Ljava/lang/String; = "tags"


# instance fields
.field private mAppKey:Ljava/lang/String;

.field private mAppSecret:Ljava/lang/String;

.field private mCommand:I

.field private mContent:Ljava/lang/String;

.field private mParams:Ljava/lang/String;

.field private mRegisterID:Ljava/lang/String;

.field private mResponseCode:I

.field private mSdkVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/heytap/mcssdk/mode/Message;-><init>()V

    const/4 v0, -0x2

    iput v0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mResponseCode:I

    return-void
.end method

.method public static parseToList(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p0, v2

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0

    :cond_3
    return-object v1
.end method

.method public static parseToString(Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "&"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static parseToSubscribeResultList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/heytap/mcssdk/mode/SubscribeResult;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v0, 0x0

    :goto_0
    :try_start_1
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    new-instance v2, Lcom/heytap/mcssdk/mode/SubscribeResult;

    invoke-direct {v2}, Lcom/heytap/mcssdk/mode/SubscribeResult;-><init>()V

    invoke-virtual {v1, p3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/heytap/mcssdk/mode/SubscribeResult;->setContent(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/heytap/mcssdk/mode/SubscribeResult;->setSubscribeId(Ljava/lang/String;)V

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    move-object v1, p1

    goto :goto_1

    :catch_1
    move-exception p0

    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    move-object p1, v1

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p2, "parseToSubscribeResultList--"

    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/heytap/mcssdk/utils/LogUtil;->d(Ljava/lang/String;)V

    return-object p1
.end method


# virtual methods
.method public getAppKey()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mAppKey:Ljava/lang/String;

    return-object p0
.end method

.method public getAppSecret()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mAppSecret:Ljava/lang/String;

    return-object p0
.end method

.method public getCommand()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mCommand:I

    return p0
.end method

.method public getContent()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mContent:Ljava/lang/String;

    return-object p0
.end method

.method public getParams()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mParams:Ljava/lang/String;

    return-object p0
.end method

.method public getRegisterID()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mRegisterID:Ljava/lang/String;

    return-object p0
.end method

.method public getResponseCode()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mResponseCode:I

    return p0
.end method

.method public getSdkVersion()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mSdkVersion:Ljava/lang/String;

    return-object p0
.end method

.method public getType()I
    .locals 0

    const/16 p0, 0x1009

    return p0
.end method

.method public setAppKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mAppKey:Ljava/lang/String;

    return-void
.end method

.method public setAppSecret(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mAppSecret:Ljava/lang/String;

    return-void
.end method

.method public setCommand(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mCommand:I

    return-void
.end method

.method public setContent(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mContent:Ljava/lang/String;

    return-void
.end method

.method public setParams(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mParams:Ljava/lang/String;

    return-void
.end method

.method public setRegisterID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mRegisterID:Ljava/lang/String;

    return-void
.end method

.method public setResponseCode(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mResponseCode:I

    return-void
.end method

.method public setSdkVersion(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mSdkVersion:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CommandMessage{, mRegisterID=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mRegisterID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mSdkVersion=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mSdkVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mCommand="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mCommand:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mContent=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mContent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mResponseCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/heytap/mcssdk/mode/CommandMessage;->mResponseCode:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
