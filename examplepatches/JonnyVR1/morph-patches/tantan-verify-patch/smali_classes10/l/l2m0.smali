.class public final synthetic Ll/l2m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;Landroid/view/View;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

    iput-object p2, p0, Ll/l2m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;

    iput-object p3, p0, Ll/l2m0;->c:Landroid/view/View;

    iput-object p4, p0, Ll/l2m0;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l2m0;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;

    iget-object v1, p0, Ll/l2m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;

    iget-object v2, p0, Ll/l2m0;->c:Landroid/view/View;

    iget-object p0, p0, Ll/l2m0;->d:Landroid/view/View;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;->j0(Lcom/p1/mobile/putong/live/livingroom/virtual/preview/VirtualNewPreviewView;Lcom/p1/mobile/putong/live/base/data/BLiveStartPageTemplate;Landroid/view/View;Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
