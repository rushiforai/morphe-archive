.class final enum Lcom/leanplum/PushProviderType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/PushProviderType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/PushProviderType;

.field public static final enum FCM:Lcom/leanplum/PushProviderType;

.field public static final enum MIPUSH:Lcom/leanplum/PushProviderType;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcom/leanplum/PushProviderType;

    const-string v1, "FCM"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/leanplum/PushProviderType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/leanplum/PushProviderType;->FCM:Lcom/leanplum/PushProviderType;

    new-instance v1, Lcom/leanplum/PushProviderType;

    const-string v2, "MIPUSH"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/leanplum/PushProviderType;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/leanplum/PushProviderType;->MIPUSH:Lcom/leanplum/PushProviderType;

    filled-new-array {v0, v1}, [Lcom/leanplum/PushProviderType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/PushProviderType;->$VALUES:[Lcom/leanplum/PushProviderType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/PushProviderType;
    .registers 2

    const-class v0, Lcom/leanplum/PushProviderType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/PushProviderType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/PushProviderType;
    .registers 1

    sget-object v0, Lcom/leanplum/PushProviderType;->$VALUES:[Lcom/leanplum/PushProviderType;

    invoke-virtual {v0}, [Lcom/leanplum/PushProviderType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/PushProviderType;

    return-object v0
.end method
