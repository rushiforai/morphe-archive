.class public final enum Lorg/eclipse/jetty/security/UserDataConstraint;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/eclipse/jetty/security/UserDataConstraint;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/eclipse/jetty/security/UserDataConstraint;

.field public static final enum Confidential:Lorg/eclipse/jetty/security/UserDataConstraint;

.field public static final enum Integral:Lorg/eclipse/jetty/security/UserDataConstraint;

.field public static final enum None:Lorg/eclipse/jetty/security/UserDataConstraint;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 2
    .line 3
    const-string v1, "None"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Lorg/eclipse/jetty/security/UserDataConstraint;-><init>(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/eclipse/jetty/security/UserDataConstraint;->None:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 10
    .line 11
    new-instance v1, Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 12
    .line 13
    const-string v2, "Integral"

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-direct {v1, v2, v3}, Lorg/eclipse/jetty/security/UserDataConstraint;-><init>(Ljava/lang/String;I)V

    .line 17
    .line 18
    .line 19
    sput-object v1, Lorg/eclipse/jetty/security/UserDataConstraint;->Integral:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 20
    .line 21
    new-instance v2, Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 22
    .line 23
    const-string v3, "Confidential"

    .line 24
    .line 25
    const/4 v4, 0x2

    .line 26
    invoke-direct {v2, v3, v4}, Lorg/eclipse/jetty/security/UserDataConstraint;-><init>(Ljava/lang/String;I)V

    .line 27
    .line 28
    .line 29
    sput-object v2, Lorg/eclipse/jetty/security/UserDataConstraint;->Confidential:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 30
    .line 31
    filled-new-array {v0, v1, v2}, [Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    sput-object v0, Lorg/eclipse/jetty/security/UserDataConstraint;->$VALUES:[Lorg/eclipse/jetty/security/UserDataConstraint;

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

.method public static get(I)Lorg/eclipse/jetty/security/UserDataConstraint;
    .locals 2

    .line 1
    const/4 v0, -0x1

    .line 2
    if-lt p0, v0, :cond_1

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-gt p0, v1, :cond_1

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lorg/eclipse/jetty/security/UserDataConstraint;->None:Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {}, Lorg/eclipse/jetty/security/UserDataConstraint;->values()[Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    aget-object p0, v0, p0

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string v0, "Expected -1, 0, 1, or 2, not: "

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/eclipse/jetty/security/UserDataConstraint;
    .locals 1

    .line 1
    const-class v0, Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lorg/eclipse/jetty/security/UserDataConstraint;
    .locals 1

    .line 1
    sget-object v0, Lorg/eclipse/jetty/security/UserDataConstraint;->$VALUES:[Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lorg/eclipse/jetty/security/UserDataConstraint;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lorg/eclipse/jetty/security/UserDataConstraint;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public combine(Lorg/eclipse/jetty/security/UserDataConstraint;)Lorg/eclipse/jetty/security/UserDataConstraint;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    return-object p1
.end method
