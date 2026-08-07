.class public Ll/lmb0;
.super Ll/v310;
.source "SourceFile"


# static fields
.field public static c:I = 0x0

.field public static d:I = 0x1

.field public static e:I = 0x2

.field public static f:I = 0x3

.field public static g:I = 0x4

.field public static h:I = 0x5

.field public static i:I = 0x6

.field public static j:I = 0x7

.field public static k:I = 0x8

.field public static l:I = 0x9

.field public static m:I = 0xa

.field public static n:I = 0xb

.field public static o:I = 0xc

.field public static p:I = 0xd

.field public static q:I = 0x10


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/v310;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/lmb0;->q:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    new-array v0, v0, [Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Ll/v310;->a:[Ljava/lang/String;

    .line 11
    .line 12
    array-length p0, v0

    .line 13
    const/4 v1, 0x0

    .line 14
    :goto_0
    if-ge v1, p0, :cond_0

    .line 15
    .line 16
    aget-object v2, v0, v1

    .line 17
    .line 18
    add-int/lit8 v1, v1, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method
