.class public Ll/fuk;
.super Ll/dk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dk2<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dk2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a([Ll/y1f;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fuk;->e([Ll/y1f;)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "gt"

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Lcom/tantanapp/engine/FunctionResultType;
    .locals 0

    .line 1
    sget-object p0, Lcom/tantanapp/engine/FunctionResultType;->Boolean:Lcom/tantanapp/engine/FunctionResultType;

    .line 2
    .line 3
    return-object p0
.end method

.method public varargs e([Ll/y1f;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    iget-object v1, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    const/4 v3, 0x1

    .line 11
    aget-object p1, p1, v3

    .line 12
    .line 13
    iget-object p1, p1, Ll/y1f;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    cmpl-double p0, v1, p0

    .line 20
    .line 21
    if-lez p0, :cond_0

    .line 22
    .line 23
    move v0, v3

    .line 24
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method
