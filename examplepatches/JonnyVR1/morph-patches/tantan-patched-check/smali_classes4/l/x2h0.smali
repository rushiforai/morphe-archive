.class public final synthetic Ll/x2h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/y2h0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ActionData;

.field public final synthetic c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;


# direct methods
.method public synthetic constructor <init>(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x2h0;->a:Ll/y2h0;

    iput-object p2, p0, Ll/x2h0;->b:Lcom/p1/mobile/putong/core/data/ActionData;

    iput-object p3, p0, Ll/x2h0;->c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x2h0;->a:Ll/y2h0;

    iget-object v1, p0, Ll/x2h0;->b:Lcom/p1/mobile/putong/core/data/ActionData;

    iget-object p0, p0, Ll/x2h0;->c:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    invoke-static {v0, v1, p0}, Ll/y2h0;->b(Ll/y2h0;Lcom/p1/mobile/putong/core/data/ActionData;Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;)V

    return-void
.end method
