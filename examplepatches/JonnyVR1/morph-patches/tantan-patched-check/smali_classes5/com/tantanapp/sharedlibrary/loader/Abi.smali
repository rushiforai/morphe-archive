.class public final enum Lcom/tantanapp/sharedlibrary/loader/Abi;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/sharedlibrary/loader/Abi;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0006\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u000f\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/Abi;",
        "",
        "id",
        "",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "getId",
        "()Ljava/lang/String;",
        "ARM_32",
        "ARM_64",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/sharedlibrary/loader/Abi;

.field public static final enum ARM_32:Lcom/tantanapp/sharedlibrary/loader/Abi;

.field public static final enum ARM_64:Lcom/tantanapp/sharedlibrary/loader/Abi;


# instance fields
.field private final id:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/tantanapp/sharedlibrary/loader/Abi;
    .locals 2

    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_32:Lcom/tantanapp/sharedlibrary/loader/Abi;

    sget-object v1, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_64:Lcom/tantanapp/sharedlibrary/loader/Abi;

    filled-new-array {v0, v1}, [Lcom/tantanapp/sharedlibrary/loader/Abi;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "armeabi-v7a"

    .line 5
    .line 6
    const-string v3, "ARM_32"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/tantanapp/sharedlibrary/loader/Abi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_32:Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 12
    .line 13
    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "arm64-v8a"

    .line 17
    .line 18
    const-string v3, "ARM_64"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/tantanapp/sharedlibrary/loader/Abi;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/Abi;->ARM_64:Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 24
    .line 25
    invoke-static {}, Lcom/tantanapp/sharedlibrary/loader/Abi;->$values()[Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/Abi;->$VALUES:[Lcom/tantanapp/sharedlibrary/loader/Abi;

    .line 30
    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/tantanapp/sharedlibrary/loader/Abi;->id:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/sharedlibrary/loader/Abi;
    .locals 1

    const-class v0, Lcom/tantanapp/sharedlibrary/loader/Abi;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/tantanapp/sharedlibrary/loader/Abi;

    return-object p0
.end method

.method public static values()[Lcom/tantanapp/sharedlibrary/loader/Abi;
    .locals 1

    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/Abi;->$VALUES:[Lcom/tantanapp/sharedlibrary/loader/Abi;

    invoke-virtual {v0}, [Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/tantanapp/sharedlibrary/loader/Abi;

    return-object v0
.end method


# virtual methods
.method public final getId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/Abi;->id:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
