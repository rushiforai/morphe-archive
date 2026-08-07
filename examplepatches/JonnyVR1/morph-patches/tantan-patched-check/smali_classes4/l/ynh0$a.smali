.class public Ll/ynh0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ynh0;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ynh0;


# direct methods
.method public constructor <init>(Ll/ynh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "marryMode"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 24
    .line 25
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 26
    .line 27
    const-string v1, "loveMode"

    .line 28
    .line 29
    invoke-virtual {p1, v1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 35
    .line 36
    iget-object p1, p1, Ll/dkb;->F1:Lrx/subjects/b;

    .line 37
    .line 38
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 44
    .line 45
    iget-object p1, p1, Ll/ynh0;->h:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    instance-of v1, p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 52
    .line 53
    sget-object v1, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 54
    .line 55
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->R5(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 56
    .line 57
    .line 58
    const-string p1, "\u5df2\u5207\u6362\u4e3a\u60f3\u604b\u7231\u6a21\u5f0f"

    .line 59
    .line 60
    invoke-static {p1}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p1, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 64
    .line 65
    invoke-static {p1}, Ll/ynh0;->A(Ll/ynh0;)Lv/VImage;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    sget v1, Ll/dbc0;->gr:I

    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 75
    .line 76
    invoke-static {p1}, Ll/ynh0;->z(Ll/ynh0;)Lv/VImage;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    sget v1, Ll/dbc0;->fr:I

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 86
    .line 87
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 88
    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 93
    .line 94
    iget-object p1, p1, Ll/dkb;->Z3:Ll/wyd0;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Ll/ynh0$a;->a:Ll/ynh0;

    .line 106
    .line 107
    invoke-static {p0}, Ll/ynh0;->C(Ll/ynh0;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p1, "mode_select"

    .line 112
    .line 113
    const-string v0, "love"

    .line 114
    .line 115
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    filled-new-array {p1}, [Ll/pf60;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const-string v0, "e_mode_sidebar"

    .line 124
    .line 125
    invoke-static {v0, p0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 126
    .line 127
    .line 128
    :cond_1
    return-void
.end method
