.class public Ll/y2h0$a;
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

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic c:Ll/y2h0;


# direct methods
.method public constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionToastStyle;Lcom/p1/mobile/putong/core/data/ActionData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/y2h0$a;->c:Ll/y2h0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 4
    .line 5
    iput-object p3, p0, Ll/y2h0$a;->b:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/y2h0$a;->c:Ll/y2h0;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iget-object v2, p0, Ll/y2h0$a;->b:Lcom/p1/mobile/putong/core/data/ActionData;

    .line 23
    .line 24
    const-string v3, "upClose"

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    invoke-virtual {v0, v3, v4, v1, v2}, Ll/y2h0;->d(Ljava/lang/String;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 28
    .line 29
    .line 30
    const-string v0, "popup_page"

    .line 31
    .line 32
    invoke-static {}, Ll/y2h0;->f()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 43
    .line 44
    const/4 v1, 0x0

    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 52
    .line 53
    const-string v1, "button_text"

    .line 54
    .line 55
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "from_female_id"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 72
    .line 73
    const-string v1, "business"

    .line 74
    .line 75
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 82
    .line 83
    const-string v1, "popup_title"

    .line 84
    .line 85
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    iget-object v0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 92
    .line 93
    const-string v1, "popup_subtitle"

    .line 94
    .line 95
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    iget-object p0, p0, Ll/y2h0$a;->a:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 102
    .line 103
    const-string v0, "other_user_id"

    .line 104
    .line 105
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v8

    .line 109
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    const-string v0, "e_friends_online_popup"

    .line 114
    .line 115
    const-string v1, "p_suggest_users_home_view"

    .line 116
    .line 117
    invoke-static {v0, v1, p0}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 118
    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->SEE_TOAST:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 131
    .line 132
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 133
    .line 134
    .line 135
    :cond_0
    return-void
.end method
