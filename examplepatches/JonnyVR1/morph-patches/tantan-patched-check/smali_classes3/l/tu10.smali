.class public final synthetic Ll/tu10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/MultipleChatIconView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tu10;->a:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    iput-boolean p2, p0, Ll/tu10;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tu10;->a:Lcom/p1/mobile/putong/ui/MultipleChatIconView;

    iget-boolean p0, p0, Ll/tu10;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/MultipleChatIconView;->j0(Lcom/p1/mobile/putong/ui/MultipleChatIconView;Z)V

    return-void
.end method
