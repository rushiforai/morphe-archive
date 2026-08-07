.class public final synthetic Ll/n1q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/SignInGrantType;

.field public final synthetic c:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

.field public final synthetic d:Ll/x20;

.field public final synthetic e:Ljava/lang/Runnable;

.field public final synthetic f:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n1q0;->a:Ll/v3q0;

    iput-object p2, p0, Ll/n1q0;->b:Lcom/p1/mobile/putong/data/SignInGrantType;

    iput-object p3, p0, Ll/n1q0;->c:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iput-object p4, p0, Ll/n1q0;->d:Ll/x20;

    iput-object p5, p0, Ll/n1q0;->e:Ljava/lang/Runnable;

    iput-object p6, p0, Ll/n1q0;->f:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/n1q0;->a:Ll/v3q0;

    iget-object v1, p0, Ll/n1q0;->b:Lcom/p1/mobile/putong/data/SignInGrantType;

    iget-object v2, p0, Ll/n1q0;->c:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    iget-object v3, p0, Ll/n1q0;->d:Ll/x20;

    iget-object v4, p0, Ll/n1q0;->e:Ljava/lang/Runnable;

    iget-object v5, p0, Ll/n1q0;->f:Ljava/lang/Throwable;

    move-object v6, p1

    check-cast v6, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v6}, Ll/v3q0;->e0(Ll/v3q0;Lcom/p1/mobile/putong/data/SignInGrantType;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Ll/x20;Ljava/lang/Runnable;Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    return-void
.end method
