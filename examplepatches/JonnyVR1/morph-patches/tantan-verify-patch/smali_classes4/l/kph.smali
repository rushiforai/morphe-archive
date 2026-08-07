.class public final synthetic Ll/kph;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

.field public final synthetic b:Ll/ji80;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kph;->a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    iput-object p2, p0, Ll/kph;->b:Ll/ji80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kph;->a:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    iget-object p0, p0, Ll/kph;->b:Ll/ji80;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemMyTagsView;->c(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Ll/ji80;Landroid/view/View;)V

    return-void
.end method
