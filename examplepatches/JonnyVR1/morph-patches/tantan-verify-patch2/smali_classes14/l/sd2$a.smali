.class public final Ll/sd2$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sd2;->e(Lcom/google/android/gms/ads/AdView;Ljava/lang/String;I)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u000f\u0010\t\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\u0008J\u000f\u0010\n\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u0008\u00a8\u0006\u000b"
    }
    d2 = {
        "l/sd2$a",
        "Ll/d70;",
        "Ll/jtv;",
        "loadAdError",
        "",
        "x",
        "(Ll/jtv;)V",
        "A",
        "()V",
        "onAdClicked",
        "B",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-",
            "Lcom/google/android/gms/ads/AdView;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic c:Lcom/google/android/gms/ads/AdView;

.field public final synthetic d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ll/gcg0;Lcom/google/android/gms/ads/AdView;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/gcg0<",
            "-",
            "Lcom/google/android/gms/ads/AdView;",
            ">;",
            "Lcom/google/android/gms/ads/AdView;",
            "I)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sd2$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p2, p0, Ll/sd2$a;->b:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/sd2$a;->c:Lcom/google/android/gms/ads/AdView;

    .line 6
    .line 7
    iput p4, p0, Ll/sd2$a;->d:I

    .line 8
    .line 9
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/d70;->A()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/sd2;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/sd2$a;->b:Ll/gcg0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/sd2$a;->c:Lcom/google/android/gms/ads/AdView;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public B()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/d70;->B()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/sd2;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAdClicked()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/d70;->onAdClicked()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/sd2;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    iget p0, p0, Ll/sd2$a;->d:I

    .line 8
    .line 9
    const/4 v0, 0x5

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    const-string p0, "e_intl_visitors_list_ads"

    .line 13
    .line 14
    const-string v0, "p_intl_visitors_list"

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 v0, 0x2

    .line 21
    if-eq p0, v0, :cond_2

    .line 22
    .line 23
    const/16 v0, 0xa

    .line 24
    .line 25
    if-ne p0, v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void

    .line 29
    :cond_2
    :goto_0
    const-string p0, "e_messages_ad"

    .line 30
    .line 31
    const-string v0, "p_messages_ad"

    .line 32
    .line 33
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public x(Ll/jtv;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d70;->x(Ll/jtv;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/sd2;->b()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/sd2$a;->b:Ll/gcg0;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
