.class public final synthetic Ll/wez;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ffz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;


# direct methods
.method public synthetic constructor <init>(Ll/ffz;Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wez;->a:Ll/ffz;

    iput-object p2, p0, Ll/wez;->b:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wez;->a:Ll/ffz;

    iget-object p0, p0, Ll/wez;->b:Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    invoke-static {v0, p0}, Ll/ffz;->u(Ll/ffz;Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V

    return-void
.end method
