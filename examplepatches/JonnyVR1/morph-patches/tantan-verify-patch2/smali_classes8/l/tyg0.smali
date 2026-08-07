.class public final Ll/tyg0;
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
    iput-object p1, p0, Ll/tyg0;->a:Ll/wyg0;

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
    .locals 2

    .line 1
    iget-object p1, p0, Ll/tyg0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 p3, 0x0

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    :goto_0
    move-object p2, p3

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    new-instance p2, Ll/jug0;

    .line 17
    .line 18
    invoke-direct {p2}, Ll/jug0;-><init>()V

    .line 19
    .line 20
    .line 21
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 22
    .line 23
    invoke-direct {v0, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const-string v1, "isOpen"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput-boolean v0, p2, Ll/jug0;->a:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catch_0
    move-exception p2

    .line 36
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_1
    if-nez p2, :cond_1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_1
    iget-boolean p2, p2, Ll/jug0;->a:Z

    .line 44
    .line 45
    iget-object p1, p1, Ll/bfg0;->b:Ll/dhg0;

    .line 46
    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    new-instance p2, Ll/hkg0;

    .line 50
    .line 51
    invoke-direct {p2, p1}, Ll/hkg0;-><init>(Ll/dhg0;)V

    .line 52
    .line 53
    .line 54
    iput-object p2, p1, Ll/dhg0;->E:Ll/hkg0;

    .line 55
    .line 56
    iget-object p1, p1, Ll/dhg0;->B:Ll/rog0;

    .line 57
    .line 58
    if-eqz p1, :cond_3

    .line 59
    .line 60
    iput-object p2, p1, Ll/rog0;->o:Ll/hkg0;

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    iput-object p3, p1, Ll/dhg0;->E:Ll/hkg0;

    .line 64
    .line 65
    iget-object p1, p1, Ll/dhg0;->B:Ll/rog0;

    .line 66
    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    iput-object p3, p1, Ll/rog0;->o:Ll/hkg0;

    .line 70
    .line 71
    :cond_3
    :goto_2
    iget-object p0, p0, Ll/tyg0;->a:Ll/wyg0;

    .line 72
    .line 73
    iget-object p0, p0, Ll/wyg0;->c:Ljava/lang/ref/WeakReference;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ltech/sud/gip/core/ISudFSMMG;

    .line 80
    .line 81
    if-eqz p0, :cond_4

    .line 82
    .line 83
    const-string p1, "mg_common_game_llm_asr"

    .line 84
    .line 85
    invoke-interface {p0, p5, p1, p4}, Ltech/sud/gip/core/ISudFSMMG;->onGameStateChange(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_4
    return-void
.end method
