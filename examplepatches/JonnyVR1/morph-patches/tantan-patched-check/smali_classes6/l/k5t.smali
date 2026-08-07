.class public final synthetic Ll/k5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveModule;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveModule;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    check-cast p1, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->P(Lcom/p1/mobile/putong/live/LiveModule;Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V

    return-void
.end method
