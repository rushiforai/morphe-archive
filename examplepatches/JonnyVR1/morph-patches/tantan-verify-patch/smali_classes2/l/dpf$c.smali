.class public Ll/dpf$c;
.super Ll/cc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dpf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic b:Ll/dpf;


# direct methods
.method public constructor <init>(Ll/dpf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dpf$c;->b:Ll/dpf;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cc;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(I)Ll/bc;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpf$c;->b:Ll/dpf;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dpf;->obtainAccessibilityNodeInfo(I)Ll/bc;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/bc;->c0(Ll/bc;)Ll/bc;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public d(I)Ll/bc;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dpf$c;->b:Ll/dpf;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    iget p1, v0, Ll/dpf;->mAccessibilityFocusedVirtualViewId:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget p1, v0, Ll/dpf;->mKeyboardFocusedVirtualViewId:I

    .line 10
    .line 11
    :goto_0
    const/high16 v0, -0x80000000

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :cond_1
    invoke-virtual {p0, p1}, Ll/dpf$c;->b(I)Ll/bc;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public f(IILandroid/os/Bundle;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dpf$c;->b:Ll/dpf;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/dpf;->performAction(IILandroid/os/Bundle;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
