.class public Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/messages/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch$a;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private synthetic E(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    new-array p2, p2, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_kankan_chat_notice"

    .line 5
    .line 6
    const-string v1, "p_kankan_chat_popup"

    .line 7
    .line 8
    invoke-static {v0, v1, p2}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->C(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->ap(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic u(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v1, 0x9c6c

    .line 11
    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const v1, 0x9c6d

    .line 16
    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    :cond_0
    const-string p0, "\u5bf9\u65b9\u8d26\u53f7\u5f02\u5e38"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->E(Lcom/p1/mobile/putong/core/data/Message;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->b:Lv/VText;

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->a:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/h39;->C()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const-string v1, "\u5979"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v1, "\u4ed6"

    .line 31
    .line 32
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->a:Landroid/widget/TextView;

    .line 33
    .line 34
    const-string v3, "%1$s\u5411\u4f60\u8868\u8fbe\u4e86\u597d\u611f\uff0c%2$s"

    .line 35
    .line 36
    filled-new-array {v1, v0}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->b:Lv/VText;

    .line 48
    .line 49
    new-instance v1, Ll/v5q;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/v5q;-><init>(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch$a;->a(Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final C(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/j;->f5(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/w5q;

    .line 16
    .line 17
    invoke-direct {v1, p1}, Ll/w5q;-><init>(Lcom/p1/mobile/putong/core/data/Message;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x1

    .line 29
    invoke-virtual {p0, p1}, Lrx/c;->take(I)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    new-instance p1, Ll/x5q;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/x5q;-><init>()V

    .line 36
    .line 37
    .line 38
    new-instance v0, Ll/y5q;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/y5q;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public J()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/String;",
            "Ljava/lang/Runnable;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Void;",
            ">;>;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public m(IZLcom/p1/mobile/putong/core/ui/messages/ItemMessageBase;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/greet/ItemGreetAgreeMatch;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
