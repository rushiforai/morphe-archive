.class public Ll/ayt;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/high16 p0, 0x40800000    # 4.0f

    .line 5
    .line 6
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p1, p0}, Ll/ynp0;->m(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->x3:I

    .line 2
    .line 3
    return p0
.end method
