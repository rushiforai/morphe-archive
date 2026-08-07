.class public Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

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
    .locals 3

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
    if-nez v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_3

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
    goto :goto_0

    .line 34
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 35
    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-ge v0, p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->I:Ljava/util/List;

    .line 49
    .line 50
    iget p1, p1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->J:I

    .line 51
    .line 52
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/f4x;->E0()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 71
    .line 72
    invoke-virtual {p0}, Ll/f4x;->S0()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    new-instance v0, Ll/pf60;

    .line 77
    .line 78
    const-string v1, "other_user_id"

    .line 79
    .line 80
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 81
    .line 82
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    filled-new-array {v0}, [Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const-string v1, "e_marriage_chat"

    .line 90
    .line 91
    const-string v2, "p_marriage_home"

    .line 92
    .line 93
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;->a:Lcom/p1/mobile/putong/core/newui/home/marrymode/a;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/marrymode/a;->A:Ll/f4x;

    .line 99
    .line 100
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b$a;

    .line 101
    .line 102
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/marrymode/a$b;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, p1, v1}, Ll/f4x;->Q0(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    return-void

    .line 109
    :cond_3
    :goto_0
    const-string p0, "\u8d26\u53f7\u72b6\u6001\u5f02\u5e38"

    .line 110
    .line 111
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
