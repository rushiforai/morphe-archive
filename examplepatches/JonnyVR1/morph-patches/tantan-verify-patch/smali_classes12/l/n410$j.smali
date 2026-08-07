.class Ll/n410$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tpr;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/n410;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/n410;


# direct methods
.method public constructor <init>(Ll/n410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n410$j;->a:Ll/n410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Message;)V
    .locals 2

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x110

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    packed-switch v0, :pswitch_data_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :pswitch_0
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 12
    .line 13
    invoke-static {p0}, Ll/n410;->d(Ll/n410;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :pswitch_1
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 18
    .line 19
    invoke-static {p0}, Ll/n410;->e0(Ll/n410;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :pswitch_2
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 24
    .line 25
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p0, p1}, Ll/n410;->d0(Ll/n410;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :pswitch_3
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 34
    .line 35
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 38
    .line 39
    invoke-static {p0, p1}, Ll/n410;->W(Ll/n410;Lcom/immomo/moment/mediautils/cmds/EffectModel;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_4
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 44
    .line 45
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast p1, Lcom/immomo/moment/mediautils/cmds/EffectModel;

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/n410;->L(Ll/n410;Lcom/immomo/moment/mediautils/cmds/EffectModel;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_5
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 54
    .line 55
    invoke-static {p0}, Ll/n410;->D(Ll/n410;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_6
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 60
    .line 61
    invoke-static {p0}, Ll/n410;->p(Ll/n410;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :pswitch_7
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 66
    .line 67
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p1, Ljava/lang/Boolean;

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-static {p0, p1}, Ll/n410;->f0(Ll/n410;Z)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_8
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 80
    .line 81
    invoke-static {p0}, Ll/n410;->g0(Ll/n410;)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_0
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 86
    .line 87
    invoke-static {p0}, Ll/n410;->e(Ll/n410;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_data_0
    .packed-switch 0x101
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {p0}, Ll/n410;->b(Ll/n410;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n410$j;->a:Ll/n410;

    .line 2
    .line 3
    invoke-static {p0}, Ll/n410;->c(Ll/n410;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
