.class public final synthetic Ll/aak;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aak;->a:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aak;->a:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/a;->q0(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Ljava/lang/Throwable;)V

    return-void
.end method
