.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

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
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_5

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_5

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_5

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSwipeJailed()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 35
    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->C:Z

    .line 37
    .line 38
    if-nez v0, :cond_4

    .line 39
    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->D:Z

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-ge v0, p1, :cond_3

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 56
    .line 57
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 58
    .line 59
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 60
    .line 61
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/f4x;->E0()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    iget-object p0, v1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/f4x;->S0()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_2
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 86
    .line 87
    invoke-virtual {v0, p1}, Ll/f4x;->F0(Lcom/p1/mobile/putong/data/User;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/pf60;

    .line 91
    .line 92
    const-string v1, "other_user_id"

    .line 93
    .line 94
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    filled-new-array {v0}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string v0, "e_marriage_next"

    .line 104
    .line 105
    const-string v1, "p_marriage_home"

    .line 106
    .line 107
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$a;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 111
    .line 112
    const/4 p1, 0x0

    .line 113
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A(Z)V

    .line 114
    .line 115
    .line 116
    :cond_4
    :goto_0
    return-void

    .line 117
    :cond_5
    :goto_1
    const-string p0, "\u8d26\u53f7\u72b6\u6001\u5f02\u5e38"

    .line 118
    .line 119
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method
