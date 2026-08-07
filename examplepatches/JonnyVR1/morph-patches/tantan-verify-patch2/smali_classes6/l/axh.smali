.class public final synthetic Ll/axh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/cxh;

.field public final synthetic b:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public synthetic constructor <init>(Ll/cxh;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/axh;->a:Ll/cxh;

    iput-object p2, p0, Ll/axh;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/axh;->a:Ll/cxh;

    iget-object p0, p0, Ll/axh;->b:Lcom/p1/mobile/putong/data/BubbleInfo;

    invoke-static {v0, p0}, Ll/cxh;->l(Ll/cxh;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    return-void
.end method
