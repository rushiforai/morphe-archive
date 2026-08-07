.class public final synthetic Ll/rhh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/qhh$c;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/ViewersBox;


# direct methods
.method public synthetic constructor <init>(Ll/qhh$c;Lcom/p1/mobile/putong/feed/data/ViewersBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rhh;->a:Ll/qhh$c;

    iput-object p2, p0, Ll/rhh;->b:Lcom/p1/mobile/putong/feed/data/ViewersBox;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rhh;->a:Ll/qhh$c;

    iget-object p0, p0, Ll/rhh;->b:Lcom/p1/mobile/putong/feed/data/ViewersBox;

    invoke-static {v0, p0, p1}, Ll/qhh$c;->E(Ll/qhh$c;Lcom/p1/mobile/putong/feed/data/ViewersBox;Landroid/view/View;)V

    return-void
.end method
