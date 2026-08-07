.class public Lcom/sina/weibo/sdk/web/WebPicUploadResult;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final RESP_UPLOAD_PIC_PARAM_CODE:Ljava/lang/String; = "code"

.field public static final RESP_UPLOAD_PIC_PARAM_DATA:Ljava/lang/String; = "data"

.field public static final RESP_UPLOAD_PIC_SUCC_CODE:I = 0x1


# instance fields
.field private code:I

.field private picId:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x2

    .line 5
    iput v0, p0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;->code:I

    .line 6
    .line 7
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/sina/weibo/sdk/web/WebPicUploadResult;
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/sina/weibo/sdk/web/WebPicUploadResult;-><init>()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p0, "code"

    .line 20
    .line 21
    const/4 v2, -0x2

    .line 22
    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    iput p0, v0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;->code:I

    .line 27
    .line 28
    const-string p0, "data"

    .line 29
    .line 30
    const-string v2, ""

    .line 31
    .line 32
    invoke-virtual {v1, p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iput-object p0, v0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;->picId:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    :catch_0
    return-object v0
.end method


# virtual methods
.method public getCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;->code:I

    .line 2
    .line 3
    return p0
.end method

.method public getPicId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/web/WebPicUploadResult;->picId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
