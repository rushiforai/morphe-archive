.class public final synthetic Ll/thh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/PictureView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/thh0;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iput-object p2, p0, Ll/thh0;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iput-object p3, p0, Ll/thh0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/thh0;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    iget-object v1, p0, Ll/thh0;->b:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;

    iget-object p0, p0, Ll/thh0;->c:Lcom/p1/mobile/putong/core/ui/PictureView;

    invoke-static {v0, v1, p0}, Ll/uih0;->Q(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCardRoot;Lcom/p1/mobile/putong/core/ui/PictureView;)V

    return-void
.end method
