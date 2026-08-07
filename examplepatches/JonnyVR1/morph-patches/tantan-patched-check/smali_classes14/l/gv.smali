.class public final synthetic Ll/gv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kv;


# direct methods
.method public synthetic constructor <init>(Ll/kv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gv;->a:Ll/kv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gv;->a:Ll/kv;

    check-cast p1, Lcom/p1/mobile/putong/core/data/LogoutCounterEnvelope;

    invoke-static {p0, p1}, Ll/kv;->h0(Ll/kv;Lcom/p1/mobile/putong/core/data/LogoutCounterEnvelope;)V

    return-void
.end method
