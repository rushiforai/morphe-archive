.class public Ll/b0f;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lv/VFrame;",
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
.method public H(Lv/VFrame;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget p0, Ll/bnl0;->e:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    new-array v0, v0, [Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput-object p1, v0, v1

    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    const/high16 p0, 0x43010000    # 129.0f

    .line 16
    .line 17
    invoke-static {p0}, Ll/bnl0;->w(F)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p1, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b0f;->H(Lv/VFrame;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->G0:I

    .line 2
    .line 3
    return p0
.end method
