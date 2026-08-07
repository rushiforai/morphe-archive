.class public final synthetic Ll/kw4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/mw4;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;


# direct methods
.method public synthetic constructor <init>(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kw4;->a:Ll/mw4;

    iput-object p2, p0, Ll/kw4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kw4;->a:Ll/mw4;

    iget-object p0, p0, Ll/kw4;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {v0, p0, p1}, Ll/mw4;->f4(Ll/mw4;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V

    return-void
.end method
