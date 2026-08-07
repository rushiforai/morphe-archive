.class public final synthetic Ll/j45;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j45;->a:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j45;->a:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Ll/gcg0;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/ChooserTargetService;->a(Lcom/p1/mobile/putong/data/User;Ll/gcg0;)V

    return-void
.end method
