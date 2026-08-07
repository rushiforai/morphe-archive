.class public Ll/uyf0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static c:Ll/uyf0;


# instance fields
.field public a:D

.field public b:D


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const-wide/high16 v0, 0x4044000000000000L    # 40.0

    .line 2
    .line 3
    const-wide/high16 v2, 0x401c000000000000L    # 7.0

    .line 4
    .line 5
    invoke-static {v0, v1, v2, v3}, Ll/uyf0;->a(DD)Ll/uyf0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/uyf0;->c:Ll/uyf0;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>(DD)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/uyf0;->b:D

    .line 5
    .line 6
    iput-wide p3, p0, Ll/uyf0;->a:D

    .line 7
    .line 8
    return-void
.end method

.method public static a(DD)Ll/uyf0;
    .locals 1

    .line 1
    new-instance v0, Ll/uyf0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/b660;->d(D)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    invoke-static {p2, p3}, Ll/b660;->a(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p2

    .line 11
    invoke-direct {v0, p0, p1, p2, p3}, Ll/uyf0;-><init>(DD)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
