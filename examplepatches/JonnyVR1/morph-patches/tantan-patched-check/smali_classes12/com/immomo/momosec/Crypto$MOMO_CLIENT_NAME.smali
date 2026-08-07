.class public final enum Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

.field public static final enum MOMO_CLIENT_NAMED_MATCHMAKER:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

.field public static final enum MOMO_CLIENT_NAMED_VCHAT:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

.field public static final enum MOMO_CLIENT_NAMED_VOGA:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

.field public static final enum MOMO_CLIENT_NAMED_XIAOMO:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    const-string v1, "MOMO_CLIENT_NAMED_XIAOMO"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->MOMO_CLIENT_NAMED_XIAOMO:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    new-instance v1, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    const-string v2, "MOMO_CLIENT_NAMED_MATCHMAKER"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->MOMO_CLIENT_NAMED_MATCHMAKER:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    new-instance v2, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    const-string v3, "MOMO_CLIENT_NAMED_VOGA"

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->MOMO_CLIENT_NAMED_VOGA:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    new-instance v3, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    const-string v4, "MOMO_CLIENT_NAMED_VCHAT"

    const/4 v5, 0x3

    invoke-direct {v3, v4, v5}, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->MOMO_CLIENT_NAMED_VCHAT:Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    filled-new-array {v0, v1, v2, v3}, [Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    move-result-object v0

    sput-object v0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->$VALUES:[Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;
    .locals 1

    const-class v0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    return-object p0
.end method

.method public static values()[Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;
    .locals 1

    sget-object v0, Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->$VALUES:[Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    invoke-virtual {v0}, [Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/momosec/Crypto$MOMO_CLIENT_NAME;

    return-object v0
.end method
