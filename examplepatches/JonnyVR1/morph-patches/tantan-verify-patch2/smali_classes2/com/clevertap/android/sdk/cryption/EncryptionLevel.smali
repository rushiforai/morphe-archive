.class public final enum Lcom/clevertap/android/sdk/cryption/EncryptionLevel;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/clevertap/android/sdk/cryption/EncryptionLevel;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\t\u0008\u0086\u0081\u0002\u0018\u0000 \u000c2\u0008\u0012\u0004\u0012\u00020\u00000\u0001:\u0001\rB\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\r\u0010\u0006\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010\u000bj\u0002\u0008\u000ej\u0002\u0008\u000fj\u0002\u0008\u0010\u00a8\u0006\u0011"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/cryption/EncryptionLevel;",
        "",
        "",
        "value",
        "<init>",
        "(Ljava/lang/String;II)V",
        "intValue",
        "()I",
        "",
        "shouldEncrypt",
        "()Z",
        "I",
        "Companion",
        "a",
        "NONE",
        "MEDIUM",
        "FULL_DATA",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

.field public static final Companion:Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final enum FULL_DATA:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

.field public static final enum MEDIUM:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

.field public static final enum NONE:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;


# instance fields
.field private final value:I


# direct methods
.method private static final synthetic $values()[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;
    .locals 3

    sget-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->NONE:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    sget-object v1, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->MEDIUM:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    sget-object v2, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->FULL_DATA:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    filled-new-array {v0, v1, v2}, [Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->NONE:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 10
    .line 11
    new-instance v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 12
    .line 13
    const-string v1, "MEDIUM"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->MEDIUM:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 20
    .line 21
    new-instance v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 22
    .line 23
    const-string v1, "FULL_DATA"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v2}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->FULL_DATA:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 30
    .line 31
    invoke-static {}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->$values()[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->$VALUES:[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 36
    .line 37
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 42
    .line 43
    new-instance v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->Companion:Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;

    .line 50
    .line 51
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->value:I

    .line 5
    .line 6
    return-void
.end method

.method public static final synthetic access$getValue$p(Lcom/clevertap/android/sdk/cryption/EncryptionLevel;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->value:I

    .line 2
    .line 3
    return p0
.end method

.method public static final fromInt(I)Lcom/clevertap/android/sdk/cryption/EncryptionLevel;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->Companion:Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;

    invoke-virtual {v0, p0}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel$a;->a(I)Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    move-result-object p0

    return-object p0
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/clevertap/android/sdk/cryption/EncryptionLevel;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/clevertap/android/sdk/cryption/EncryptionLevel;
    .locals 1

    .line 1
    const-class v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;
    .locals 1

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->$VALUES:[Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public final intValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->value:I

    .line 2
    .line 3
    return p0
.end method

.method public final shouldEncrypt()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->value:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
