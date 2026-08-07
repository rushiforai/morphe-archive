.class public abstract Ll/bc1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field protected a:I

.field protected b:I

.field protected c:I


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


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract b(Ll/ad60;IJ)Ll/ad60;
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public d(III)V
    .locals 0

    .line 1
    iput p1, p0, Ll/bc1;->a:I

    .line 2
    .line 3
    iput p2, p0, Ll/bc1;->b:I

    .line 4
    .line 5
    iput p3, p0, Ll/bc1;->c:I

    .line 6
    .line 7
    return-void
.end method
