.class public final synthetic Ll/y5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z5m0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;


# direct methods
.method public synthetic constructor <init>(Ll/z5m0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y5m0;->a:Ll/z5m0;

    iput-object p2, p0, Ll/y5m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y5m0;->a:Ll/z5m0;

    iget-object p0, p0, Ll/y5m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    invoke-static {v0, p0, p1}, Ll/z5m0;->b(Ll/z5m0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V

    return-void
.end method
