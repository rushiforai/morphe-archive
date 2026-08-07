.class public final synthetic Ll/b46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b46;->a:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    return-void
.end method


# virtual methods
.method public final doFrame(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b46;->a:Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;

    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;->b(Lcom/p1/mobile/putong/core/newui/messages/ConvCellList;J)V

    return-void
.end method
