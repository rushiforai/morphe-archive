.class final enum Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

.field public static final enum main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

.field public static final enum random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

.field public static final enum shooting_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

.field public static final enum shooting_preview_del:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview_del:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 2
    .line 3
    const-string v1, "main_choose_photo"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->main_choose_photo:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 12
    .line 13
    const-string v1, "shooting_preview"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 22
    .line 23
    const-string v1, "random_preview"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->random_preview:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 32
    .line 33
    const-string v1, "shooting_preview_del"

    .line 34
    .line 35
    const/4 v2, 0x3

    .line 36
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->shooting_preview_del:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->$values()[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 46
    .line 47
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

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->$VALUES:[Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangePresenter$Status;

    .line 8
    .line 9
    return-object v0
.end method
