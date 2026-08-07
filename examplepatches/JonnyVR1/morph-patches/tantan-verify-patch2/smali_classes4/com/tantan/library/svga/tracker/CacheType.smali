.class public final enum Lcom/tantan/library/svga/tracker/CacheType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantan/library/svga/tracker/CacheType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantan/library/svga/tracker/CacheType;

.field public static final enum ACTIVE:Lcom/tantan/library/svga/tracker/CacheType;

.field public static final enum ASSETS:Lcom/tantan/library/svga/tracker/CacheType;

.field public static final enum DISK:Lcom/tantan/library/svga/tracker/CacheType;

.field public static final enum MEMORY:Lcom/tantan/library/svga/tracker/CacheType;

.field public static final enum NETWORK:Lcom/tantan/library/svga/tracker/CacheType;


# instance fields
.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u7f51\u7edc\u8d44\u6e90"

    .line 5
    .line 6
    const-string v3, "NETWORK"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/tantan/library/svga/tracker/CacheType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/tantan/library/svga/tracker/CacheType;->NETWORK:Lcom/tantan/library/svga/tracker/CacheType;

    .line 12
    .line 13
    new-instance v1, Lcom/tantan/library/svga/tracker/CacheType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "\u78c1\u76d8\u7f13\u5b58"

    .line 17
    .line 18
    const-string v4, "DISK"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v3}, Lcom/tantan/library/svga/tracker/CacheType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/tantan/library/svga/tracker/CacheType;->DISK:Lcom/tantan/library/svga/tracker/CacheType;

    .line 24
    .line 25
    new-instance v2, Lcom/tantan/library/svga/tracker/CacheType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "Assets\u8d44\u6e90"

    .line 29
    .line 30
    const-string v5, "ASSETS"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v4}, Lcom/tantan/library/svga/tracker/CacheType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/tantan/library/svga/tracker/CacheType;->ASSETS:Lcom/tantan/library/svga/tracker/CacheType;

    .line 36
    .line 37
    new-instance v3, Lcom/tantan/library/svga/tracker/CacheType;

    .line 38
    .line 39
    const/4 v4, 0x3

    .line 40
    const-string v5, "\u5185\u5b58\u7f13\u5b58"

    .line 41
    .line 42
    const-string v6, "MEMORY"

    .line 43
    .line 44
    invoke-direct {v3, v6, v4, v5}, Lcom/tantan/library/svga/tracker/CacheType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v3, Lcom/tantan/library/svga/tracker/CacheType;->MEMORY:Lcom/tantan/library/svga/tracker/CacheType;

    .line 48
    .line 49
    new-instance v4, Lcom/tantan/library/svga/tracker/CacheType;

    .line 50
    .line 51
    const/4 v5, 0x4

    .line 52
    const-string v6, "\u6d3b\u52a8\u7f13\u5b58"

    .line 53
    .line 54
    const-string v7, "ACTIVE"

    .line 55
    .line 56
    invoke-direct {v4, v7, v5, v6}, Lcom/tantan/library/svga/tracker/CacheType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v4, Lcom/tantan/library/svga/tracker/CacheType;->ACTIVE:Lcom/tantan/library/svga/tracker/CacheType;

    .line 60
    .line 61
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/tantan/library/svga/tracker/CacheType;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/tantan/library/svga/tracker/CacheType;->$VALUES:[Lcom/tantan/library/svga/tracker/CacheType;

    .line 66
    .line 67
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
    iput-object p3, p0, Lcom/tantan/library/svga/tracker/CacheType;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantan/library/svga/tracker/CacheType;
    .locals 1

    .line 1
    const-class v0, Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantan/library/svga/tracker/CacheType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantan/library/svga/tracker/CacheType;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/library/svga/tracker/CacheType;->$VALUES:[Lcom/tantan/library/svga/tracker/CacheType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantan/library/svga/tracker/CacheType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantan/library/svga/tracker/CacheType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public value()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/tracker/CacheType;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
