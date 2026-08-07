.class public final synthetic Ll/abu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

.field public final synthetic d:Ll/jbt;


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;Ll/jbt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/abu;->a:Ljava/util/HashMap;

    iput-object p2, p0, Ll/abu;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/abu;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    iput-object p4, p0, Ll/abu;->d:Ll/jbt;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/abu;->a:Ljava/util/HashMap;

    iget-object v1, p0, Ll/abu;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/abu;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;

    iget-object p0, p0, Ll/abu;->d:Ll/jbt;

    invoke-static {v0, v1, v2, p0, p1}, Ll/bbu;->a(Ljava/util/HashMap;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAnchors;Ll/jbt;Landroid/view/View;)V

    return-void
.end method
