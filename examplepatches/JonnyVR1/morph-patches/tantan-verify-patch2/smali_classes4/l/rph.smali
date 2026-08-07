.class public final synthetic Ll/rph;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rph;->a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rph;->a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->h(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V

    return-void
.end method
