.class public final synthetic Ll/yue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/SignInGrantType;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yue;->a:Lcom/p1/mobile/putong/data/SignInGrantType;

    iput-object p2, p0, Ll/yue;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iput-object p3, p0, Ll/yue;->c:Ll/x20;

    iput-object p4, p0, Ll/yue;->d:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yue;->a:Lcom/p1/mobile/putong/data/SignInGrantType;

    iget-object v1, p0, Ll/yue;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iget-object v2, p0, Ll/yue;->c:Ll/x20;

    iget-object p0, p0, Ll/yue;->d:Ljava/lang/Runnable;

    invoke-static {v0, v1, v2, p0}, Ll/sve;->C1(Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;)V

    return-void
.end method
