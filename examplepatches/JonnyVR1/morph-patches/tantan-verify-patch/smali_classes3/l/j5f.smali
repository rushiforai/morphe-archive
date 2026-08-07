.class public Ll/j5f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j5f$e;
    }
.end annotation


# static fields
.field public static a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/j5f$e;",
            ">;"
        }
    .end annotation
.end field

.field public static b:Ll/kcg0;

.field public static c:Lcom/sina/weibo/sdk/share/WbShareCallback;

.field public static d:Lcom/tencent/mm/opensdk/openapi/IWXAPIEventHandler;

.field public static e:Lcom/tencent/tauth/IUiListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/j5f;->a:Lrx/subjects/b;

    .line 6
    .line 7
    new-instance v0, Ll/j5f$a;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/j5f$a;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Ll/j5f;->c:Lcom/sina/weibo/sdk/share/WbShareCallback;

    .line 13
    .line 14
    new-instance v0, Ll/j5f$b;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/j5f$b;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/j5f;->d:Lcom/tencent/mm/opensdk/openapi/IWXAPIEventHandler;

    .line 20
    .line 21
    new-instance v0, Ll/j5f$c;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/j5f$c;-><init>()V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/j5f;->e:Lcom/tencent/tauth/IUiListener;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/kcg0;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static b(Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/j5f$e;",
            ">;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/j5f;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/j5f;->a(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/j5f;->a:Lrx/subjects/b;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/j5f$d;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/j5f$d;-><init>(Ll/y20;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sput-object p0, Ll/j5f;->b:Ll/kcg0;

    .line 23
    .line 24
    return-void
.end method

.method public static c(Ll/j5f$e;)V
    .locals 1

    .line 1
    sget-object v0, Ll/j5f;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
