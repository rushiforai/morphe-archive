.class public final Lbha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnh4;


# direct methods
.method public synthetic constructor <init>(Lnh4;B)V
    .registers 3

    iput-byte p2, p0, Lbha;->a:B

    iput-object p1, p0, Lbha;->b:Lnh4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lbha;->a:B

    iget-object p0, p0, Lbha;->b:Lnh4;

    packed-switch v0, :pswitch_data_b4

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_16

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_16
    return-void

    :pswitch_17
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_26

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_26
    return-void

    :pswitch_27
    check-cast p1, Lw1m;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_36

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_36
    return-void

    :pswitch_37
    check-cast p1, Lwfc;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_46

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_46
    return-void

    :pswitch_47
    check-cast p1, Lelk;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_56

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_56
    return-void

    :pswitch_57
    check-cast p1, Lelk;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_66

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_66
    return-void

    :pswitch_67
    check-cast p1, Lh4k;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_76

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_76
    return-void

    :pswitch_77
    check-cast p1, Lky9;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_86

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_86
    return-void

    :pswitch_87
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lqh4;

    if-nez v0, :cond_99

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_99
    return-void

    :pswitch_9a
    check-cast p1, Lyah;

    sget-object v0, Lt0i;->b:Lp0i;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    return-void

    :pswitch_a2
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0}, Lnh4;->r()Ljava/lang/Object;

    move-result-object p1

    instance-of p1, p1, Lc0f;

    if-eqz p1, :cond_b3

    sget-object p1, Lt0i;->b:Lp0i;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_b3
    return-void

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_a2
        :pswitch_9a
        :pswitch_87
        :pswitch_77
        :pswitch_67
        :pswitch_57
        :pswitch_47
        :pswitch_37
        :pswitch_27
        :pswitch_17
    .end packed-switch
.end method
