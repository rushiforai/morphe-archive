.class public Ll/x1c;
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

.method public static final a()Ll/o6e;
    .locals 1

    .line 1
    sget-boolean v0, Ll/l3d0;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/qiw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/qiw;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget-object v0, Ll/o6e;->a:Ll/o6e;

    .line 12
    .line 13
    return-object v0
.end method
