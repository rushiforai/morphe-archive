.class final Ll/i4a$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/i4a;->t(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/i4a;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ll/elj;

.field final synthetic d:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/i4a;Ljava/lang/String;Ll/elj;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i4a$c;->a:Ll/i4a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/i4a$c;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/i4a$c;->c:Ll/elj;

    .line 6
    .line 7
    iput-object p4, p0, Ll/i4a$c;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    sget-object v0, Lcom/hellogroup/fep/base/core/FepManager;->Companion:Lcom/hellogroup/fep/base/core/FepManager$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget-object v2, p0, Ll/i4a$c;->b:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    sget-object v4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 14
    .line 15
    invoke-virtual {v1, v2, v3, v3, v4}, Lcom/hellogroup/fep/base/core/FepManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/core/FepManager$a;->a()Lcom/hellogroup/fep/base/core/FepManager;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v1}, Lcom/hellogroup/fep/base/core/FepManager;->t(Ll/zgi;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/i4a$c;->b:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Ll/i4a$c;->c:Ll/elj;

    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/glj;->g(Ljava/lang/String;Ll/elj;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Ll/i4a$c;->a:Ll/i4a;

    .line 39
    .line 40
    iget-object p0, p0, Ll/i4a$c;->d:Ljava/lang/String;

    .line 41
    .line 42
    const-string v1, "status"

    .line 43
    .line 44
    filled-new-array {v1}, [Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Ll/glw;->b([Ljava/lang/String;[Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, p0, v1}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-static {}, Ll/flj;->g()Ll/flj;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, p0, Ll/i4a$c;->b:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v4, p0, Ll/i4a$c;->c:Ll/elj;

    .line 76
    .line 77
    new-instance v7, Ll/i4a$c$a;

    .line 78
    .line 79
    invoke-direct {v7, p0}, Ll/i4a$c$a;-><init>(Ll/i4a$c;)V

    .line 80
    .line 81
    .line 82
    const/4 v5, 0x0

    .line 83
    const/4 v6, 0x1

    .line 84
    invoke-virtual/range {v2 .. v7}, Ll/flj;->f(Ljava/lang/String;Ll/elj;ZZLl/okj;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
