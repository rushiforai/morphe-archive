.class public Ll/s20$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ll/s20$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/s20$c;->b:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrx/c;->asObservable()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/t20;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/t20;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->takeUntil(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/u20;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/u20;-><init>(Ll/s20$c;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic a(Ll/s20$c;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s20$c;->c(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x5

    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public final synthetic c(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s20$c;->c:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/s20$b;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_6

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    if-eq p1, v1, :cond_5

    .line 20
    .line 21
    const/4 v1, 0x2

    .line 22
    if-eq p1, v1, :cond_4

    .line 23
    .line 24
    const/4 v1, 0x3

    .line 25
    if-eq p1, v1, :cond_3

    .line 26
    .line 27
    const/4 v1, 0x4

    .line 28
    if-eq p1, v1, :cond_2

    .line 29
    .line 30
    const/4 v0, 0x5

    .line 31
    if-eq p1, v0, :cond_1

    .line 32
    .line 33
    :goto_0
    return-void

    .line 34
    :cond_1
    invoke-static {}, Ll/s20;->a()Ll/l01;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p0, p0, Ll/s20$c;->a:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p0}, Ll/oof0;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-interface {v0}, Ll/s20$b;->d()V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_3
    invoke-interface {v0}, Ll/s20$b;->a()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_4
    invoke-interface {v0}, Ll/s20$b;->e()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_5
    invoke-interface {v0}, Ll/s20$b;->c()V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_6
    invoke-interface {v0}, Ll/s20$b;->b()V

    .line 61
    .line 62
    .line 63
    return-void
.end method
