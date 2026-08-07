.class public final synthetic Ll/nbx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xbx;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Ll/xbx;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nbx;->a:Ll/xbx;

    iput-object p2, p0, Ll/nbx;->b:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nbx;->a:Ll/xbx;

    iget-object p0, p0, Ll/nbx;->b:Lcom/p1/mobile/putong/core/data/Message;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/xbx;->C0(Ll/xbx;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/Throwable;)V

    return-void
.end method
