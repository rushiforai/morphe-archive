.class public final synthetic Ll/rt8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/lu8;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;


# direct methods
.method public synthetic constructor <init>(Ll/lu8;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rt8;->a:Ll/lu8;

    iput-object p2, p0, Ll/rt8;->b:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rt8;->a:Ll/lu8;

    iget-object p0, p0, Ll/rt8;->b:Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/lu8;->t3(Ll/lu8;Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
