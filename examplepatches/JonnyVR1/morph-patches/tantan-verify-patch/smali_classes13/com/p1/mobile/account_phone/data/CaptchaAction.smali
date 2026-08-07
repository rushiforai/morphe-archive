.class public final enum Lcom/p1/mobile/account_phone/data/CaptchaAction;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/account_phone/data/CaptchaAction;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/account_phone/data/CaptchaAction;

.field public static final enum bind_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bind-phone"
    .end annotation
.end field

.field public static final enum change_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "change-phone"
    .end annotation
.end field

.field public static final enum forgot_password:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "forgot-password"
    .end annotation
.end field

.field public static final enum signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signin"
    .end annotation
.end field

.field public static final enum signup:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signup"
    .end annotation
.end field

.field public static final enum signup_signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "signin-or-signup"
    .end annotation
.end field


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/account_phone/data/CaptchaAction;->forgot_password:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/account_phone/data/CaptchaAction;->change_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/account_phone/data/CaptchaAction;->bind_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup_signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 12
    .line 13
    filled-new-array/range {v0 .. v5}, [Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 2
    .line 3
    const-string v1, "signup"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 12
    .line 13
    const-string v1, "forgot_password"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->forgot_password:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 22
    .line 23
    const-string v1, "change_phone"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->change_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 32
    .line 33
    const-string v1, "signin"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 40
    .line 41
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 42
    .line 43
    const-string v1, "bind_phone"

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->bind_phone:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 52
    .line 53
    const-string v1, "signup_signin"

    .line 54
    .line 55
    const/4 v2, 0x5

    .line 56
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/account_phone/data/CaptchaAction;-><init>(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->signup_signin:Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/account_phone/data/CaptchaAction;->$values()[Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->$VALUES:[Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 66
    .line 67
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

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/account_phone/data/CaptchaAction;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/account_phone/data/CaptchaAction;->$VALUES:[Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/account_phone/data/CaptchaAction;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/account_phone/data/CaptchaAction;

    .line 8
    .line 9
    return-object v0
.end method
