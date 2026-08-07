.class public final enum Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Module"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field public static final enum ACCOUNT:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field public static final enum COMMON:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field public static final enum CORE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field public static final enum FEED:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field public static final enum LIVE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

.field private static final SAVED_BASE_NAME_PREFIX:Ljava/lang/String; = "assets_settings_"


# instance fields
.field final moduleName:Ljava/lang/String;

.field final savedValue:Ll/vxd0;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->COMMON:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->ACCOUNT:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->CORE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->FEED:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->LIVE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "common"

    .line 5
    .line 6
    const-string v3, "COMMON"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->COMMON:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "account"

    .line 17
    .line 18
    const-string v3, "ACCOUNT"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->ACCOUNT:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "core"

    .line 29
    .line 30
    const-string v3, "CORE"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->CORE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "feed"

    .line 41
    .line 42
    const-string v3, "FEED"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->FEED:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 50
    .line 51
    const/4 v1, 0x4

    .line 52
    const-string v2, "live"

    .line 53
    .line 54
    const-string v3, "LIVE"

    .line 55
    .line 56
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->LIVE:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->$values()[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    sput-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->$VALUES:[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 66
    .line 67
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
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
    iput-object p3, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->moduleName:Ljava/lang/String;

    .line 5
    .line 6
    new-instance p1, Ll/vxd0;

    .line 7
    .line 8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v0, "assets_settings_"

    .line 11
    .line 12
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    const/4 p3, 0x0

    .line 23
    invoke-direct {p1, p2, p3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->savedValue:Ll/vxd0;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ljava/lang/Integer;

    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p1}, Ll/hxd0;->obs()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance p2, Ll/i21;

    .line 43
    .line 44
    invoke-direct {p2, p0}, Ll/i21;-><init>(I)V

    .line 45
    .line 46
    .line 47
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic a(ILjava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->Y:Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/mof0;->z()Lrx/c;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->$VALUES:[Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/api/AssetsSettingsBaseApi$Module;

    .line 8
    .line 9
    return-object v0
.end method
