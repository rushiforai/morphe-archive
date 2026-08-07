.class public final enum Ljavax/servlet/DispatcherType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Ljavax/servlet/DispatcherType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Ljavax/servlet/DispatcherType;

.field public static final enum ASYNC:Ljavax/servlet/DispatcherType;

.field public static final enum ERROR:Ljavax/servlet/DispatcherType;

.field public static final enum FORWARD:Ljavax/servlet/DispatcherType;

.field public static final enum INCLUDE:Ljavax/servlet/DispatcherType;

.field public static final enum REQUEST:Ljavax/servlet/DispatcherType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Ljavax/servlet/DispatcherType;

    .line 2
    .line 3
    const-string v1, "FORWARD"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ljavax/servlet/DispatcherType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Ljavax/servlet/DispatcherType;->FORWARD:Ljavax/servlet/DispatcherType;

    .line 10
    .line 11
    new-instance v1, Ljavax/servlet/DispatcherType;

    .line 12
    .line 13
    const-string v2, "INCLUDE"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Ljavax/servlet/DispatcherType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Ljavax/servlet/DispatcherType;->INCLUDE:Ljavax/servlet/DispatcherType;

    .line 20
    .line 21
    new-instance v2, Ljavax/servlet/DispatcherType;

    .line 22
    .line 23
    const-string v3, "REQUEST"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Ljavax/servlet/DispatcherType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Ljavax/servlet/DispatcherType;->REQUEST:Ljavax/servlet/DispatcherType;

    .line 30
    .line 31
    new-instance v3, Ljavax/servlet/DispatcherType;

    .line 32
    .line 33
    const-string v4, "ASYNC"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Ljavax/servlet/DispatcherType;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Ljavax/servlet/DispatcherType;->ASYNC:Ljavax/servlet/DispatcherType;

    .line 40
    .line 41
    new-instance v4, Ljavax/servlet/DispatcherType;

    .line 42
    .line 43
    const-string v5, "ERROR"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6}, Ljavax/servlet/DispatcherType;-><init>(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Ljavax/servlet/DispatcherType;->ERROR:Ljavax/servlet/DispatcherType;

    .line 50
    .line 51
    filled-new-array {v0, v1, v2, v3, v4}, [Ljavax/servlet/DispatcherType;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sput-object v0, Ljavax/servlet/DispatcherType;->$VALUES:[Ljavax/servlet/DispatcherType;

    .line 56
    .line 57
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

.method public static valueOf(Ljava/lang/String;)Ljavax/servlet/DispatcherType;
    .locals 1

    .line 1
    const-class v0, Ljavax/servlet/DispatcherType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljavax/servlet/DispatcherType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Ljavax/servlet/DispatcherType;
    .locals 1

    .line 1
    sget-object v0, Ljavax/servlet/DispatcherType;->$VALUES:[Ljavax/servlet/DispatcherType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Ljavax/servlet/DispatcherType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Ljavax/servlet/DispatcherType;

    .line 8
    .line 9
    return-object v0
.end method
