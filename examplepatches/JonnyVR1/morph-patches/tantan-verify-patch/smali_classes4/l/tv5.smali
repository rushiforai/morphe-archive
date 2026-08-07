.class public Ll/tv5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Ll/vml;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x2

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-array v0, v3, [Ljava/lang/String;

    .line 11
    .line 12
    const-string v3, "106.75.93.62"

    .line 13
    .line 14
    aput-object v3, v0, v2

    .line 15
    .line 16
    const-string v2, "117.50.100.144"

    .line 17
    .line 18
    aput-object v2, v0, v1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-array v0, v3, [Ljava/lang/String;

    .line 22
    .line 23
    const-string v3, "106.75.42.76"

    .line 24
    .line 25
    aput-object v3, v0, v2

    .line 26
    .line 27
    const-string v2, "106.75.42.77"

    .line 28
    .line 29
    aput-object v2, v0, v1

    .line 30
    .line 31
    :goto_0
    sput-object v0, Ll/tv5;->a:[Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
