.class public final Ll/xds0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/yhx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/vds0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/vds0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/xds0;->a:Ll/yhx0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0x3e8

    .line 7
    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    const/16 p0, 0x3e9

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x2

    .line 16
    return p0

    .line 17
    :cond_2
    return v0
.end method
