.class Ll/grf0$c;
.super Ll/pn2;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pn2<",
        "Ll/grf0$b;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/pn2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a()Ll/dj80;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/grf0$c;->d()Ll/grf0$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Ll/grf0$b;
    .locals 1

    .line 1
    new-instance v0, Ll/grf0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/grf0$b;-><init>(Ll/grf0$c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public e(ILandroid/graphics/Bitmap$Config;)Ll/grf0$b;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pn2;->b()Ll/dj80;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/grf0$b;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/grf0$b;->b(ILandroid/graphics/Bitmap$Config;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method
