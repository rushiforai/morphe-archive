.class public final synthetic Ll/q97;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/data/Envelope$ApiParseCompleteListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/CoreBusinessModule;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/CoreBusinessModule;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q97;->a:Lcom/p1/mobile/putong/core/CoreBusinessModule;

    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q97;->a:Lcom/p1/mobile/putong/core/CoreBusinessModule;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->J(Lcom/p1/mobile/putong/core/CoreBusinessModule;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
