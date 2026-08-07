.class final enum Lcom/p1/mobile/android/app/Dialog$ListType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ListType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/android/app/Dialog$ListType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/android/app/Dialog$ListType;

.field public static final enum MULTI:Lcom/p1/mobile/android/app/Dialog$ListType;

.field public static final enum REGULAR:Lcom/p1/mobile/android/app/Dialog$ListType;

.field public static final enum SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/android/app/Dialog$ListType;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->REGULAR:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/android/app/Dialog$ListType;->SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/android/app/Dialog$ListType;->MULTI:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 2
    .line 3
    const-string v1, "REGULAR"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$ListType;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->REGULAR:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 12
    .line 13
    const-string v1, "SINGLE"

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$ListType;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->SINGLE:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 20
    .line 21
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 22
    .line 23
    const-string v1, "MULTI"

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$ListType;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->MULTI:Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/android/app/Dialog$ListType;->$values()[Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->$VALUES:[Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 36
    .line 37
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

.method public static getLayoutForType(Lcom/p1/mobile/android/app/Dialog$ListType;)I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$d;->b:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-ne p0, v0, :cond_0

    .line 17
    .line 18
    sget p0, Ll/gec0;->B:I

    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    const-string p0, "Not a valid list type"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    sget p0, Ll/gec0;->C:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    sget p0, Ll/gec0;->D:I

    .line 32
    .line 33
    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/android/app/Dialog$ListType;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/android/app/Dialog$ListType;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/Dialog$ListType;->$VALUES:[Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/android/app/Dialog$ListType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/android/app/Dialog$ListType;

    .line 8
    .line 9
    return-object v0
.end method
