.class public final synthetic Ll/pnp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aop;


# direct methods
.method public synthetic constructor <init>(Ll/aop;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pnp;->a:Ll/aop;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pnp;->a:Ll/aop;

    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;

    invoke-static {p0, p1}, Ll/aop;->a(Ll/aop;Lcom/p1/mobile/putong/core/data/RecentContractInfosEnvelope;)V

    return-void
.end method
