.class public final synthetic Ll/qqf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# instance fields
.field public final synthetic a:Ll/tqf0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;


# direct methods
.method public synthetic constructor <init>(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qqf0;->a:Ll/tqf0;

    iput-object p2, p0, Ll/qqf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    return-void
.end method


# virtual methods
.method public final onShow(Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qqf0;->a:Ll/tqf0;

    iget-object p0, p0, Ll/qqf0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-static {v0, p0, p1}, Ll/tqf0;->b(Ll/tqf0;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Landroid/content/DialogInterface;)V

    return-void
.end method
