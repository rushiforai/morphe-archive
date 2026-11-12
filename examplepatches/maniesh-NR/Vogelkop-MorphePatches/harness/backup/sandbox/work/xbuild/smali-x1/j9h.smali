.class public final synthetic Lj9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwxg;
.implements Lxjj;
.implements Lauk;
.implements Lbcf;
.implements Lke7;
.implements Lk0g;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 8
    iput-byte p1, p0, Lj9h;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lmoh;)V
    .registers 2

    const/16 p1, 0xa

    iput-byte p1, p0, Lj9h;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic c(ILjava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0, p3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static synthetic f(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic g(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static synthetic h(Ljava/lang/String;)V
    .registers 2

    new-instance v0, Ljava/net/ProtocolException;

    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic k(Ljava/lang/String;FLjava/lang/Object;FLjava/lang/Object;)V
    .registers 7

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic l(Ljava/lang/String;ILjava/lang/Object;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic m(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic n(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic o(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic p(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static synthetic q(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Le22;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static synthetic r(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic s(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic u(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic v(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final a(Loup;)Ljava/lang/Object;
    .registers 6

    iget-byte p0, p0, Lj9h;->a:B

    sget-object v0, Liuf;->d:Liuf;

    const/4 v1, 0x0

    check-cast p1, Lcbc;

    packed-switch p0, :pswitch_data_64

    iget-object p0, p1, Lcbc;->f:Lr6h;

    iget-object p1, p0, Lr6h;->d:Lmub;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    sget-object p1, Lvub;->d:Lvub;

    iget-object v2, p0, Lr6h;->a:Ljava/lang/String;

    const-class v3, Lk9h;

    invoke-virtual {p1, v3, v2}, Lvub;->a(Ljava/lang/Class;Ljava/lang/String;)Lrac;

    move-result-object p1

    iget-object v2, p0, Lr6h;->c:Le54;

    invoke-virtual {p1, v2}, Lrac;->a(Le54;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lk9h;

    new-instance v2, Lgs7;

    invoke-static {p0}, Lgs7;->b(Lr6h;)[B

    move-result-object v3

    iget-object p0, p0, Lr6h;->e:Liuf;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_37

    const/4 p0, 0x1

    new-array p0, p0, [B

    aput-byte v1, p0, v1

    goto :goto_39

    :cond_37
    new-array p0, v1, [B

    :goto_39
    invoke-direct {v2, p1, v3, p0}, Lgs7;-><init>(Lk9h;[B[B)V

    return-object v2

    :pswitch_3d
    iget-object p0, p1, Lcbc;->f:Lr6h;

    iget-object p1, p0, Lr6h;->d:Lmub;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    sget-object p1, Lvub;->d:Lvub;

    iget-object v1, p0, Lr6h;->a:Ljava/lang/String;

    const-class v2, Li9h;

    invoke-virtual {p1, v2, v1}, Lvub;->a(Ljava/lang/Class;Ljava/lang/String;)Lrac;

    move-result-object p1

    iget-object v1, p0, Lr6h;->c:Le54;

    invoke-virtual {p1, v1}, Lrac;->a(Le54;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Li9h;

    new-instance p1, Lkr7;

    invoke-static {p0}, Lgs7;->b(Lr6h;)[B

    iget-object p0, p0, Lr6h;->e:Liuf;

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    return-object p1

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_3d
    .end packed-switch
.end method

.method public final b(Lc0g;)Ls6h;
    .registers 6

    check-cast p1, Lbai;

    invoke-static {}, Lkvb;->z()Ljvb;

    move-result-object p0

    const-string v0, "type.googleapis.com/google.crypto.tink.RsaSsaPkcs1PrivateKey"

    invoke-virtual {p0, v0}, Ljvb;->i(Ljava/lang/String;)V

    invoke-static {}, Lx9i;->y()Lw9i;

    move-result-object v0

    invoke-static {}, Ldai;->x()Lcai;

    move-result-object v1

    sget-object v2, Liai;->h:Lc5o;

    iget-object v3, p1, Lbai;->d:Lz9i;

    invoke-virtual {v2, v3}, Lc5o;->G(Ljava/lang/Object;)Ljava/lang/Enum;

    move-result-object v2

    check-cast v2, Li8a;

    invoke-virtual {v1}, Lav9;->f()V

    iget-object v3, v1, Lav9;->b:Lfv9;

    check-cast v3, Ldai;

    invoke-virtual {v3, v2}, Ldai;->y(Li8a;)V

    invoke-virtual {v1}, Lav9;->b()Lfv9;

    move-result-object v1

    check-cast v1, Ldai;

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Lx9i;

    invoke-virtual {v2, v1}, Lx9i;->B(Ldai;)V

    iget v1, p1, Lbai;->a:I

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Lx9i;

    invoke-virtual {v2, v1}, Lx9i;->A(I)V

    iget-object v1, p1, Lbai;->b:Ljava/math/BigInteger;

    invoke-static {v1}, Liai;->b(Ljava/math/BigInteger;)Lc54;

    move-result-object v1

    invoke-virtual {v0}, Lav9;->f()V

    iget-object v2, v0, Lav9;->b:Lfv9;

    check-cast v2, Lx9i;

    invoke-virtual {v2, v1}, Lx9i;->C(Lc54;)V

    invoke-virtual {v0}, Lav9;->b()Lfv9;

    move-result-object v0

    check-cast v0, Lx9i;

    invoke-virtual {v0}, Lv5;->e()Lc54;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljvb;->j(Le54;)V

    sget-object v0, Liai;->g:Lc5o;

    iget-object p1, p1, Lbai;->c:Laai;

    invoke-virtual {v0, p1}, Lc5o;->G(Ljava/lang/Object;)Ljava/lang/Enum;

    move-result-object p1

    check-cast p1, Liuf;

    invoke-virtual {p0, p1}, Ljvb;->g(Liuf;)V

    invoke-virtual {p0}, Lav9;->b()Lfv9;

    move-result-object p0

    check-cast p0, Lkvb;

    invoke-static {p0}, Ls6h;->D(Lkvb;)Ls6h;

    move-result-object p0

    return-object p0
.end method

.method public final d(D)D
    .registers 3

    return-wide p1
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-byte p0, p0, Lj9h;->a:B

    packed-switch p0, :pswitch_data_aa

    check-cast p1, Lzmh;

    check-cast p2, Lcnh;

    invoke-virtual {p2, p1}, Lcnh;->X(Lzmh;)V

    return-void

    :pswitch_d
    check-cast p1, Lhj8;

    check-cast p2, Lymh;

    iput-object p1, p2, Lymh;->d:Lhj8;

    invoke-virtual {p2}, Lymh;->X()V

    iget-object p0, p2, Lymh;->b:Lq5g;

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Lfbl;

    iget-object p0, p0, Lfbl;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v0, p1, Lhj8;->a:Lm4l;

    invoke-virtual {v0}, Lm4l;->c()Lpxh;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p2, Lymh;->e:Lwf;

    iget-object p1, p1, Lhj8;->b:Ljava/util/ArrayList;

    new-instance p2, Ljava/util/ArrayList;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_45
    if-ge v1, v0, :cond_58

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lenh;

    new-instance v3, Lzmh;

    invoke-direct {v3, v2}, Lzmh;-><init>(Lenh;)V

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_45

    :cond_58
    invoke-virtual {p0, p2}, Ldt1;->K(Ljava/util/Collection;)V

    return-void

    :pswitch_5c
    check-cast p1, Lc85;

    check-cast p2, Lwmh;

    iput-object p1, p2, Lwmh;->d:Lc85;

    iget-object p0, p2, Lwmh;->b:Lpt1;

    iget-object v0, p0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lc85;->a:Lm4l;

    invoke-virtual {v1}, Lm4l;->c()Lpxh;

    move-result-object v1

    iget-object v2, p0, Lpt1;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lc85;->b:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f120021

    invoke-virtual {v0, v2, p1, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p2}, Lwmh;->X()V

    return-void

    :pswitch_a1
    check-cast p1, Lzmh;

    check-cast p2, Lcnh;

    invoke-virtual {p2, p1}, Lcnh;->X(Lzmh;)V

    return-void

    nop

    :pswitch_data_aa
    .packed-switch 0x5
        :pswitch_a1
        :pswitch_5c
        :pswitch_d
    .end packed-switch
.end method

.method public final j(Lyo2;)V
    .registers 2

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 5

    iget-object p0, p2, Lg3o;->a:Ld3o;

    const/16 p1, 0x287

    invoke-virtual {p0, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x24

    if-lt v0, v1, :cond_14

    new-instance v0, Lt2o;

    invoke-direct {v0, p2}, Lt2o;-><init>(Lg3o;)V

    goto :goto_41

    :cond_14
    const/16 v1, 0x23

    if-lt v0, v1, :cond_1e

    new-instance v0, Ls2o;

    invoke-direct {v0, p2}, Ls2o;-><init>(Lg3o;)V

    goto :goto_41

    :cond_1e
    const/16 v1, 0x22

    if-lt v0, v1, :cond_28

    new-instance v0, Lr2o;

    invoke-direct {v0, p2}, Lr2o;-><init>(Lg3o;)V

    goto :goto_41

    :cond_28
    const/16 v1, 0x1f

    if-lt v0, v1, :cond_32

    new-instance v0, Lq2o;

    invoke-direct {v0, p2}, Lq2o;-><init>(Lg3o;)V

    goto :goto_41

    :cond_32
    const/16 v1, 0x1e

    if-lt v0, v1, :cond_3c

    new-instance v0, Lp2o;

    invoke-direct {v0, p2}, Lp2o;-><init>(Lg3o;)V

    goto :goto_41

    :cond_3c
    new-instance v0, Lo2o;

    invoke-direct {v0, p2}, Lo2o;-><init>(Lg3o;)V

    :goto_41
    iget p2, p0, Lr9b;->b:I

    iget p0, p0, Lr9b;->d:I

    const/4 v1, 0x0

    invoke-static {v1, p2, v1, p0}, Lr9b;->c(IIII)Lr9b;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lu2o;->d(ILr9b;)V

    invoke-virtual {v0}, Lo2o;->b()Lg3o;

    move-result-object p0

    return-object p0
.end method
