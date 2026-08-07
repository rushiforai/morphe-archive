.class public Ll/g900$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g900;->c0(Ll/vg60;Lcom/p1/mobile/putong/core/data/Reminder;Lcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/g900;


# direct methods
.method public constructor <init>(Ll/g900;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g900$a;->a:Ll/g900;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/g900$a;->a:Ll/g900;

    .line 2
    .line 3
    invoke-static {p1}, Ll/g900;->G(Ll/g900;)Ll/clz;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/vez;->y0()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    if-eq p5, p9, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/g900$a;->a:Ll/g900;

    .line 28
    .line 29
    invoke-static {p1}, Ll/g900;->G(Ll/g900;)Ll/clz;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/qzz;->a0()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ll/n2;

    .line 50
    .line 51
    sget-object p2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 52
    .line 53
    invoke-virtual {p2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    invoke-virtual {p1, p2}, Ll/n2;->j(I)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Ll/g900$a;->a:Ll/g900;

    .line 67
    .line 68
    invoke-static {p1}, Ll/g900;->G(Ll/g900;)Ll/clz;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Ll/qzz;->n1:Ll/iwl;

    .line 77
    .line 78
    invoke-interface {p1}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
