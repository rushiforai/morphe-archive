.class final enum Lcom/leanplum/internal/AESCrypt$EncryptionType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/internal/AESCrypt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "EncryptionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/leanplum/internal/AESCrypt$EncryptionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/leanplum/internal/AESCrypt$EncryptionType;

.field public static final enum APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

.field public static final enum LEGACY_TOKEN:Lcom/leanplum/internal/AESCrypt$EncryptionType;


# instance fields
.field public final id:I

.field public final prefix:Ljava/lang/String;

.field public final prefixWithBracket:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;

    const-string v1, "LEGACY_TOKEN"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/leanplum/internal/AESCrypt$EncryptionType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->LEGACY_TOKEN:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    new-instance v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;

    const-string v2, "APP_ID_KEY"

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v3}, Lcom/leanplum/internal/AESCrypt$EncryptionType;-><init>(Ljava/lang/String;II)V

    sput-object v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    filled-new-array {v0, v1}, [Lcom/leanplum/internal/AESCrypt$EncryptionType;

    move-result-object v0

    sput-object v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->$VALUES:[Lcom/leanplum/internal/AESCrypt$EncryptionType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->id:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "%02d"

    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->prefix:Ljava/lang/String;

    const-string p2, "["

    invoke-virtual {p1, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->prefixWithBracket:Ljava/lang/String;

    return-void
.end method

.method private static forId(I)Lcom/leanplum/internal/AESCrypt$EncryptionType;
    .registers 2

    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    sget-object p0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    return-object p0

    :cond_6
    const/4 p0, 0x0

    return-object p0
.end method

.method public static parseCipherText(Ljava/lang/String;)Landroid/util/Pair;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Lcom/leanplum/internal/AESCrypt$EncryptionType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_33

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_33

    const-string v1, "["

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_18

    sget-object v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->LEGACY_TOKEN:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-static {v0, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p0

    return-object p0

    :cond_18
    sget-object v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    iget-object v2, v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->prefixWithBracket:Ljava/lang/String;

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_33

    iget-object v0, v1, Lcom/leanplum/internal/AESCrypt$EncryptionType;->prefixWithBracket:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p0

    return-object p0

    :cond_33
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/leanplum/internal/AESCrypt$EncryptionType;
    .registers 2

    const-class v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/leanplum/internal/AESCrypt$EncryptionType;

    return-object p0
.end method

.method public static values()[Lcom/leanplum/internal/AESCrypt$EncryptionType;
    .registers 1

    sget-object v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->$VALUES:[Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-virtual {v0}, [Lcom/leanplum/internal/AESCrypt$EncryptionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/leanplum/internal/AESCrypt$EncryptionType;

    return-object v0
.end method
