.class public final synthetic Ll/iah;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r4h$a;


# instance fields
.field public final synthetic a:Ll/kah;


# direct methods
.method public synthetic constructor <init>(Ll/kah;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iah;->a:Ll/kah;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Ljava/lang/Object;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iah;->a:Ll/kah;

    check-cast p2, Lcom/p1/mobile/putong/feed/data/Interactive;

    invoke-static {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedInteractiveFlowView;->p(Ll/kah;Landroid/view/View;Lcom/p1/mobile/putong/feed/data/Interactive;I)V

    return-void
.end method
