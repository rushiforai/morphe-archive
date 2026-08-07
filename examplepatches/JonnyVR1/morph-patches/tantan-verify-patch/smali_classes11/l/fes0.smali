.class public final Ll/fes0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/yhx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/des0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/des0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/fes0;->a:Ll/yhx0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p0, :cond_3

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v0, :cond_2

    .line 6
    .line 7
    if-eq p0, v1, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x4

    .line 10
    if-eq p0, v0, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x5

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x3

    .line 17
    return p0

    .line 18
    :cond_2
    return v1

    .line 19
    :cond_3
    return v0
.end method
