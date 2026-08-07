.class public final Ll/ies0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/yhx0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/ges0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ges0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ies0;->a:Ll/yhx0;

    .line 7
    .line 8
    return-void
.end method

.method public static a(I)I
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    const/4 v1, 0x2

    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    if-eq p0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x3

    .line 12
    return p0

    .line 13
    :cond_1
    return v1

    .line 14
    :cond_2
    return v0
.end method
