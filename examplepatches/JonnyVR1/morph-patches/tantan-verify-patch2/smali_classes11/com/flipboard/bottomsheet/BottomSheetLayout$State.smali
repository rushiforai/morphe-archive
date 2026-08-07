.class public final enum Lcom/flipboard/bottomsheet/BottomSheetLayout$State;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flipboard/bottomsheet/BottomSheetLayout$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field public static final enum EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field public static final enum HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field public static final enum PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

.field public static final enum PREPARING:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    const-string v1, "HIDDEN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 10
    .line 11
    new-instance v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 12
    .line 13
    const-string v2, "PREPARING"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PREPARING:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 20
    .line 21
    new-instance v2, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 22
    .line 23
    const-string v3, "PEEKED"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 30
    .line 31
    new-instance v3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 32
    .line 33
    const-string v4, "EXPANDED"

    .line 34
    .line 35
    const/4 v5, 0x3

    .line 36
    invoke-direct {v3, v4, v5}, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;-><init>(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    sput-object v3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 40
    .line 41
    filled-new-array {v0, v1, v2, v3}, [Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->$VALUES:[Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

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

.method public static valueOf(Ljava/lang/String;)Lcom/flipboard/bottomsheet/BottomSheetLayout$State;
    .locals 1

    .line 1
    const-class v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/flipboard/bottomsheet/BottomSheetLayout$State;
    .locals 1

    .line 1
    sget-object v0, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->$VALUES:[Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 8
    .line 9
    return-object v0
.end method
