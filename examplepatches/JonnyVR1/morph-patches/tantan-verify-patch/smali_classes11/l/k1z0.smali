.class public final Ll/k1z0;
.super Ll/uqy0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/uqy0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i()Ll/k1z0;
    .locals 1

    .line 1
    new-instance v0, Ll/k1z0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/k1z0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public final c(Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-super {p0, p1}, Ll/uqy0;->c(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method
