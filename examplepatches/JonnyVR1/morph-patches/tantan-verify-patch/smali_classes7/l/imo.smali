.class public final Ll/imo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/imo$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001:\u0001\u0015B\u0011\u0008\u0002\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\r\u001a\u00020\u00082\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\r\u0010\u000f\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\u0010J\u0017\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0003\u001a\u00020\u0002H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u001b\u001a\u00020\u00128\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0017\u0010!\u001a\u00020\u001c8\u0006\u00a2\u0006\u000c\n\u0004\u0008\u001d\u0010\u001e\u001a\u0004\u0008\u001f\u0010 R\"\u0010)\u001a\u00020\"8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008#\u0010$\u001a\u0004\u0008%\u0010&\"\u0004\u0008\'\u0010(\u00a8\u0006*"
    }
    d2 = {
        "Ll/imo;",
        "",
        "Ll/imo$a;",
        "builder",
        "<init>",
        "(Ll/imo$a;)V",
        "Landroid/content/DialogInterface$OnCancelListener;",
        "listener",
        "",
        "j",
        "(Landroid/content/DialogInterface$OnCancelListener;)V",
        "Landroid/content/DialogInterface$OnDismissListener;",
        "dismissListener",
        "k",
        "(Landroid/content/DialogInterface$OnDismissListener;)V",
        "m",
        "()V",
        "f",
        "Lcom/p1/mobile/android/app/Dialog;",
        "g",
        "(Ll/imo$a;)Lcom/p1/mobile/android/app/Dialog;",
        "a",
        "Ll/imo$a;",
        "getBuilder",
        "()Ll/imo$a;",
        "b",
        "Lcom/p1/mobile/android/app/Dialog;",
        "dlg",
        "Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;",
        "c",
        "Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;",
        "i",
        "()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;",
        "view",
        "Ll/l4g0;",
        "d",
        "Ll/l4g0;",
        "h",
        "()Ll/l4g0;",
        "l",
        "(Ll/l4g0;)V",
        "pageHelper",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ll/imo$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/android/app/Dialog;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:Ll/l4g0;


# direct methods
.method public constructor <init>(Ll/imo$a;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/imo;->a:Ll/imo$a;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/imo;->g(Ll/imo$a;)Lcom/p1/mobile/android/app/Dialog;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/imo;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 20
    .line 21
    iput-object v0, p0, Ll/imo;->c:Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/imo$a;->i()Landroid/content/DialogInterface$OnDismissListener;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0, v1}, Ll/imo;->k(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ll/imo$a;->m()Landroid/content/DialogInterface$OnCancelListener;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0, v1}, Ll/imo;->j(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->h:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/imo$a;->p()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/imo$a;->l()Ljava/lang/CharSequence;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/imo$a;->l()Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    new-instance v2, Ll/dmo;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/dmo;-><init>(Ll/imo;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->M(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 66
    .line 67
    .line 68
    :cond_0
    invoke-virtual {p1}, Ll/imo$a;->o()Ljava/lang/CharSequence;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_1

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/imo$a;->o()Ljava/lang/CharSequence;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    new-instance v2, Ll/emo;

    .line 83
    .line 84
    invoke-direct {v2, p0}, Ll/emo;-><init>(Ll/imo;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->N(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 88
    .line 89
    .line 90
    :cond_1
    invoke-virtual {p1}, Ll/imo$a;->f()Ll/y20;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_2

    .line 99
    .line 100
    new-instance v1, Ll/fmo;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Ll/fmo;-><init>(Ll/imo;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->E(Ljava/lang/Runnable;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-virtual {p1}, Ll/imo$a;->q()I

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-lez p0, :cond_3

    .line 113
    .line 114
    invoke-virtual {p1}, Ll/imo$a;->q()I

    .line 115
    .line 116
    .line 117
    move-result p0

    .line 118
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->z(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 119
    .line 120
    .line 121
    :cond_3
    invoke-virtual {p1}, Ll/imo$a;->g()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    if-eqz p0, :cond_4

    .line 130
    .line 131
    invoke-virtual {p1}, Ll/imo$a;->g()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {p1}, Ll/imo$a;->h()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->w(Ljava/lang/String;I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 140
    .line 141
    .line 142
    :cond_4
    invoke-virtual {p1}, Ll/imo$a;->k()I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    if-eqz p0, :cond_5

    .line 147
    .line 148
    iget-object p0, v0, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B:Landroid/widget/TextView;

    .line 149
    .line 150
    invoke-virtual {p1}, Ll/imo$a;->k()I

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 155
    .line 156
    .line 157
    :cond_5
    return-void
.end method

.method public synthetic constructor <init>(Ll/imo$a;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 158
    invoke-direct {p0, p1}, Ll/imo;-><init>(Ll/imo$a;)V

    return-void
.end method

.method public static a(Ll/imo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imo;->a:Ll/imo$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/imo$a;->j()Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/imo;->a:Ll/imo$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/imo$a;->j()Ll/y20;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/imo;->f()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static b(Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public static c(Ll/imo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imo;->a:Ll/imo$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/imo$a;->n()Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/imo;->a:Ll/imo$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/imo$a;->n()Ll/y20;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/imo;->f()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static d(Landroid/content/DialogInterface$OnDismissListener;Ll/imo;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0, p2}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Ll/imo;->d:Ll/l4g0;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/imo;->h()Ll/l4g0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public static e(Ll/imo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imo;->a:Ll/imo$a;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/imo$a;->f()Ll/y20;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/imo;->f()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imo;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/imo;->d:Ll/l4g0;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/imo;->h()Ll/l4g0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final g(Ll/imo$a;)Lcom/p1/mobile/android/app/Dialog;
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/imo$a;->d()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/bgc0;->c:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget v0, Ll/pec0;->J0:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/high16 v0, 0x41c00000    # 24.0f

    .line 22
    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {p0, v1, v2, v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->C(IIII)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1}, Ll/imo$a;->e()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public final h()Ll/l4g0;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/imo;->d:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "pageHelper"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/imo;->c:Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 1
    .param p1    # Landroid/content/DialogInterface$OnCancelListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/imo;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    new-instance v0, Ll/hmo;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/hmo;-><init>(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final k(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 2
    .param p1    # Landroid/content/DialogInterface$OnDismissListener;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/imo;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    new-instance v1, Ll/gmo;

    .line 4
    .line 5
    invoke-direct {v1, p1, p0}, Ll/gmo;-><init>(Landroid/content/DialogInterface$OnDismissListener;Ll/imo;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final l(Ll/l4g0;)V
    .locals 0
    .param p1    # Ll/l4g0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/imo;->d:Ll/l4g0;

    .line 5
    .line 6
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/imo;->b:Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/imo;->d:Ll/l4g0;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/imo;->h()Ll/l4g0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
