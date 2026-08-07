.class public final enum Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

.field public static final enum bind_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bind-email"
    .end annotation
.end field

.field public static final enum bind_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bind-phone"
    .end annotation
.end field

.field public static final enum change_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "change-email"
    .end annotation
.end field

.field public static final enum change_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "change-phone"
    .end annotation
.end field

.field public static final enum forgot_password:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "forgot-password"
    .end annotation
.end field

.field public static final enum signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signin"
    .end annotation
.end field

.field public static final enum signup:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signup"
    .end annotation
.end field

.field public static final enum signup_signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signin-or-signup"
    .end annotation
.end field


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->forgot_password:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup_signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 2
    .line 3
    const-string v1, "signup"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 12
    .line 13
    const-string v1, "forgot_password"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->forgot_password:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 22
    .line 23
    const-string v1, "change_phone"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 32
    .line 33
    const-string v1, "signin"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 42
    .line 43
    const-string v1, "bind_phone"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_phone:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 52
    .line 53
    const-string v1, "signup_signin"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->signup_signin:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 60
    .line 61
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 62
    .line 63
    const-string v1, "change_email"

    .line 64
    .line 65
    const/4 v2, 0x6

    .line 66
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->change_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 70
    .line 71
    new-instance v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 72
    .line 73
    const-string v1, "bind_email"

    .line 74
    .line 75
    const/4 v2, 0x7

    .line 76
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->bind_email:Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->$values()[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sput-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->$VALUES:[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 86
    .line 87
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

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->$VALUES:[Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/account/data/EmailCaptchaAction;

    .line 8
    .line 9
    return-object v0
.end method
