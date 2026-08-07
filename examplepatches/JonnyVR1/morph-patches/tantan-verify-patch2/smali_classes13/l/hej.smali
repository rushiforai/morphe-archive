.class public Ll/hej;
.super Ll/zej;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/zej;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/zej;->T1(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public M1()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/zej;->drawFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public drawFrame()V
    .locals 0

    .line 1
    return-void
.end method
