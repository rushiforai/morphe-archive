.class public final Ll/dug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bfg0;


# direct methods
.method public constructor <init>(Ll/bfg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dug0;->a:Ll/bfg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 12

    .line 1
    iget-object p0, p0, Ll/dug0;->a:Ll/bfg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 4
    .line 5
    const-string v0, "ProxySudFSTAPPImpl"

    .line 6
    .line 7
    const-string v1, "\u6e38\u620f\u7a97\u53e3\u88ab\u79fb\u9664\u4e4b\u540e\u53c8\u91cd\u65b0\u6dfb\u52a0\u4e86\u6267\u884c\uff1aexeGameViewAttachedToWindowReload"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Ll/dhg0;->k:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    iget-object v0, p0, Ll/dhg0;->m:Ll/lug0;

    .line 18
    .line 19
    instance-of v1, v0, Ll/mzg0;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    check-cast v0, Ll/mzg0;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_0
    if-nez v0, :cond_2

    .line 28
    .line 29
    :goto_1
    return-void

    .line 30
    :cond_2
    new-instance v1, Lorg/json/JSONObject;

    .line 31
    .line 32
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 33
    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    :try_start_0
    const-string v3, "onGameViewAttachedToWindowReload"

    .line 37
    .line 38
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    goto :goto_2

    .line 42
    :catch_0
    move-exception v3

    .line 43
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 44
    .line 45
    .line 46
    :goto_2
    iget-object v3, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 47
    .line 48
    const/16 v4, 0x50

    .line 49
    .line 50
    if-nez v3, :cond_3

    .line 51
    .line 52
    iget-object v3, p0, Ll/dhg0;->w:Ll/iug0;

    .line 53
    .line 54
    const-string v5, "checkoutGamePackage"

    .line 55
    .line 56
    invoke-virtual {v3, v5, v4, v1}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 57
    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_3
    const/4 v5, 0x3

    .line 61
    invoke-virtual {v3, v5, v1}, Ll/bgg0;->b(ILorg/json/JSONObject;)V

    .line 62
    .line 63
    .line 64
    :goto_3
    iget-object v1, p0, Ll/dhg0;->w:Ll/iug0;

    .line 65
    .line 66
    iget-object v3, v1, Ll/iug0;->a:Ll/ukg0;

    .line 67
    .line 68
    if-eqz v3, :cond_9

    .line 69
    .line 70
    iget-object v3, v1, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 71
    .line 72
    if-nez v3, :cond_4

    .line 73
    .line 74
    goto :goto_6

    .line 75
    :cond_4
    invoke-virtual {v1, v2}, Ll/iug0;->e(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v2, v1, Ll/iug0;->a:Ll/ukg0;

    .line 79
    .line 80
    if-eqz v2, :cond_9

    .line 81
    .line 82
    iget-object v2, v1, Ll/iug0;->b:Ljava/util/ArrayList;

    .line 83
    .line 84
    if-nez v2, :cond_5

    .line 85
    .line 86
    goto :goto_6

    .line 87
    :cond_5
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    const-wide/16 v5, 0x0

    .line 92
    .line 93
    const/4 v7, 0x0

    .line 94
    move-wide v8, v5

    .line 95
    :cond_6
    :goto_4
    if-ge v7, v3, :cond_8

    .line 96
    .line 97
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v10

    .line 101
    add-int/lit8 v7, v7, 0x1

    .line 102
    .line 103
    check-cast v10, Ll/tkg0;

    .line 104
    .line 105
    iget v11, v10, Ll/tkg0;->b:I

    .line 106
    .line 107
    if-le v11, v4, :cond_7

    .line 108
    .line 109
    iget-wide v10, v10, Ll/tkg0;->d:J

    .line 110
    .line 111
    :goto_5
    add-long/2addr v8, v10

    .line 112
    goto :goto_4

    .line 113
    :cond_7
    if-ne v11, v4, :cond_6

    .line 114
    .line 115
    cmp-long v11, v8, v5

    .line 116
    .line 117
    if-lez v11, :cond_6

    .line 118
    .line 119
    iget-wide v10, v10, Ll/tkg0;->d:J

    .line 120
    .line 121
    goto :goto_5

    .line 122
    :cond_8
    iget-object v1, v1, Ll/iug0;->a:Ll/ukg0;

    .line 123
    .line 124
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iput-object v2, v1, Ll/ukg0;->u:Ljava/lang/Long;

    .line 129
    .line 130
    :cond_9
    :goto_6
    iget-object v1, p0, Ll/dhg0;->x:Ltech/sud/gip/core/GameInfo;

    .line 131
    .line 132
    iget-object p0, p0, Ll/dhg0;->y:Ljava/lang/String;

    .line 133
    .line 134
    invoke-virtual {v0, v1, p0}, Ll/mzg0;->c(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method
