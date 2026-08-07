.class public final synthetic Ll/ye70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hf70;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Group;


# direct methods
.method public synthetic constructor <init>(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ye70;->a:Ll/hf70;

    iput-object p2, p0, Ll/ye70;->b:Lcom/p1/mobile/putong/feed/data/Group;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ye70;->a:Ll/hf70;

    iget-object p0, p0, Ll/ye70;->b:Lcom/p1/mobile/putong/feed/data/Group;

    invoke-static {v0, p0}, Ll/hf70;->k(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Group;)V

    return-void
.end method
