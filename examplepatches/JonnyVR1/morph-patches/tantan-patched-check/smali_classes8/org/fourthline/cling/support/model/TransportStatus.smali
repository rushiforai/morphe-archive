.class public final enum Lorg/fourthline/cling/support/model/TransportStatus;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/model/TransportStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/model/TransportStatus;

.field public static final enum CUSTOM:Lorg/fourthline/cling/support/model/TransportStatus;

.field public static final enum ERROR_OCCURRED:Lorg/fourthline/cling/support/model/TransportStatus;

.field public static final enum OK:Lorg/fourthline/cling/support/model/TransportStatus;


# instance fields
.field value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/TransportStatus;

    .line 2
    .line 3
    const-string v1, "OK"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/support/model/TransportStatus;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->OK:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 10
    .line 11
    new-instance v1, Lorg/fourthline/cling/support/model/TransportStatus;

    .line 12
    .line 13
    const-string v2, "ERROR_OCCURRED"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lorg/fourthline/cling/support/model/TransportStatus;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lorg/fourthline/cling/support/model/TransportStatus;->ERROR_OCCURRED:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 20
    .line 21
    new-instance v2, Lorg/fourthline/cling/support/model/TransportStatus;

    .line 22
    .line 23
    const-string v3, "CUSTOM"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lorg/fourthline/cling/support/model/TransportStatus;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lorg/fourthline/cling/support/model/TransportStatus;->CUSTOM:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lorg/fourthline/cling/support/model/TransportStatus;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->$VALUES:[Lorg/fourthline/cling/support/model/TransportStatus;

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
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportStatus;->value:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/TransportStatus;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/TransportStatus;

    .line 8
    .line 9
    return-object p0
.end method

.method public static valueOrCustomOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;
    .locals 1

    .line 1
    :try_start_0
    invoke-static {p0}, Lorg/fourthline/cling/support/model/TransportStatus;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    return-object p0

    .line 6
    :catch_0
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->CUSTOM:Lorg/fourthline/cling/support/model/TransportStatus;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Lorg/fourthline/cling/support/model/TransportStatus;->setValue(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/model/TransportStatus;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/model/TransportStatus;->$VALUES:[Lorg/fourthline/cling/support/model/TransportStatus;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/model/TransportStatus;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/model/TransportStatus;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/TransportStatus;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setValue(Ljava/lang/String;)Lorg/fourthline/cling/support/model/TransportStatus;
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/fourthline/cling/support/model/TransportStatus;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
