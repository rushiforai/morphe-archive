.class public Ll/bbm$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ay2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/bbm;->r(Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ll/bbm;


# direct methods
.method public constructor <init>(Ll/bbm;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 2
    .line 3
    iput-object p2, p0, Ll/bbm$a;->a:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/android/billingclient/api/d;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-static {v1}, Ll/bbm;->e(Ll/bbm;)Lcom/android/billingclient/api/a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {v1, p1}, Ll/bbm;->g(Ll/bbm;Lcom/android/billingclient/api/a;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 18
    .line 19
    invoke-static {p1}, Ll/bbm;->d(Ll/bbm;)Lrx/subjects/a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 29
    .line 30
    invoke-static {p1, v2}, Ll/bbm;->f(Ll/bbm;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/bbm$a;->a:Ljava/lang/Runnable;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Ll/bbm$a;->a:Ljava/lang/Runnable;

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void

    .line 47
    :cond_1
    invoke-static {v1}, Ll/bbm;->d(Ll/bbm;)Lrx/subjects/a;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    new-instance v1, Ljava/lang/RuntimeException;

    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->a()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    const/4 v4, 0x3

    .line 66
    new-array v4, v4, [Ljava/lang/CharSequence;

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    aput-object v3, v4, v5

    .line 70
    .line 71
    const-string v3, "_"

    .line 72
    .line 73
    aput-object v3, v4, v2

    .line 74
    .line 75
    const/4 v2, 0x2

    .line 76
    aput-object p1, v4, v2

    .line 77
    .line 78
    invoke-static {v4}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onError(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 93
    .line 94
    invoke-static {p0, v5}, Ll/bbm;->f(Ll/bbm;Z)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bbm;->d(Ll/bbm;)Lrx/subjects/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/bbm$a;->b:Ll/bbm;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, v0}, Ll/bbm;->f(Ll/bbm;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
