.class public final synthetic Lox3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/OperaApplication;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/OperaApplication;B)V
    .registers 3

    iput-byte p2, p0, Lox3;->a:B

    iput-object p1, p0, Lox3;->b:Lcom/opera/android/OperaApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 7

    iget-byte v0, p0, Lox3;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lox3;->b:Lcom/opera/android/OperaApplication;

    packed-switch v0, :pswitch_data_6c

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->n:Lorg/chromium/base/CommandLine;

    if-eqz p0, :cond_d

    move-object v1, p0

    :cond_d
    return-object v1

    :pswitch_e
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-static {p0}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object p0

    invoke-virtual {p0}, Lu59;->H()Lt59;

    move-result-object p0

    iget-wide v2, p0, Lt59;->b:J

    const-wide/16 v4, 0x0

    cmp-long p0, v2, v4

    if-eqz p0, :cond_24

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :cond_24
    return-object v1

    :pswitch_25
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->O:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzv9;

    return-object p0

    :pswitch_32
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->f:Losf;

    return-object p0

    :pswitch_3b
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object p0

    return-object p0

    :pswitch_42
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    return-object p0

    :pswitch_49
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p0

    invoke-virtual {p0}, Lfue;->d()V

    iget-object p0, p0, Lfue;->a:Lcue;

    return-object p0

    :pswitch_53
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p0

    invoke-virtual {p0}, Lfue;->d()V

    iget-object p0, p0, Lfue;->a:Lcue;

    return-object p0

    :pswitch_5d
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->h:Lhd;

    return-object p0

    :pswitch_64
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->f:Losf;

    return-object p0

    nop

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_64
        :pswitch_5d
        :pswitch_53
        :pswitch_49
        :pswitch_42
        :pswitch_3b
        :pswitch_32
        :pswitch_25
        :pswitch_e
    .end packed-switch
.end method
