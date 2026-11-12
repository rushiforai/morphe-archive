.class public final synthetic Lsl2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltl2;


# direct methods
.method public synthetic constructor <init>(Ltl2;B)V
    .registers 3

    iput-byte p2, p0, Lsl2;->a:B

    iput-object p1, p0, Lsl2;->b:Ltl2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lsl2;->a:B

    iget-object p0, p0, Lsl2;->b:Ltl2;

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_60

    check-cast p1, Lvjd;

    iget-object p1, p0, Ltl2;->a:Lp12;

    iget-object p1, p1, Lp12;->b:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lvjd;

    iget-object p1, p1, Lvjd;->I:Landroid/os/Bundle;

    const/4 v0, 0x0

    if-eqz p1, :cond_21

    const-string v2, "com.opera.android.media.AI_POD_ID"

    invoke-virtual {p1, v2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_21
    const/4 p1, 0x0

    if-eqz v0, :cond_26

    move v0, v1

    goto :goto_27

    :cond_26
    move v0, p1

    :goto_27
    if-nez v0, :cond_32

    iget-boolean v2, p0, Ltl2;->d:Z

    if-eqz v2, :cond_32

    iget-object v2, p0, Ltl2;->b:Ldg2;

    invoke-virtual {v2}, Ldg2;->invoke()Ljava/lang/Object;

    :cond_32
    iget-boolean v2, p0, Ltl2;->d:Z

    if-nez v2, :cond_39

    if-nez v0, :cond_39

    move v1, p1

    :cond_39
    iput-boolean v1, p0, Ltl2;->d:Z

    return-void

    :pswitch_3c
    check-cast p1, Lag2;

    iget-object p0, p0, Ltl2;->c:Lq02;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_5e

    if-eq p1, v1, :cond_5e

    const/4 v0, 0x2

    if-eq p1, v0, :cond_5e

    const/4 v0, 0x3

    if-ne p1, v0, :cond_5b

    sget-wide v0, Ltl2;->e:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_5e

    :cond_5b
    invoke-static {}, Lh9o;->p()V

    :cond_5e
    :goto_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_3c
    .end packed-switch
.end method
