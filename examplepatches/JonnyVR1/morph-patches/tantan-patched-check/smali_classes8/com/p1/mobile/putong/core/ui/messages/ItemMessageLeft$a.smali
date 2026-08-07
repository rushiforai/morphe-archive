.class public Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/clz;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V
    .locals 2

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/n2;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/n2;->m()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Ll/vez;->O0(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0}, Ll/mzl;->d0()Ll/vez;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    check-cast v0, Ll/n2;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/n2;->f()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ll/d3z;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/d3z;->U1()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, p1, p2}, Ll/u1z;->C1(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ChatGroupMember;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 6

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->X()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)Lcom/p1/mobile/putong/core/data/Message;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 29
    .line 30
    const-string v1, "group"

    .line 31
    .line 32
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->M0(Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;)Lcom/p1/mobile/putong/core/data/Message;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 61
    .line 62
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_0

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft$a;->a:Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;

    .line 71
    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageLeft;->I0:Ll/pol;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;->H()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    iget-object v5, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v3, v4, v5}, Lcom/p1/mobile/putong/core/api/e;->T6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    invoke-virtual {v3, v0}, Lrx/c;->take(I)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-interface {v2, p0, v3}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    new-instance v2, Ll/daq;

    .line 101
    .line 102
    invoke-direct {v2, v1, p1}, Ll/daq;-><init>(Ll/clz;Lcom/p1/mobile/putong/data/User;)V

    .line 103
    .line 104
    .line 105
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 110
    .line 111
    .line 112
    :cond_0
    return v0
.end method
