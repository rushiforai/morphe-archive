.class final Ll/hm3$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hm3;->p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
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
.field final synthetic a:Ll/hm3;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ll/hm3;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hm3$f;->a:Ll/hm3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hm3$f;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/hm3$f;->a:Ll/hm3;

    .line 2
    .line 3
    invoke-static {v0}, Ll/hm3;->w(Ll/hm3;)Ll/hul;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ll/hul;->getWebContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v1

    .line 16
    :goto_0
    instance-of v0, v0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 17
    .line 18
    if-eqz v0, :cond_5

    .line 19
    .line 20
    iget-object v0, p0, Ll/hm3$f;->b:Lorg/json/JSONObject;

    .line 21
    .line 22
    const-string v2, "Oops! \u51fa\u9519\u4e86"

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    const-string v3, "txt"

    .line 27
    .line 28
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    move-object v7, v0

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move-object v7, v2

    .line 37
    :goto_1
    iget-object v0, p0, Ll/hm3$f;->b:Lorg/json/JSONObject;

    .line 38
    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    const-string v1, "msg"

    .line 42
    .line 43
    const-string v2, ""

    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    :cond_2
    iget-object v0, p0, Ll/hm3$f;->a:Ll/hm3;

    .line 50
    .line 51
    invoke-static {v0}, Ll/hm3;->w(Ll/hm3;)Ll/hul;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    invoke-interface {v0}, Ll/hul;->getWebContext()Landroid/content/Context;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    move-object v3, v0

    .line 65
    check-cast v3, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 66
    .line 67
    iget-object v0, p0, Ll/hm3$f;->b:Lorg/json/JSONObject;

    .line 68
    .line 69
    const/4 v2, 0x0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    const-string v4, "isShow"

    .line 73
    .line 74
    invoke-virtual {v0, v4, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    const/4 v4, 0x1

    .line 79
    if-ne v0, v4, :cond_3

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    move v4, v2

    .line 83
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "JSBridge_"

    .line 86
    .line 87
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    const/4 v8, 0x1

    .line 98
    const/4 v5, 0x1

    .line 99
    invoke-virtual/range {v3 .. v8}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->H2(ZZLjava/lang/String;Ljava/lang/String;Z)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/hm3$f;->b:Lorg/json/JSONObject;

    .line 103
    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    iget-object p0, p0, Ll/hm3$f;->a:Ll/hm3;

    .line 107
    .line 108
    invoke-static {v0}, Ll/glw;->d(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    const-string v1, "1"

    .line 113
    .line 114
    invoke-static {p0, v0, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    const-string p0, "null cannot be cast to non-null type com.hellogroup.mk.business.ui.BaseMKProxyActivity"

    .line 119
    .line 120
    invoke-static {p0}, Lb;->a(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_5
    return-void
.end method
