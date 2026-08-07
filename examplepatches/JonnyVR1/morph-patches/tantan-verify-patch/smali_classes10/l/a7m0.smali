.class public final synthetic Ll/a7m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a7m0;->a:Ll/y20;

    iput-object p2, p0, Ll/a7m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a7m0;->a:Ll/y20;

    iget-object p0, p0, Ll/a7m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/userCard/dressup/VirtualUserDressUpItemView;->a(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveUserDressUp;Landroid/view/View;)V

    return-void
.end method
