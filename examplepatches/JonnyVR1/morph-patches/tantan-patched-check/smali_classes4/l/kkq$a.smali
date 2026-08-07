.class public Ll/kkq$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kkq;->j()Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/kkq;


# direct methods
.method public constructor <init>(Ll/kkq;Ll/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/kkq$a;->b:Ll/kkq;

    .line 2
    .line 3
    iput-object p2, p0, Ll/kkq$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/kkq$a;->b:Ll/kkq;

    .line 5
    .line 6
    invoke-static {p1}, Ll/kkq;->i(Ll/kkq;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->unregisterOnActivityResultListener(Lcom/p1/mobile/android/app/a$a;)V

    .line 11
    .line 12
    .line 13
    const/16 p1, 0x400

    .line 14
    .line 15
    if-ne p2, p1, :cond_1

    .line 16
    .line 17
    :try_start_0
    const-string p1, "jdpay_Result"

    .line 18
    .line 19
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object p2, Lcom/p1/mobile/putong/core/data/JDPayAuthorResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Lcom/p1/mobile/putong/core/data/JDPayAuthorResult;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/JDPayAuthorResult;->payStatus:Ljava/lang/String;

    .line 32
    .line 33
    const-string p2, "JDP_PAY_SUCCESS"

    .line 34
    .line 35
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    iget-object p2, p0, Ll/kkq$a;->a:Ll/gcg0;

    .line 40
    .line 41
    if-eqz p1, :cond_0

    .line 42
    .line 43
    :try_start_1
    sget-object p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->succeed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 44
    .line 45
    invoke-interface {p2, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 50
    .line 51
    invoke-interface {p2, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    iget-object p1, p0, Ll/kkq$a;->a:Ll/gcg0;

    .line 56
    .line 57
    sget-object p2, Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;->failed:Lcom/p1/mobile/putong/api/api/PaymentApi$PaymentResultStatus;

    .line 58
    .line 59
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    :goto_0
    iget-object p0, p0, Ll/kkq$a;->a:Ll/gcg0;

    .line 63
    .line 64
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    return p0

    .line 69
    :cond_1
    iget-object p0, p0, Ll/kkq$a;->a:Ll/gcg0;

    .line 70
    .line 71
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return p0
.end method
