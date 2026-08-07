.class public final synthetic Ll/j6h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j6h;->a:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    iput-object p2, p0, Ll/j6h;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j6h;->a:Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;

    iget-object p0, p0, Ll/j6h;->b:Landroid/content/Context;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;->Q(Lcom/p1/mobile/putong/feed/newui/group/FeedGroupEntranceView;Landroid/content/Context;Landroid/view/View;)V

    return-void
.end method
