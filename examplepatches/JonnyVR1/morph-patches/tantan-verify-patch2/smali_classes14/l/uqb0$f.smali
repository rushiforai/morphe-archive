.class public Ll/uqb0$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uqb0;->f1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/uxj0;)V
    .locals 1

    .line 1
    sget-object p0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/bn5;->me_()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const-string v0, "[putong-common][userMeState]"

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Ll/uqb0;->O0(Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const-string p0, "USER_ME_STATE_SUCCESS from userMeCallPrepareNewSignIn"

    .line 29
    .line 30
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p0, "userMeCallPrepareNewSignIn but me still null"

    .line 35
    .line 36
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/uqb0;->w0:Lrx/subjects/a;

    .line 40
    .line 41
    const/4 p1, 0x2

    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uqb0$f;->a(Ll/uxj0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
