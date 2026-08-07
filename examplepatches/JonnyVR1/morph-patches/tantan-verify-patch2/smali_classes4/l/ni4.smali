.class public final synthetic Ll/ni4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

.field public final synthetic b:Ll/oql;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Ll/oql;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ni4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    iput-object p2, p0, Ll/ni4;->b:Ll/oql;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ni4;->a:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;

    iget-object p0, p0, Ll/ni4;->b:Ll/oql;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;->P(Lcom/p1/mobile/putong/core/newui/home/views/CardBottomLiveView;Ll/oql;Landroid/view/View;)V

    return-void
.end method
