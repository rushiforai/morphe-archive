.class public abstract Ll/n9y0;
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

.method public static d(Ljava/lang/String;)Ll/j9y0;
    .locals 1

    .line 1
    new-instance v0, Ll/a8y0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/a8y0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Ll/a8y0;->d(Ljava/lang/String;)Ll/j9y0;

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    invoke-virtual {v0, p0}, Ll/j9y0;->a(Z)Ll/j9y0;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ll/j9y0;->b(I)Ll/j9y0;

    .line 14
    .line 15
    .line 16
    return-object v0
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b()Ljava/lang/String;
.end method

.method public abstract c()Z
.end method
