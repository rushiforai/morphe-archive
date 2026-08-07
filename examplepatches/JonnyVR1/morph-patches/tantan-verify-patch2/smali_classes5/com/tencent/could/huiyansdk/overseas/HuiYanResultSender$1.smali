.class public Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/could/component/common/ai/net/IJsonDataListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthGetLive(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

.field public final synthetic val$gson:Lcom/google/gson/Gson;


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Lcom/google/gson/Gson;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->val$gson:Lcom/google/gson/Gson;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFailed(Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "GET_LIGHT_TYPE network error: "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x2

    .line 18
    const-string v3, "HuiYanResultSender"

    .line 19
    .line 20
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 24
    .line 25
    sget v0, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_network_connect_error:I

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0xd2

    .line 32
    .line 33
    invoke-virtual {p0, v1, v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$100(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onSuccess(Ljava/lang/String;)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->val$gson:Lcom/google/gson/Gson;

    .line 2
    .line 3
    const-class v1, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 15
    .line 16
    const-string v1, "HuiYanResultSender"

    .line 17
    .line 18
    const-string v2, "huiYanOsAuthLight is null"

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 24
    .line 25
    sget p1, Lcom/tencent/cloud/overseas/R$string;->hy_overseas_network_connect_error:I

    .line 26
    .line 27
    invoke-static {p1}, Lcom/tencent/could/huiyansdk/utils/d;->a(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/16 v0, 0xd2

    .line 32
    .line 33
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v2}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$100(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->getCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$100(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->getCode()I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->getMessage()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p0, v0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->sendAuthOnFail(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-static {}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->closeCurrentFragment()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    sget-object v1, Lcom/tencent/could/huiyansdk/operate/a$b;->a:Lcom/tencent/could/huiyansdk/operate/a;

    .line 74
    .line 75
    const-string v2, "GetLiveTypeDateUseTime"

    .line 76
    .line 77
    const/4 v3, 0x0

    .line 78
    const-string v4, ""

    .line 79
    .line 80
    invoke-virtual {v1, v2, v0, v3, v4}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-object v5, v1, Lcom/tencent/could/huiyansdk/operate/a;->a:Lcom/tencent/could/huiyansdk/operate/HuiYanOperateBody;

    .line 84
    .line 85
    if-eqz v5, :cond_2

    .line 86
    .line 87
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 88
    .line 89
    .line 90
    move-result-wide v10

    .line 91
    const-string v6, "GetLiveTypeData"

    .line 92
    .line 93
    const/4 v7, 0x1

    .line 94
    const-wide/16 v8, 0x1

    .line 95
    .line 96
    invoke-virtual/range {v5 .. v11}, Lcom/tencent/could/huiyansdk/operate/CloudOperateBody;->updateInfo(Ljava/lang/String;IJJ)V

    .line 97
    .line 98
    .line 99
    :cond_2
    const-string v0, "LocalCheckUseTime"

    .line 100
    .line 101
    const/4 v2, 0x1

    .line 102
    invoke-virtual {v1, v0, v2, v3, v4}, Lcom/tencent/could/huiyansdk/operate/a;->a(Ljava/lang/String;IZLjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender$1;->this$0:Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight;->getData()Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/tencent/could/huiyansdk/entity/HuiYanOsAuthLight$Data;->getLightData()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p0, p1}, Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;->access$200(Lcom/tencent/could/huiyansdk/overseas/HuiYanResultSender;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method
