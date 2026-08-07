.class public final synthetic Ll/ssl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MessageLocation;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ssl0;->a:Ll/y20;

    iput-object p2, p0, Ll/ssl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ssl0;->a:Ll/y20;

    iget-object p0, p0, Ll/ssl0;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/VipLocationItemView;->a(Ll/y20;Lcom/p1/mobile/putong/data/MessageLocation;Landroid/view/View;)Z

    move-result p0

    return p0
.end method
