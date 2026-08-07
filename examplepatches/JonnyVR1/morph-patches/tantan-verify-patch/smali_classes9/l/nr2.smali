.class public final synthetic Ll/nr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;

.field public final synthetic b:Ll/fsq;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;Ll/fsq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nr2;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;

    iput-object p2, p0, Ll/nr2;->b:Ll/fsq;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nr2;->a:Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;

    iget-object p0, p0, Ll/nr2;->b:Ll/fsq;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->i0(Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;Ll/fsq;)V

    return-void
.end method
