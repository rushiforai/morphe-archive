.class public Ll/cp0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:D

.field public b:D

.field public c:D

.field public d:D


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/graphics/Rect;)Ll/cp0;
    .locals 3

    .line 1
    new-instance v0, Ll/cp0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/cp0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-double v1, v1

    .line 11
    iput-wide v1, v0, Ll/cp0;->a:D

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    int-to-double v1, v1

    .line 18
    iput-wide v1, v0, Ll/cp0;->b:D

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    int-to-double v1, v1

    .line 25
    iput-wide v1, v0, Ll/cp0;->c:D

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    int-to-double v1, p0

    .line 32
    iput-wide v1, v0, Ll/cp0;->d:D

    .line 33
    .line 34
    return-object v0
.end method


# virtual methods
.method public b()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cp0;->d:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()D
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cp0;->c:D

    .line 2
    .line 3
    return-wide v0
.end method
