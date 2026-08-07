.class public Ll/u5l;
.super Ll/pd00;
.source "SourceFile"


# instance fields
.field public J:Ljava/util/Timer;

.field public final K:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/app/PutongAct;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/app/PutongAct;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/pd00;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u5l;->K:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic Y(Ll/u5l;)Ljava/util/Timer;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5l;->J:Ljava/util/Timer;

    return-object p0
.end method

.method public static bridge synthetic Z(Ll/u5l;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u5l;->K:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static bridge synthetic a0(Ll/u5l;Ljava/util/Timer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u5l;->J:Ljava/util/Timer;

    return-void
.end method


# virtual methods
.method public E()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pd00;->E()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 5
    .line 6
    new-instance v1, Ll/u5l$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/u5l$a;-><init>(Ll/u5l;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->h0(Ll/ilw;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u5l;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u5l;->J:Ljava/util/Timer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/u5l;->J:Ljava/util/Timer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/u5l;->J:Ljava/util/Timer;

    .line 16
    .line 17
    :cond_0
    return-void
.end method
