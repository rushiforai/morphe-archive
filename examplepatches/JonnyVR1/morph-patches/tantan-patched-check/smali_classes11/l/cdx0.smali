.class public final Ll/cdx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/yhx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/bdx0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bdx0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cdx0;->a:Ll/yhx0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p0, v0, :cond_0

    .line 3
    .line 4
    add-int/lit8 p0, p0, -0x2

    .line 5
    .line 6
    return p0

    .line 7
    :cond_0
    const-string p0, "Can\'t get the number of an unknown enum value."

    .line 8
    .line 9
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0
.end method
