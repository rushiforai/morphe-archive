.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;


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
.method public a()Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;Ll/sbf0;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public b(Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->b:Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$Page;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/SignInEvent$a;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
