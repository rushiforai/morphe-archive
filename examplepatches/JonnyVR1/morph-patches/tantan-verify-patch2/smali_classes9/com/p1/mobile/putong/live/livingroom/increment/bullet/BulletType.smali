.class public abstract enum Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

.field public static final enum CALL_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

.field public static final enum DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

.field public static final enum PK_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

.field public static final enum SPECIAL_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->SPECIAL_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->PK_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->CALL_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$1;

    .line 2
    .line 3
    const-string v1, "DEFAULT_BULLET_STYLE"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$1;-><init>(Ljava/lang/String;ILl/oi3;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->DEFAULT_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 11
    .line 12
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$2;

    .line 13
    .line 14
    const-string v1, "SPECIAL_BULLET_STYLE"

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$2;-><init>(Ljava/lang/String;ILl/oi3;)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->SPECIAL_BULLET_STYLE:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$3;

    .line 23
    .line 24
    const-string v1, "PK_BULLET"

    .line 25
    .line 26
    const/4 v2, 0x2

    .line 27
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$3;-><init>(Ljava/lang/String;ILl/oi3;)V

    .line 28
    .line 29
    .line 30
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->PK_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$4;

    .line 33
    .line 34
    const-string v1, "CALL_BULLET"

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    invoke-direct {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType$4;-><init>(Ljava/lang/String;ILl/oi3;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->CALL_BULLET:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->$values()[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 47
    .line 48
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILl/oi3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->$VALUES:[Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public abstract getLayoutId()I
.end method
