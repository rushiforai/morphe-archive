.class public Ll/n6d0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "wordAliPay"

    .line 2
    .line 3
    const-string v1, "\u652f\u4ed8\u6709\u793c \u6700\u9ad888\u5143"

    .line 4
    .line 5
    const-string v2, "REV_ali_sell"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/putong/api/ABManager;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method public static b()Ljava/lang/String;
    .locals 3

    .line 1
    const-string v0, "wordWechat"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const-string v2, "REV_ali_sell"

    .line 6
    .line 7
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/putong/api/ABManager;->Q(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method
