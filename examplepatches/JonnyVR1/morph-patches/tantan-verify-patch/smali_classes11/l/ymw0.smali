.class public abstract Ll/ymw0;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static c()Ll/xmw0;
    .locals 2

    .line 1
    new-instance v0, Ll/bmw0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bmw0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x1fd6

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/bmw0;->b(I)Ll/xmw0;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b()Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method
