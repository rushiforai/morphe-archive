.class public final synthetic Ll/fwh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fwh;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwh;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    check-cast p1, Lcom/p1/mobile/putong/data/Detect;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/share/a;->y(Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method
