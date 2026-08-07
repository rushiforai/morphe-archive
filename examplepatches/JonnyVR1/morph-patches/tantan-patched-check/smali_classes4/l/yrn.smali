.class public Ll/yrn;
.super Ll/upd;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/upd;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(IILandroid/view/View;ILl/txl0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Ll/upd;->s()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    mul-int/lit8 p4, p4, 0x2

    .line 14
    .line 15
    sub-int/2addr p1, p4

    .line 16
    invoke-virtual {p0}, Ll/yrn;->r()I

    .line 17
    .line 18
    .line 19
    move-result p4

    .line 20
    sub-int/2addr p2, p4

    .line 21
    invoke-virtual {p0}, Ll/upd;->t()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sub-int/2addr p2, p0

    .line 26
    const/high16 p0, 0x40000000    # 2.0f

    .line 27
    .line 28
    invoke-static {p1, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {p2, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    invoke-virtual {p3, p1, p0}, Landroid/view/View;->measure(II)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method

.method public r()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
