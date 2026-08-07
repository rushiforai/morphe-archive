.class public final enum Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

.field public static final enum LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

.field public static final enum REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;


# instance fields
.field beforeCheck:Z

.field desc:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

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
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 2
    .line 3
    const-string v1, "LOCAL_CHECK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const-string v3, "\u672c\u5730\u7684\u6a21\u578b\u8bc6\u522b\uff1a\u4e8c\u7ef4\u7801\uff0c\u6d89\u653f\uff0c\u9ec4\u56fe"

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->LOCAL_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 15
    .line 16
    const-string v1, "REMOTE_CHECK"

    .line 17
    .line 18
    const-string v3, "\u540e\u7aef\u6a21\u578b\u68c0\u6d4b"

    .line 19
    .line 20
    invoke-direct {v0, v1, v4, v3, v2}, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;-><init>(Ljava/lang/String;ILjava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->REMOTE_CHECK:Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->$values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    sput-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 30
    .line 31
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->desc:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p4, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->beforeCheck:Z

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->$VALUES:[Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public isBeforeCheck()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/view/AvatarUpdateCheckType;->beforeCheck:Z

    .line 2
    .line 3
    return p0
.end method
