.class public final Ll/qzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qzg0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 7

    .line 1
    iget-object p0, p0, Ll/qzg0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 8
    .line 9
    invoke-direct {p1, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string p2, "percent"

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result p2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    iget-object p3, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 19
    .line 20
    iget-object v0, p3, Ll/dhg0;->p:Ll/bgg0;

    .line 21
    .line 22
    const/4 p3, 0x0

    .line 23
    const/16 p4, 0x55

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v1, v0, Ll/bgg0;->k:Landroid/widget/TextView;

    .line 28
    .line 29
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 30
    .line 31
    new-instance v2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, "/100"

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iput p4, v0, Ll/bgg0;->c:I

    .line 52
    .line 53
    int-to-long v1, p2

    .line 54
    const/16 v5, 0xf

    .line 55
    .line 56
    const/16 v6, 0x64

    .line 57
    .line 58
    const-wide/16 v3, 0x64

    .line 59
    .line 60
    invoke-virtual/range {v0 .. v6}, Ll/bgg0;->d(JJII)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    iput-boolean v1, v0, Ll/dhg0;->l:Z

    .line 67
    .line 68
    iget-object v0, v0, Ll/dhg0;->w:Ll/iug0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    const-string v2, "LoadGameStatsManager"

    .line 74
    .line 75
    const-string v3, "onGameLoadPercent"

    .line 76
    .line 77
    invoke-static {v2, v3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iput-boolean v1, v0, Ll/iug0;->q:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Ll/iug0;->r:Z

    .line 83
    .line 84
    iput-boolean p3, v0, Ll/iug0;->g:Z

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/iug0;->e(Z)V

    .line 87
    .line 88
    .line 89
    :cond_0
    int-to-long v0, p2

    .line 90
    const-wide/16 v2, 0xf

    .line 91
    .line 92
    mul-long/2addr v0, v2

    .line 93
    const-wide/16 v2, 0x64

    .line 94
    .line 95
    div-long/2addr v0, v2

    .line 96
    long-to-int v0, v0

    .line 97
    if-gez v0, :cond_1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    move p3, v0

    .line 101
    :goto_0
    add-int/2addr p3, p4

    .line 102
    iget-object p0, p0, Ll/bfg0;->b:Ll/dhg0;

    .line 103
    .line 104
    if-nez p2, :cond_2

    .line 105
    .line 106
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 107
    .line 108
    const-string p2, "loadGameRuntime"

    .line 109
    .line 110
    invoke-virtual {p0, p2, p3, p1}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 115
    .line 116
    const-string p2, "loadGamePercent"

    .line 117
    .line 118
    invoke-virtual {p0, p2, p3, p1}, Ll/iug0;->c(Ljava/lang/String;ILorg/json/JSONObject;)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :catch_0
    move-exception v0

    .line 123
    move-object p0, v0

    .line 124
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 125
    .line 126
    .line 127
    :cond_3
    :goto_1
    const-string p0, "{\"ret_code\":0, \"ret_msg\":\"success\"}"

    .line 128
    .line 129
    invoke-virtual {p5, p0}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method
