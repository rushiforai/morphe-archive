.class public Lcom/heytap/mcssdk/mode/MessageStat;
.super Ljava/lang/Object;


# static fields
.field private static final APP_PACKAGE:Ljava/lang/String; = "appPackage"

.field private static final EVENT_ID:Ljava/lang/String; = "eventID"

.field private static final EVENT_TIME:Ljava/lang/String; = "eventTime"

.field private static final GLOBAL_ID:Ljava/lang/String; = "globalID"

.field private static final MESSAGE_TYPE:Ljava/lang/String; = "messageType"

.field private static final PROPERTY:Ljava/lang/String; = "property"

.field private static final TASK_ID:Ljava/lang/String; = "taskID"


# instance fields
.field private mAppPackage:Ljava/lang/String;

.field private mEventId:Ljava/lang/String;

.field private mEventTime:J

.field private mGlobalId:Ljava/lang/String;

.field private mProperty:Ljava/lang/String;

.field private mTaskID:Ljava/lang/String;

.field private mType:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1000

    iput v0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mType:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventTime:J

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 2
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x1000

    iput v0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mType:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventTime:J

    invoke-virtual {p0, p1}, Lcom/heytap/mcssdk/mode/MessageStat;->setType(I)V

    invoke-virtual {p0, p2}, Lcom/heytap/mcssdk/mode/MessageStat;->setAppPackage(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/heytap/mcssdk/mode/MessageStat;->setGlobalId(Ljava/lang/String;)V

    invoke-virtual {p0, p4}, Lcom/heytap/mcssdk/mode/MessageStat;->setTaskID(Ljava/lang/String;)V

    invoke-virtual {p0, p5}, Lcom/heytap/mcssdk/mode/MessageStat;->setEventId(Ljava/lang/String;)V

    invoke-virtual {p0, p6}, Lcom/heytap/mcssdk/mode/MessageStat;->setProperty(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 4
    const/4 v4, 0x0

    const-string v6, ""

    const/16 v1, 0x1000

    const/4 v3, 0x0

    move-object v0, p0

    move-object v2, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    .line 5
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/16 v1, 0x1000

    move-object v0, p0

    move-object v2, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/heytap/mcssdk/mode/MessageStat;
    .locals 5

    const-string v0, ""

    new-instance v1, Lcom/heytap/mcssdk/mode/MessageStat;

    invoke-direct {v1}, Lcom/heytap/mcssdk/mode/MessageStat;-><init>()V

    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "messageType"

    const/4 v3, 0x0

    invoke-virtual {v2, p0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setType(I)V

    const-string p0, "appPackage"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setAppPackage(Ljava/lang/String;)V

    const-string p0, "eventID"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setEventId(Ljava/lang/String;)V

    const-string p0, "globalID"

    invoke-virtual {v2, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setGlobalId(Ljava/lang/String;)V

    const-string p0, "taskID"

    invoke-virtual {v2, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setTaskID(Ljava/lang/String;)V

    const-string p0, "property"

    invoke-virtual {v2, p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/heytap/mcssdk/mode/MessageStat;->setProperty(Ljava/lang/String;)V

    const-string p0, "eventTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, p0, v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/heytap/mcssdk/mode/MessageStat;->setEventTime(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public getAppPackage()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mAppPackage:Ljava/lang/String;

    return-object p0
.end method

.method public getEventId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventId:Ljava/lang/String;

    return-object p0
.end method

.method public getEventTime()J
    .locals 2

    iget-wide v0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventTime:J

    return-wide v0
.end method

.method public getGlobalId()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mGlobalId:Ljava/lang/String;

    return-object p0
.end method

.method public getProperty()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mProperty:Ljava/lang/String;

    return-object p0
.end method

.method public getTaskID()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mTaskID:Ljava/lang/String;

    return-object p0
.end method

.method public getType()I
    .locals 0

    iget p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mType:I

    return p0
.end method

.method public setAppPackage(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mAppPackage:Ljava/lang/String;

    return-void
.end method

.method public setEventId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventId:Ljava/lang/String;

    return-void
.end method

.method public setEventTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventTime:J

    return-void
.end method

.method public setGlobalId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mGlobalId:Ljava/lang/String;

    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mProperty:Ljava/lang/String;

    return-void
.end method

.method public setTaskID(I)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mTaskID:Ljava/lang/String;

    return-void
.end method

.method public setTaskID(Ljava/lang/String;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mTaskID:Ljava/lang/String;

    return-void
.end method

.method public setType(I)V
    .locals 0

    iput p1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mType:I

    return-void
.end method

.method public toJsonObject()Ljava/lang/String;
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "messageType"

    iget v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "eventID"

    iget-object v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "appPackage"

    iget-object v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mAppPackage:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "eventTime"

    iget-wide v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mEventTime:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mGlobalId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "globalID"

    iget-object v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mGlobalId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mTaskID:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "taskID"

    iget-object v2, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mTaskID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    iget-object v1, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mProperty:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "property"

    iget-object p0, p0, Lcom/heytap/mcssdk/mode/MessageStat;->mProperty:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->putOpt(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_2
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
