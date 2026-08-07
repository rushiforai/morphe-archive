.class public final enum Lcom/tantanapp/android/injecter/facade/enums/RouteType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/tantanapp/android/injecter/facade/enums/RouteType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum ACTIVITY:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum BOARDCAST:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum CONTENT_PROVIDER:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum FRAGMENT:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum METHOD:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum PROVIDER:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum SERVICE:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

.field public static final enum UNKNOWN:Lcom/tantanapp/android/injecter/facade/enums/RouteType;


# instance fields
.field className:Ljava/lang/String;

.field id:I


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "android.app.Activity"

    .line 5
    .line 6
    const-string v3, "ACTIVITY"

    .line 7
    .line 8
    invoke-direct {v0, v3, v1, v1, v2}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->ACTIVITY:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 12
    .line 13
    new-instance v1, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    const-string v3, "android.app.Service"

    .line 17
    .line 18
    const-string v4, "SERVICE"

    .line 19
    .line 20
    invoke-direct {v1, v4, v2, v2, v3}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->SERVICE:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 24
    .line 25
    new-instance v2, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 26
    .line 27
    const/4 v3, 0x2

    .line 28
    const-string v4, "com.tantanapp.android.injecter.facade.template.IProvider"

    .line 29
    .line 30
    const-string v5, "PROVIDER"

    .line 31
    .line 32
    invoke-direct {v2, v5, v3, v3, v4}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v2, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->PROVIDER:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 36
    .line 37
    new-instance v3, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 38
    .line 39
    const-string v4, "android.app.ContentProvider"

    .line 40
    .line 41
    const-string v5, "CONTENT_PROVIDER"

    .line 42
    .line 43
    const/4 v6, 0x3

    .line 44
    const/4 v7, -0x1

    .line 45
    invoke-direct {v3, v5, v6, v7, v4}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    sput-object v3, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->CONTENT_PROVIDER:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 49
    .line 50
    new-instance v4, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 51
    .line 52
    const-string v5, "BOARDCAST"

    .line 53
    .line 54
    const/4 v6, 0x4

    .line 55
    const-string v8, ""

    .line 56
    .line 57
    invoke-direct {v4, v5, v6, v7, v8}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    sput-object v4, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->BOARDCAST:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 61
    .line 62
    new-instance v5, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 63
    .line 64
    const-string v6, "METHOD"

    .line 65
    .line 66
    const/4 v9, 0x5

    .line 67
    invoke-direct {v5, v6, v9, v7, v8}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sput-object v5, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->METHOD:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 71
    .line 72
    new-instance v6, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 73
    .line 74
    const/4 v8, 0x6

    .line 75
    const-string v9, "android.app.Fragment"

    .line 76
    .line 77
    const-string v10, "FRAGMENT"

    .line 78
    .line 79
    invoke-direct {v6, v10, v8, v7, v9}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sput-object v6, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->FRAGMENT:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 83
    .line 84
    move v8, v7

    .line 85
    new-instance v7, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 86
    .line 87
    const/4 v9, 0x7

    .line 88
    const-string v10, "Unknown route type"

    .line 89
    .line 90
    const-string v11, "UNKNOWN"

    .line 91
    .line 92
    invoke-direct {v7, v11, v9, v8, v10}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v7, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->UNKNOWN:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 96
    .line 97
    filled-new-array/range {v0 .. v7}, [Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sput-object v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->$VALUES:[Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 102
    .line 103
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->id:I

    .line 5
    .line 6
    iput-object p4, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->className:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 5

    .line 1
    invoke-static {}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->values()[Lcom/tantanapp/android/injecter/facade/enums/RouteType;

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
    invoke-virtual {v3}, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->getClassName()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    if-eqz v4, :cond_0

    .line 20
    .line 21
    return-object v3

    .line 22
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget-object p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->UNKNOWN:Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 26
    .line 27
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 1

    .line 1
    const-class v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->$VALUES:[Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/tantanapp/android/injecter/facade/enums/RouteType;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/tantanapp/android/injecter/facade/enums/RouteType;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->className:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public setClassName(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->className:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setId(I)Lcom/tantanapp/android/injecter/facade/enums/RouteType;
    .locals 0

    .line 1
    iput p1, p0, Lcom/tantanapp/android/injecter/facade/enums/RouteType;->id:I

    .line 2
    .line 3
    return-object p0
.end method
