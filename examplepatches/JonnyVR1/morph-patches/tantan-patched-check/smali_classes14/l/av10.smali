.class public final synthetic Ll/av10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/cv10;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/cv10;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/av10;->a:Ll/cv10;

    iput-object p2, p0, Ll/av10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    iput p3, p0, Ll/av10;->c:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/av10;->a:Ll/cv10;

    iget-object v1, p0, Ll/av10;->b:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    iget p0, p0, Ll/av10;->c:I

    invoke-static {v0, v1, p0, p1}, Ll/cv10;->c(Ll/cv10;Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;ILandroid/view/View;)V

    return-void
.end method
