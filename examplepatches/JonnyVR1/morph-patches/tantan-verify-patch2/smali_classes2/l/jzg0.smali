.class public final Ll/jzg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bgg0;


# direct methods
.method public constructor <init>(Ll/bgg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jzg0;->a:Ll/bgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 5

    .line 1
    iget-object p0, p0, Ll/jzg0;->a:Ll/bgg0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wmg0;->a:Ll/aog0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string p1, "ProxySudFSTAPPImpl"

    .line 9
    .line 10
    const-string v0, "onClickTimeoutReload"

    .line 11
    .line 12
    invoke-static {p1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/aog0;->a:Ll/dhg0;

    .line 16
    .line 17
    iget-object v1, p1, Ll/dhg0;->p:Ll/bgg0;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget v3, v1, Ll/bgg0;->d:I

    .line 23
    .line 24
    const/16 v4, 0x50

    .line 25
    .line 26
    if-ne v3, v4, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/bgg0;->a()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/aog0;->a:Ll/dhg0;

    .line 32
    .line 33
    iget-object p1, p1, Ll/dhg0;->p:Ll/bgg0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/bgg0;->h()V

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    if-le v3, v4, :cond_1

    .line 40
    .line 41
    iget-object p1, p1, Ll/dhg0;->m:Ll/lug0;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    new-instance p1, Lorg/json/JSONObject;

    .line 46
    .line 47
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 48
    .line 49
    .line 50
    :try_start_0
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 56
    .line 57
    .line 58
    :goto_0
    iget-object v1, p0, Ll/aog0;->a:Ll/dhg0;

    .line 59
    .line 60
    iget-object v1, v1, Ll/dhg0;->p:Ll/bgg0;

    .line 61
    .line 62
    const/4 v3, 0x3

    .line 63
    invoke-virtual {v1, v3, p1}, Ll/bgg0;->b(ILorg/json/JSONObject;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/aog0;->a:Ll/dhg0;

    .line 67
    .line 68
    iget-object v1, p1, Ll/dhg0;->m:Ll/lug0;

    .line 69
    .line 70
    iget-object v3, p1, Ll/dhg0;->x:Ltech/sud/gip/core/GameInfo;

    .line 71
    .line 72
    iget-object p1, p1, Ll/dhg0;->y:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v1, v3, p1}, Ll/lug0;->c(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    :goto_1
    iget-object p0, p0, Ll/aog0;->a:Ll/dhg0;

    .line 78
    .line 79
    iget-object p0, p0, Ll/dhg0;->w:Ll/iug0;

    .line 80
    .line 81
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 82
    .line 83
    .line 84
    const-string p1, "LoadGameStatsManager"

    .line 85
    .line 86
    invoke-static {p1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, v2}, Ll/iug0;->e(Z)V

    .line 90
    .line 91
    .line 92
    return-void
.end method
