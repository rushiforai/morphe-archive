.class public final synthetic Ll/q6n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field public final synthetic a:Ll/e7n;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;


# direct methods
.method public synthetic constructor <init>(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q6n;->a:Ll/e7n;

    iput-object p2, p0, Ll/q6n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    return-void
.end method


# virtual methods
.method public final onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q6n;->a:Ll/e7n;

    iget-object p0, p0, Ll/q6n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {v0, p0, p1}, Ll/e7n;->g4(Ll/e7n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Landroid/content/DialogInterface;)V

    return-void
.end method
