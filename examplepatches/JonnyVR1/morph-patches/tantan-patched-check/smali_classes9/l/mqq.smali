.class public final synthetic Ll/mqq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;

.field public final synthetic b:Ll/z20;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Ll/z20;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;

    iput-object p2, p0, Ll/mqq;->b:Ll/z20;

    iput-object p3, p0, Ll/mqq;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mqq;->a:Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;

    iget-object v1, p0, Ll/mqq;->b:Ll/z20;

    iget-object p0, p0, Ll/mqq;->c:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;->a(Lcom/p1/mobile/putong/live/livingroom/common/plughub/plugs/dialog/JsDialogContentView;Ll/z20;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveJsDialogItemType;)V

    return-void
.end method
