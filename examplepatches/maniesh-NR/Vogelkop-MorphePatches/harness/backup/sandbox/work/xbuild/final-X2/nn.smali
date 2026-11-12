.class public final synthetic Lnn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lnn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lvq8;)V
    .registers 2

    const/16 p1, 0x15

    iput-byte p1, p0, Lnn;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 7

    iget-byte p0, p0, Lnn;->a:B

    const-string v0, "ofa://ui/aria"

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p0, :pswitch_data_ea

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    :pswitch_11
    check-cast p1, Ljava/lang/String;

    const-string p0, "NETWORK_"

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_1a
    check-cast p1, Laln;

    invoke-static {p1}, Ljava/util/Objects;->isNull(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_21
    check-cast p1, Ljava/lang/reflect/Field;

    invoke-static {p1}, Lorg/web3j/abi/Utils;->b(Ljava/lang/reflect/Field;)Z

    move-result p0

    return p0

    :pswitch_28
    check-cast p1, Ljava/lang/reflect/Field;

    invoke-static {p1}, Lorg/web3j/abi/Utils;->f(Ljava/lang/reflect/Field;)Z

    move-result p0

    return p0

    :pswitch_2f
    check-cast p1, Ljava/lang/reflect/Constructor;

    invoke-static {p1}, Lorg/web3j/abi/Utils;->c(Ljava/lang/reflect/Constructor;)Z

    move-result p0

    return p0

    :pswitch_36
    const-class p0, Lorg/web3j/abi/datatypes/Type;

    check-cast p1, Ljava/lang/Class;

    invoke-virtual {p0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result p0

    return p0

    :pswitch_3f
    check-cast p1, Ljava/lang/reflect/Field;

    invoke-static {p1}, Lorg/web3j/abi/Utils;->e(Ljava/lang/reflect/Field;)Z

    move-result p0

    return p0

    :pswitch_46
    check-cast p1, Lyl2;

    invoke-interface {p1}, Lyl2;->h()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_51
    check-cast p1, Ljava/lang/Class;

    invoke-static {p1}, Lorg/web3j/abi/TypeDecoder;->a(Ljava/lang/Class;)Z

    move-result p0

    return p0

    :pswitch_58
    check-cast p1, Lhq8;

    sget-object p0, Lp6l;->a:Lp6l;

    invoke-virtual {p1, p0}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_65
    check-cast p1, Lio7;

    iget-boolean p0, p1, Lio7;->b:Z

    xor-int/2addr p0, v2

    return p0

    :pswitch_6b
    check-cast p1, Luah;

    iget-object p0, p1, Luah;->e:Lh1b;

    invoke-virtual {p0, v1}, Lh1b;->u(I)La1b;

    move-result-object p0

    :cond_73
    invoke-virtual {p0}, Lq4;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_88

    invoke-virtual {p0}, Lq4;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object v0, Lzsk;->f:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_73

    move v1, v2

    :cond_88
    return v1

    :pswitch_89
    check-cast p1, Ll6e;

    iget-wide p0, p1, Ll6e;->b:J

    const-wide v3, 0x7ffffffffffffffdL

    cmp-long p0, p0, v3

    if-nez p0, :cond_97

    move v1, v2

    :cond_97
    return v1

    :pswitch_98
    check-cast p1, Leri;

    instance-of p0, p1, Ll42;

    return p0

    :pswitch_9d
    check-cast p1, Landroid/view/KeyEvent;

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p0

    const/16 p1, 0x43

    if-ne p0, p1, :cond_a8

    move v1, v2

    :cond_a8
    return v1

    :pswitch_a9
    check-cast p1, Lgyj;

    iget-object p0, p1, Lgyj;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "speed_dial.plus_button"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0

    :pswitch_b4
    check-cast p1, Lloj;

    iget-object p0, p1, Lloj;->b:Llag;

    if-eqz p0, :cond_c0

    sget-object p1, Llag;->g:Llag;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    :cond_c0
    return v2

    :pswitch_c1
    check-cast p1, Lorg/web3j/abi/TypeReference;

    invoke-static {p1}, Lorg/web3j/abi/datatypes/Event;->a(Lorg/web3j/abi/TypeReference;)Z

    move-result p0

    return p0

    :pswitch_c8
    check-cast p1, Lorg/web3j/abi/TypeReference;

    invoke-virtual {p1}, Lorg/web3j/abi/TypeReference;->isIndexed()Z

    move-result p0

    return p0

    :pswitch_cf
    check-cast p1, Lu92;

    if-eqz p1, :cond_d4

    move v1, v2

    :cond_d4
    return v1

    :pswitch_d5
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, LJ/N;->MO9jFwQ0(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Double;

    if-eqz p0, :cond_e0

    move v1, v2

    :cond_e0
    return v1

    :pswitch_e1
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/2addr p0, v2

    return p0

    nop

    :pswitch_data_ea
    .packed-switch 0x0
        :pswitch_e1
        :pswitch_d5
        :pswitch_cf
        :pswitch_c8
        :pswitch_c1
        :pswitch_b4
        :pswitch_a9
        :pswitch_9d
        :pswitch_98
        :pswitch_89
        :pswitch_6b
        :pswitch_65
        :pswitch_58
        :pswitch_51
        :pswitch_46
        :pswitch_3f
        :pswitch_36
        :pswitch_2f
        :pswitch_28
        :pswitch_21
        :pswitch_1a
        :pswitch_11
    .end packed-switch
.end method
