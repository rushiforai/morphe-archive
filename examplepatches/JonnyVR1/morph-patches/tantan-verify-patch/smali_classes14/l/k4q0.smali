.class public final synthetic Ll/k4q0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v3q0$e;

.field public final synthetic b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;


# direct methods
.method public synthetic constructor <init>(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k4q0;->a:Ll/v3q0$e;

    iput-object p2, p0, Ll/k4q0;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k4q0;->a:Ll/v3q0$e;

    iget-object p0, p0, Ll/k4q0;->b:Lcom/p1/mobile/putong/account/data/ThirdPartyData;

    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    invoke-static {v0, p0, p1}, Ll/v3q0$e;->g(Ll/v3q0$e;Lcom/p1/mobile/putong/account/data/ThirdPartyData;Lcom/p1/mobile/putong/data/SignUpData;)V

    return-void
.end method
