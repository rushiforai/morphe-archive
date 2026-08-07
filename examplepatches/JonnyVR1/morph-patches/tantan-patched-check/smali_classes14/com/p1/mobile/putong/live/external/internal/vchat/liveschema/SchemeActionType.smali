.class public abstract enum Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

.field public static final enum ACTION_SHOW_GIFT_DIALOG:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

.field public static final enum ACTION_SHOW_H5:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;


# instance fields
.field private action:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->ACTION_SHOW_H5:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->ACTION_SHOW_GIFT_DIALOG:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType$1;

    .line 2
    .line 3
    const-string v1, "ACTION_SHOW_H5"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "showH5"

    .line 7
    .line 8
    const/4 v4, 0x0

    .line 9
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType$1;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/c3e0;)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->ACTION_SHOW_H5:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType$2;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    const-string v2, "showGiftDialog"

    .line 18
    .line 19
    const-string v3, "ACTION_SHOW_GIFT_DIALOG"

    .line 20
    .line 21
    invoke-direct {v0, v3, v1, v2, v4}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType$2;-><init>(Ljava/lang/String;ILjava/lang/String;Ll/c3e0;)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->ACTION_SHOW_GIFT_DIALOG:Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->$values()[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->$VALUES:[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 31
    .line 32
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
    iput-object p3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->action:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ILjava/lang/String;Ll/c3e0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->$VALUES:[Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/liveschema/SchemeActionType;->action:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract getSchemaAction()Ll/p2e0;
.end method
