.class public final Ll/jfg0;
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
    iput-object p1, p0, Ll/jfg0;->a:Ll/wyg0;

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
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jfg0;->a:Ll/wyg0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/wyg0;->m:Ll/bfg0;

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-static {}, Ltech/sud/gip/core/SudGIP;->getCfg()Ltech/sud/gip/core/ISudCfg;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Ltech/sud/gip/core/ISudCfg;->getAdvancedConfigMap()Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-string v2, "block_common_game_reload"

    .line 16
    .line 17
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "true"

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    iget-object p0, v0, Ll/bfg0;->b:Ll/dhg0;

    .line 31
    .line 32
    iget-object p1, p0, Ll/dhg0;->m:Ll/lug0;

    .line 33
    .line 34
    instance-of p2, p1, Ll/mzg0;

    .line 35
    .line 36
    const/4 p3, 0x0

    .line 37
    if-eqz p2, :cond_1

    .line 38
    .line 39
    check-cast p1, Ll/mzg0;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    move-object p1, p3

    .line 43
    :goto_0
    if-nez p1, :cond_2

    .line 44
    .line 45
    return-void

    .line 46
    :cond_2
    invoke-virtual {p0}, Ll/dhg0;->a()V

    .line 47
    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    iput-boolean p2, p0, Ll/dhg0;->j:Z

    .line 51
    .line 52
    iput-boolean p2, p0, Ll/dhg0;->i:Z

    .line 53
    .line 54
    new-instance p2, Ll/bgg0;

    .line 55
    .line 56
    iget-object p4, p0, Ll/dhg0;->b:Landroid/app/Activity;

    .line 57
    .line 58
    invoke-direct {p2, p4}, Ll/bgg0;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 62
    .line 63
    iget-object p4, p2, Ll/bgg0;->f:Landroid/view/View;

    .line 64
    .line 65
    iput-object p4, p0, Ll/dhg0;->q:Landroid/view/View;

    .line 66
    .line 67
    iget-object p5, p0, Ll/dhg0;->s:Ll/aog0;

    .line 68
    .line 69
    iput-object p5, p2, Ll/wmg0;->a:Ll/aog0;

    .line 70
    .line 71
    iget-object p2, p0, Ll/dhg0;->n:Ltech/sud/gip/core/view/SudGameView;

    .line 72
    .line 73
    invoke-virtual {p2, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 77
    .line 78
    iget-object p4, p0, Ll/dhg0;->g:Ltech/sud/gip/core/GameInfo;

    .line 79
    .line 80
    iget-object p4, p4, Ltech/sud/gip/core/GameInfo;->bigLoadingPic:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p2, p4}, Ll/bgg0;->f(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Ll/dhg0;->p:Ll/bgg0;

    .line 86
    .line 87
    const/4 p4, 0x3

    .line 88
    invoke-virtual {p2, p4, p3}, Ll/bgg0;->b(ILorg/json/JSONObject;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, Ll/dhg0;->x:Ltech/sud/gip/core/GameInfo;

    .line 92
    .line 93
    iget-object p0, p0, Ll/dhg0;->y:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, p2, p0}, Ll/mzg0;->c(Ltech/sud/gip/core/GameInfo;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/jfg0;->a:Ll/wyg0;

    .line 100
    .line 101
    move-object v1, p1

    .line 102
    move-object v2, p2

    .line 103
    move-object v3, p3

    .line 104
    move-object v4, p4

    .line 105
    move-object v5, p5

    .line 106
    invoke-virtual/range {v0 .. v5}, Ll/wyg0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method
