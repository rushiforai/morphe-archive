.class public final enum Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/util/FriendPurposeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FitnessType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

.field public static final enum habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

.field public static final enum no_habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

.field public static final enum not_reveal:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

.field public static final enum occasionally:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;


# instance fields
.field final value:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->occasionally:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->no_habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->not_reveal:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 8
    .line 9
    filled-new-array {v0, v1, v2, v3}, [Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

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
    new-instance v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "\u6709\u5065\u8eab\u4e60\u60ef"

    .line 5
    .line 6
    const-string v3, "habit"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    const-string v2, "\u5076\u5c14\u5065\u8eab"

    .line 17
    .line 18
    const-string v3, "occasionally"

    .line 19
    .line 20
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->occasionally:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 26
    .line 27
    const/4 v1, 0x2

    .line 28
    const-string v2, "\u65e0\u5065\u8eab\u4e60\u60ef"

    .line 29
    .line 30
    const-string v3, "no_habit"

    .line 31
    .line 32
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->no_habit:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 38
    .line 39
    const/4 v1, 0x3

    .line 40
    const-string v2, "\u6682\u4e0d\u900f\u9732"

    .line 41
    .line 42
    const-string v3, "not_reveal"

    .line 43
    .line 44
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sput-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->not_reveal:Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->$values()[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->$VALUES:[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 54
    .line 55
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
    iput-object p3, p0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->value:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static getDes(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->values()[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const/4 v2, 0x0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_1

    .line 8
    .line 9
    aget-object v3, v0, v2

    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static {p0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    iget-object p0, v3, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->value:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const-string p0, ""

    .line 28
    .line 29
    return-object p0
.end method

.method public static getList()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->values()[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    array-length v3, v1

    .line 12
    if-ge v2, v3, :cond_0

    .line 13
    .line 14
    aget-object v3, v1, v2

    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    add-int/lit8 v2, v2, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->$VALUES:[Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;

    .line 8
    .line 9
    return-object v0
.end method
