.class public final synthetic Ll/qph;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ji80;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;


# direct methods
.method public synthetic constructor <init>(Ll/ji80;Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qph;->a:Ll/ji80;

    iput-object p2, p0, Ll/qph;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qph;->a:Ll/ji80;

    iget-object p0, p0, Ll/qph;->b:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->k(Ll/ji80;Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Landroid/view/View;)V

    return-void
.end method
