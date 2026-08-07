.class public final synthetic Ll/wvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/yvg;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Frame;

.field public final synthetic c:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wvg;->a:Ll/yvg;

    iput-object p2, p0, Ll/wvg;->b:Lcom/p1/mobile/putong/feed/data/Frame;

    iput-object p3, p0, Ll/wvg;->c:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wvg;->a:Ll/yvg;

    iget-object v1, p0, Ll/wvg;->b:Lcom/p1/mobile/putong/feed/data/Frame;

    iget-object p0, p0, Ll/wvg;->c:Landroid/view/View;

    invoke-static {v0, v1, p0, p1}, Ll/yvg;->a(Ll/yvg;Lcom/p1/mobile/putong/feed/data/Frame;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
