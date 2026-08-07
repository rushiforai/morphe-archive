.class public final synthetic Ll/vvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yvg;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/Frame;


# direct methods
.method public synthetic constructor <init>(Ll/yvg;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vvg;->a:Ll/yvg;

    iput-object p2, p0, Ll/vvg;->b:Landroid/view/View;

    iput-object p3, p0, Ll/vvg;->c:Lcom/p1/mobile/putong/feed/data/Frame;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vvg;->a:Ll/yvg;

    iget-object v1, p0, Ll/vvg;->b:Landroid/view/View;

    iget-object p0, p0, Ll/vvg;->c:Lcom/p1/mobile/putong/feed/data/Frame;

    invoke-static {v0, v1, p0, p1}, Ll/yvg;->h(Ll/yvg;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V

    return-void
.end method
