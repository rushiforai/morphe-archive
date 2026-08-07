.class public final synthetic Ll/tus;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zus;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;


# direct methods
.method public synthetic constructor <init>(Ll/zus;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tus;->a:Ll/zus;

    iput-object p2, p0, Ll/tus;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tus;->a:Ll/zus;

    iget-object p0, p0, Ll/tus;->b:Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;

    invoke-static {v0, p0, p1}, Ll/zus;->Q2(Ll/zus;Lcom/p1/mobile/putong/live/base/data/BLiveMenuItem;Landroid/view/View;)V

    return-void
.end method
