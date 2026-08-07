.class public final enum Lcom/p1/mobile/putong/api/ABManager$Mode;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/ABManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/api/ABManager$Mode;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\t\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000j\u0002\u0008\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/p1/mobile/putong/api/ABManager$Mode;",
        "",
        "mode",
        "",
        "<init>",
        "(Ljava/lang/String;ILjava/lang/String;)V",
        "user",
        "device",
        "uid",
        "toString",
        "putong-common_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/api/ABManager$Mode;

.field public static final enum device:Lcom/p1/mobile/putong/api/ABManager$Mode;

.field public static final enum uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

.field public static final enum user:Lcom/p1/mobile/putong/api/ABManager$Mode;


# instance fields
.field private final mode:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method private static final synthetic $values()[Lcom/p1/mobile/putong/api/ABManager$Mode;
    .locals 3

    sget-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    sget-object v1, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    sget-object v2, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/api/ABManager$Mode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 2
    .line 3
    const-string v1, "user"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/api/ABManager$Mode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->user:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 12
    .line 13
    const-string v1, "device"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/api/ABManager$Mode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->device:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 22
    .line 23
    const-string v1, "uid"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2, v1}, Lcom/p1/mobile/putong/api/ABManager$Mode;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->uid:Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager$Mode;->$values()[Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->$VALUES:[Lcom/p1/mobile/putong/api/ABManager$Mode;

    .line 36
    .line 37
    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->a([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->$ENTRIES:Lkotlin/enums/EnumEntries;

    .line 42
    .line 43
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
    iput-object p3, p0, Lcom/p1/mobile/putong/api/ABManager$Mode;->mode:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/p1/mobile/putong/api/ABManager$Mode;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/api/ABManager$Mode;
    .locals 1

    const-class v0, Lcom/p1/mobile/putong/api/ABManager$Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/api/ABManager$Mode;

    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/api/ABManager$Mode;
    .locals 1

    sget-object v0, Lcom/p1/mobile/putong/api/ABManager$Mode;->$VALUES:[Lcom/p1/mobile/putong/api/ABManager$Mode;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/p1/mobile/putong/api/ABManager$Mode;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/api/ABManager$Mode;->mode:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
