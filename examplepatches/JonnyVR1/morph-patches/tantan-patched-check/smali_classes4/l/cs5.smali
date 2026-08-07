.class public final synthetic Ll/cs5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hs5;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/hs5;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cs5;->a:Ll/hs5;

    iput-object p2, p0, Ll/cs5;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cs5;->a:Ll/hs5;

    iget-object p0, p0, Ll/cs5;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    invoke-static {v0, p0, p1}, Ll/hs5;->H(Ll/hs5;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V

    return-void
.end method
