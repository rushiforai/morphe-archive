.class public final synthetic Ll/l2a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

.field public final synthetic b:Ll/f59;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    iput-object p2, p0, Ll/l2a;->b:Ll/f59;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;

    iget-object p0, p0, Ll/l2a;->b:Ll/f59;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;->p(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestItem;Ll/f59;Landroid/view/View;)V

    return-void
.end method
