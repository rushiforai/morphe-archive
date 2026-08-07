.class public Ll/m6r0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/String;

.field public static b:Z

.field private static c:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-boolean v0, Ll/jsq0;->a:Z

    .line 2
    .line 3
    const-string v1, "ONEBOX"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    move-object v0, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const-string v0, "@SHIP.TO.2A2FE0D7@"

    .line 10
    .line 11
    :goto_0
    sput-object v0, Ll/m6r0;->a:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    sput-boolean v2, Ll/m6r0;->b:Z

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    sput v2, Ll/m6r0;->c:I

    .line 18
    .line 19
    const-string v3, "SANDBOX"

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    sput v0, Ll/m6r0;->c:I

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x3

    .line 38
    sput v0, Ll/m6r0;->c:I

    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    sput v2, Ll/m6r0;->c:I

    .line 42
    .line 43
    return-void
.end method

.method public static a()I
    .locals 1

    .line 1
    sget v0, Ll/m6r0;->c:I

    .line 2
    .line 3
    return v0
.end method

.method public static b(I)V
    .locals 0

    .line 1
    sput p0, Ll/m6r0;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public static c()Z
    .locals 2

    .line 1
    sget v0, Ll/m6r0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    return v0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    return v0
.end method

.method public static d()Z
    .locals 2

    .line 1
    sget v0, Ll/m6r0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    return v0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    return v0
.end method
