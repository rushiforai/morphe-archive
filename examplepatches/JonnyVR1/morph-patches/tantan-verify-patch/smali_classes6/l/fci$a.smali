.class public Ll/fci$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fci;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# static fields
.field public static b:Ll/fci$a;


# instance fields
.field public a:Ll/fci;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/fci$a;

    .line 2
    .line 3
    new-instance v1, Ll/fci;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Ll/fci;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/fci$a;-><init>(Ll/fci;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/fci$a;->b:Ll/fci$a;

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Ll/fci;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fci$a;->a:Ll/fci;

    .line 5
    .line 6
    invoke-static {}, Ll/mrb0;->B()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/eci;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/eci;-><init>(Ll/fci$a;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/fci$a;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fci$a;->b(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static c()V
    .locals 3

    .line 1
    new-instance v0, Ll/fci$a;

    .line 2
    .line 3
    new-instance v1, Ll/fci;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Ll/fci;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/fci$a;-><init>(Ll/fci;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/fci$a;->b:Ll/fci$a;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final synthetic b(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fci$a;->a:Ll/fci;

    .line 2
    .line 3
    iput-object p1, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    return-void
.end method
