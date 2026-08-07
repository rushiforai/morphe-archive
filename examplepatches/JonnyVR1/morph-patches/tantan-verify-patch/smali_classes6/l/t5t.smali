.class public final synthetic Ll/t5t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/LiveModule;

.field public final synthetic b:Ll/vwt;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/LiveModule;Ll/vwt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    iput-object p2, p0, Ll/t5t;->b:Ll/vwt;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5t;->a:Lcom/p1/mobile/putong/live/LiveModule;

    iget-object p0, p0, Ll/t5t;->b:Ll/vwt;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/LiveModule;->Q(Lcom/p1/mobile/putong/live/LiveModule;Ll/vwt;Ll/uxj0;)V

    return-void
.end method
