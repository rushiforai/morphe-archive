.class public final synthetic Ll/pdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/camera/widget/e;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/e;ILcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pdh;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/e;

    iput p2, p0, Ll/pdh;->b:I

    iput-object p3, p0, Ll/pdh;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pdh;->a:Lcom/p1/mobile/putong/feed/newui/camera/widget/e;

    iget v1, p0, Ll/pdh;->b:I

    iget-object p0, p0, Ll/pdh;->c:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/e;->E(Lcom/p1/mobile/putong/feed/newui/camera/widget/e;ILcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;Landroid/view/View;)V

    return-void
.end method
