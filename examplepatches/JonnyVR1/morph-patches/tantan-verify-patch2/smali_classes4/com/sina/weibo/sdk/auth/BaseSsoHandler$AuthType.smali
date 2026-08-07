.class public final enum Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sina/weibo/sdk/auth/BaseSsoHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AuthType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

.field public static final enum ALL:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

.field public static final enum SsoOnly:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

.field public static final enum WebOnly:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 2
    .line 3
    const-string v1, "ALL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->ALL:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 10
    .line 11
    new-instance v1, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 12
    .line 13
    const-string v2, "SsoOnly"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->SsoOnly:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 20
    .line 21
    new-instance v2, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 22
    .line 23
    const-string v3, "WebOnly"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->WebOnly:Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->$VALUES:[Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 36
    .line 37
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;
    .locals 1

    .line 1
    const-class v0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;
    .locals 1

    .line 1
    sget-object v0, Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->$VALUES:[Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/sina/weibo/sdk/auth/BaseSsoHandler$AuthType;

    .line 8
    .line 9
    return-object v0
.end method
