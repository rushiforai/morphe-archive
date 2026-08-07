.class public Ll/y2f;
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
    invoke-virtual {p0, p1}, Ll/y2f;->e([Ll/y1f;)Ljava/lang/Boolean;

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
    const-string p0, "eq"

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
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-object v1, p1, v0

    .line 3
    .line 4
    iget-object v2, v1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 5
    .line 6
    sget-object v3, Lcom/tantanapp/engine/EngineType;->Number:Lcom/tantanapp/engine/EngineType;

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    if-ne v2, v3, :cond_1

    .line 10
    .line 11
    aget-object v5, p1, v4

    .line 12
    .line 13
    iget-object v5, v5, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 14
    .line 15
    if-ne v5, v3, :cond_1

    .line 16
    .line 17
    iget-object v1, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    aget-object p1, p1, v4

    .line 24
    .line 25
    iget-object p1, p1, Ll/y1f;->b:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/dk2;->b(Ljava/lang/Object;)D

    .line 28
    .line 29
    .line 30
    move-result-wide p0

    .line 31
    cmpl-double p0, v1, p0

    .line 32
    .line 33
    if-nez p0, :cond_0

    .line 34
    .line 35
    move v0, v4

    .line 36
    :cond_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    sget-object p0, Lcom/tantanapp/engine/EngineType;->String:Lcom/tantanapp/engine/EngineType;

    .line 42
    .line 43
    if-ne v2, p0, :cond_2

    .line 44
    .line 45
    aget-object p1, p1, v4

    .line 46
    .line 47
    iget-object v0, p1, Ll/y1f;->a:Lcom/tantanapp/engine/EngineType;

    .line 48
    .line 49
    if-ne v0, p0, :cond_2

    .line 50
    .line 51
    iget-object p0, v1, Ll/y1f;->b:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p0, Ljava/lang/String;

    .line 54
    .line 55
    iget-object p1, p1, Ll/y1f;->b:Ljava/lang/Object;

    .line 56
    .line 57
    check-cast p1, Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_2
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    return-object p0
.end method
