.class final Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->T(Lorg/json/JSONObject;)V
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
.field final synthetic a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    iput-object p2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->b:Lorg/json/JSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->r(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;)Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_8

    .line 8
    .line 9
    iget-object v1, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->b:Lorg/json/JSONObject;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string v2, "callback"

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    iget-object v2, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->b:Lorg/json/JSONObject;

    .line 22
    .line 23
    if-eqz v2, :cond_8

    .line 24
    .line 25
    const-string v3, "data"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_8

    .line 32
    .line 33
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    new-instance v4, Lorg/json/JSONObject;

    .line 38
    .line 39
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 40
    .line 41
    .line 42
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-eqz v5, :cond_7

    .line 47
    .line 48
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    check-cast v5, Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v7

    .line 62
    const/4 v8, 0x0

    .line 63
    if-eqz v7, :cond_1

    .line 64
    .line 65
    iget-object v6, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    invoke-static {v6, v4, v5, v8}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->A(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    const-string v7, ""

    .line 75
    .line 76
    if-eqz v6, :cond_2

    .line 77
    .line 78
    move-object v9, v6

    .line 79
    goto :goto_2

    .line 80
    :cond_2
    move-object v9, v7

    .line 81
    :goto_2
    invoke-static {v9}, Ll/wkw;->k(Ljava/lang/String;)Z

    .line 82
    .line 83
    .line 84
    move-result v9

    .line 85
    if-eqz v9, :cond_3

    .line 86
    .line 87
    invoke-static {v6}, Ll/wkw;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v6

    .line 91
    :cond_3
    new-instance v9, Ljava/io/File;

    .line 92
    .line 93
    if-eqz v6, :cond_4

    .line 94
    .line 95
    move-object v7, v6

    .line 96
    :cond_4
    invoke-direct {v9, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    .line 100
    .line 101
    .line 102
    move-result v6

    .line 103
    if-eqz v6, :cond_6

    .line 104
    .line 105
    invoke-virtual {v9}, Ljava/io/File;->length()J

    .line 106
    .line 107
    .line 108
    move-result-wide v6

    .line 109
    const-wide/16 v10, 0x0

    .line 110
    .line 111
    cmp-long v6, v6, v10

    .line 112
    .line 113
    if-gtz v6, :cond_5

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_5
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v6

    .line 120
    invoke-static {v0, v9, v6}, Lcom/hellogroup/common/file/FileUtil;->j(Landroid/content/Context;Ljava/io/File;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v6, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 124
    .line 125
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    const/4 v7, 0x1

    .line 129
    invoke-static {v6, v4, v5, v7}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->A(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 130
    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_6
    :goto_3
    iget-object v6, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 134
    .line 135
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 136
    .line 137
    .line 138
    invoke-static {v6, v4, v5, v8}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->A(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Lorg/json/JSONObject;Ljava/lang/String;Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_7
    iget-object p0, p0, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge$f;->a:Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;

    .line 143
    .line 144
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {p0, v1, v0}, Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;->y(Lcom/hellogroup/mk/business/bridge/BusinessMediaBridge;Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_8
    return-void
.end method
