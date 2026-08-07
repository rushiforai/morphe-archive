.class public final synthetic Ll/fsz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatHeat;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fsz;->a:Ll/tvz;

    iput-object p2, p0, Ll/fsz;->b:Lcom/p1/mobile/putong/core/data/ChatHeat;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fsz;->a:Ll/tvz;

    iget-object p0, p0, Ll/fsz;->b:Lcom/p1/mobile/putong/core/data/ChatHeat;

    invoke-static {v0, p0}, Ll/tvz;->Hb(Ll/tvz;Lcom/p1/mobile/putong/core/data/ChatHeat;)V

    return-void
.end method
