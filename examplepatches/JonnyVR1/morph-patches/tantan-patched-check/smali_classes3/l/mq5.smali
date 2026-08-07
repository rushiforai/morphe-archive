.class public final synthetic Ll/mq5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/compliment/a;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/compliment/a;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mq5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    iput-object p2, p0, Ll/mq5;->b:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mq5;->a:Lcom/p1/mobile/putong/core/ui/compliment/a;

    iget-object p0, p0, Ll/mq5;->b:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/compliment/a;->Q(Lcom/p1/mobile/putong/core/ui/compliment/a;Lcom/p1/mobile/putong/data/Envelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
