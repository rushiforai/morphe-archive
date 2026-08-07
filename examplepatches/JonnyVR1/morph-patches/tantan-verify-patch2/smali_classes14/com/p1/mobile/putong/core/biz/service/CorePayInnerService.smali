.class public interface abstract Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IProvider;


# virtual methods
.method public abstract A6(Ljava/lang/String;)I
.end method

.method public abstract Ag()J
.end method

.method public abstract Am(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Bk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Bl(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V
.end method

.method public abstract Cd(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Cg(Lcom/p1/mobile/android/app/Act;Ll/y20;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation
.end method

.method public abstract Ci(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;Lcom/p1/mobile/putong/core/data/Coupon;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/PendingPaymentGuidance;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Cl()Z
.end method

.method public abstract Cp(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract D7(Ljava/lang/String;)Z
.end method

.method public abstract D9()Z
.end method

.method public abstract Dq()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Ds(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract Ed()Z
.end method

.method public abstract Fd()Z
.end method

.method public abstract Fh()I
.end method

.method public abstract Fn(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public abstract Fs()Z
.end method

.method public abstract Gs(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/String;Ljava/util/List;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Hm(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
.end method

.method public abstract I8(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
.end method

.method public abstract Jf(Lcom/p1/mobile/putong/core/data/ProductCategory;)Ljava/lang/String;
.end method

.method public abstract Kd(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/a30;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract Ki()Z
.end method

.method public abstract Ko()V
.end method

.method public abstract Le(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
.end method

.method public abstract Of(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z
.end method

.method public abstract Og(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            ")V"
        }
    .end annotation
.end method

.method public abstract On()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/PaymentResultWrapper;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Pc()Z
.end method

.method public abstract Pk(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Pr(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
.end method

.method public abstract Qk()I
.end method

.method public abstract Qs(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract S7(Z)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;"
        }
    .end annotation
.end method

.method public abstract S9()Z
.end method

.method public abstract Sb(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;ZZLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract Sj()Z
.end method

.method public abstract To(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZLjava/lang/String;Ljava/lang/String;Ll/y20;)V
    .param p8    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "ZZ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Uk(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract Va()V
.end method

.method public abstract Wa()Z
.end method

.method public abstract Wi()Z
.end method

.method public abstract Xa()I
.end method

.method public abstract Xe()V
.end method

.method public abstract Y4()I
.end method

.method public abstract Ya()Z
.end method

.method public abstract Yi()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Yl()Z
.end method

.method public abstract Z7(Lcom/p1/mobile/putong/core/data/Coupon;)Ljava/lang/String;
.end method

.method public abstract Zn(Lcom/p1/mobile/android/app/Act;)Z
.end method

.method public abstract Zs(Lcom/p1/mobile/putong/core/data/Merchandise;)Z
.end method

.method public abstract ae(Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Z
.end method

.method public abstract at()Z
.end method

.method public abstract b8()Z
.end method

.method public abstract bf(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
.end method

.method public abstract bg()Z
.end method

.method public abstract cf()Z
.end method

.method public abstract d4()Z
.end method

.method public abstract d6(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/lang/String;
.end method

.method public abstract d9()Z
.end method

.method public abstract dh()Z
.end method

.method public abstract e()Z
.end method

.method public abstract e2()Z
.end method

.method public abstract e8(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract ej(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;
.end method

.method public abstract fj(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract fk(Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Merchandise;
.end method

.method public abstract gr()V
.end method

.method public abstract je(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)Ljava/lang/CharSequence;
.end method

.method public abstract kr()Z
.end method

.method public abstract lf(J)V
.end method

.method public abstract na(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method

.method public abstract nb()Z
.end method

.method public abstract ng(Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Lcom/p1/mobile/putong/core/data/PurchaseType;)Z
.end method

.method public abstract ok(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;
.end method

.method public abstract om(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            ">;"
        }
    .end annotation
.end method

.method public abstract ot(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method

.method public abstract pj(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z
.end method

.method public abstract pk(Lcom/p1/mobile/putong/core/data/Coupon;)Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ")",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract sb(Z)V
.end method

.method public abstract sm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "I",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract td(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Boolean;Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
.end method

.method public abstract to()V
.end method

.method public abstract v9()Z
.end method

.method public abstract vt(J)Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ll/pf60<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract wg()Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end method

.method public abstract wm(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/PayMethod;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/PayMethod;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation
.end method

.method public abstract wn(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
.end method

.method public abstract x7(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract xj()Z
.end method

.method public abstract xn()Z
.end method

.method public abstract ya(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;Ll/x20;Ll/x20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            ">;",
            "Ll/x20;",
            "Ll/x20;",
            "Ll/x20;",
            ")V"
        }
    .end annotation
.end method

.method public abstract yc()Z
.end method

.method public abstract zl()Z
.end method

.method public abstract zr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end method
