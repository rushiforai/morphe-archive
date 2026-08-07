.class public final enum Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/fourthline/cling/support/lastchange/LastChangeParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CONSTANTS"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

.field public static final enum Event:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

.field public static final enum InstanceID:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

.field public static final enum val:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 2
    .line 3
    const-string v1, "Event"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->Event:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 10
    .line 11
    new-instance v1, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 12
    .line 13
    const-string v2, "InstanceID"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->InstanceID:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 20
    .line 21
    new-instance v2, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 22
    .line 23
    const-string v3, "val"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->val:Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->$VALUES:[Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

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

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;
    .locals 1

    .line 1
    sget-object v0, Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->$VALUES:[Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/fourthline/cling/support/lastchange/LastChangeParser$CONSTANTS;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
