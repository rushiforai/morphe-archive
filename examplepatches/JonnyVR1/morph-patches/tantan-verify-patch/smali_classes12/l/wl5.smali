.class public abstract Ll/wl5;
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

.method public static compile(Ljava/lang/String;)Ll/wl5;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/google/common/base/b;->a(Ljava/lang/String;)Ll/wl5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static isPcreLike()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/common/base/b;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method


# virtual methods
.method public abstract flags()I
.end method

.method public abstract matcher(Ljava/lang/CharSequence;)Ll/xk5;
.end method

.method public abstract pattern()Ljava/lang/String;
.end method

.method public abstract toString()Ljava/lang/String;
.end method
