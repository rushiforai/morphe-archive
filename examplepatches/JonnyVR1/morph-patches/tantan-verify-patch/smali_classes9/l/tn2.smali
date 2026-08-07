.class public final synthetic Ll/tn2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;

.field public final synthetic b:Ll/orc0;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;Ll/orc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tn2;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;

    iput-object p2, p0, Ll/tn2;->b:Ll/orc0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tn2;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;

    iget-object p0, p0, Ll/tn2;->b:Ll/orc0;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->q(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;Ll/orc0;)V

    return-void
.end method
