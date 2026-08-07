.class public final synthetic Ll/eu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/iu5;

.field public final synthetic b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;


# direct methods
.method public synthetic constructor <init>(Ll/iu5;Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eu5;->a:Ll/iu5;

    iput-object p2, p0, Ll/eu5;->b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/eu5;->a:Ll/iu5;

    iget-object p0, p0, Ll/eu5;->b:Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, p0, p1}, Ll/iu5;->f(Ll/iu5;Lcom/p1/mobile/longlink/msg/livegift/LongLinkConfession$ConfessionGiftReceiveMsg;Ljava/lang/Long;)V

    return-void
.end method
