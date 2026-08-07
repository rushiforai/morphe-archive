.class public final synthetic Ll/o3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iput-object p2, p0, Ll/o3b;->b:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o3b;->a:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    iget-object p0, p0, Ll/o3b;->b:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->u5(Lcom/p1/mobile/putong/core/api/CoreSuggested;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
