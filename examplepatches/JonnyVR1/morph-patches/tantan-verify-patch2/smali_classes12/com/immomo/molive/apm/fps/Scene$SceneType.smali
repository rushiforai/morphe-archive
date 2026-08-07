.class public final enum Lcom/immomo/molive/apm/fps/Scene$SceneType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/immomo/molive/apm/fps/Scene$SceneType;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u000b\u0008\u0086\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0011\u0008\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006j\u0002\u0008\u0007j\u0002\u0008\u0008j\u0002\u0008\tj\u0002\u0008\nj\u0002\u0008\u000bj\u0002\u0008\u000cj\u0002\u0008\r\u00a8\u0006\u000e"
    }
    d2 = {
        "com/immomo/molive/apm/fps/Scene$SceneType",
        "",
        "Lcom/immomo/molive/apm/fps/Scene$SceneType;",
        "",
        "SceneType",
        "<init>",
        "(Ljava/lang/String;II)V",
        "NONE",
        "WEB_ACTIVITY_SHOW",
        "WEB_DIALOG_SHOW",
        "LUA_DIALOG_SHOW",
        "LUA_PAGE_SHOW",
        "SVGA_SHOW",
        "ROOM_BANNER_SHOW",
        "apm-tracer_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum LUA_DIALOG_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum LUA_PAGE_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum NONE:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum ROOM_BANNER_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum SVGA_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum WEB_ACTIVITY_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

.field public static final enum WEB_DIALOG_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 2
    .line 3
    const-string v1, "NONE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2, v2}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/immomo/molive/apm/fps/Scene$SceneType;->NONE:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 10
    .line 11
    new-instance v1, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 12
    .line 13
    const-string v2, "WEB_ACTIVITY_SHOW"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3, v3}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/immomo/molive/apm/fps/Scene$SceneType;->WEB_ACTIVITY_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 20
    .line 21
    new-instance v2, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 22
    .line 23
    const-string v3, "WEB_DIALOG_SHOW"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4, v4}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/immomo/molive/apm/fps/Scene$SceneType;->WEB_DIALOG_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 30
    .line 31
    new-instance v3, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 32
    .line 33
    const-string v4, "LUA_DIALOG_SHOW"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5, v5}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/immomo/molive/apm/fps/Scene$SceneType;->LUA_DIALOG_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 40
    .line 41
    new-instance v4, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 42
    .line 43
    const-string v5, "LUA_PAGE_SHOW"

    .line 44
    .line 45
    const/4 v6, 0x4

    .line 46
    invoke-direct {v4, v5, v6, v6}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 47
    .line 48
    .line 49
    sput-object v4, Lcom/immomo/molive/apm/fps/Scene$SceneType;->LUA_PAGE_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 50
    .line 51
    new-instance v5, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 52
    .line 53
    const-string v6, "SVGA_SHOW"

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    invoke-direct {v5, v6, v7, v7}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 57
    .line 58
    .line 59
    sput-object v5, Lcom/immomo/molive/apm/fps/Scene$SceneType;->SVGA_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 60
    .line 61
    new-instance v6, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 62
    .line 63
    const-string v7, "ROOM_BANNER_SHOW"

    .line 64
    .line 65
    const/4 v8, 0x6

    .line 66
    invoke-direct {v6, v7, v8, v8}, Lcom/immomo/molive/apm/fps/Scene$SceneType;-><init>(Ljava/lang/String;II)V

    .line 67
    .line 68
    .line 69
    sput-object v6, Lcom/immomo/molive/apm/fps/Scene$SceneType;->ROOM_BANNER_SHOW:Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 70
    .line 71
    filled-new-array/range {v0 .. v6}, [Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Lcom/immomo/molive/apm/fps/Scene$SceneType;->$VALUES:[Lcom/immomo/molive/apm/fps/Scene$SceneType;

    .line 76
    .line 77
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
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/immomo/molive/apm/fps/Scene$SceneType;
    .locals 1

    const-class v0, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/immomo/molive/apm/fps/Scene$SceneType;

    return-object p0
.end method

.method public static values()[Lcom/immomo/molive/apm/fps/Scene$SceneType;
    .locals 1

    sget-object v0, Lcom/immomo/molive/apm/fps/Scene$SceneType;->$VALUES:[Lcom/immomo/molive/apm/fps/Scene$SceneType;

    invoke-virtual {v0}, [Lcom/immomo/molive/apm/fps/Scene$SceneType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/immomo/molive/apm/fps/Scene$SceneType;

    return-object v0
.end method
