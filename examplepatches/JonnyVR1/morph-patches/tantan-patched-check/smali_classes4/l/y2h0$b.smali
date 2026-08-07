.class public Ll/y2h0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

.field public final synthetic b:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$b;->b:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    const-string v0, "popup_page"

    .line 14
    .line 15
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 35
    .line 36
    const-string v1, "button_text"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 43
    .line 44
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 45
    .line 46
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "has_close_button"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 59
    .line 60
    const-string v1, "from_female_id"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 67
    .line 68
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 69
    .line 70
    const-string v1, "business"

    .line 71
    .line 72
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 79
    .line 80
    const-string v1, "area_link"

    .line 81
    .line 82
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 83
    .line 84
    .line 85
    move-result-object v7

    .line 86
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 89
    .line 90
    const-string v1, "popup_title"

    .line 91
    .line 92
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v8

    .line 96
    iget-object v0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 99
    .line 100
    const-string v1, "popup_subtitle"

    .line 101
    .line 102
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v9

    .line 106
    iget-object p0, p0, Ll/y2h0$b;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 109
    .line 110
    const-string v0, "other_user_id"

    .line 111
    .line 112
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v10

    .line 116
    filled-new-array/range {v2 .. v10}, [Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string v0, "e_friends_online_popup"

    .line 121
    .line 122
    const-string v1, "p_suggest_users_home_view"

    .line 123
    .line 124
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/gra;->x()Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-nez p0, :cond_1

    .line 132
    .line 133
    invoke-static {}, Ll/hlh0;->a()Ll/hlh0;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    const/4 v0, 0x1

    .line 138
    invoke-virtual {p0, v0}, Ll/hlh0;->k(Z)V

    .line 139
    .line 140
    .line 141
    :cond_1
    :goto_0
    return-void
.end method
