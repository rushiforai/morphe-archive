.class public final synthetic Ll/l5o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l5o;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l5o;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    invoke-static {p0}, Ll/m5o;->b(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    move-result-object p0

    return-object p0
.end method
