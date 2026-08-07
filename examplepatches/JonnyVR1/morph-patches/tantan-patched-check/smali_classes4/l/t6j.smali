.class public final synthetic Ll/t6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;

.field public final synthetic c:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t6j;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    iput-object p2, p0, Ll/t6j;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;

    iput-object p3, p0, Ll/t6j;->c:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t6j;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;

    iget-object v1, p0, Ll/t6j;->b:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;

    iget-object p0, p0, Ll/t6j;->c:Landroid/content/Context;

    invoke-static {v0, v1, p0, p1}, Ll/u6j;->o(Lcom/p1/mobile/putong/core/newui/home/base/impl/cardbottom/opt/d;Lcom/p1/mobile/putong/core/newui/home/views/CardBottomIntlLiveLayout;Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method
