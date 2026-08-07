.class public final synthetic Ll/fjj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jjj0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;


# direct methods
.method public synthetic constructor <init>(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjj0;->a:Ll/jjj0;

    iput-object p2, p0, Ll/fjj0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fjj0;->a:Ll/jjj0;

    iget-object p0, p0, Ll/fjj0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;

    invoke-static {v0, p0, p1}, Ll/jjj0;->J3(Ll/jjj0;Lcom/p1/mobile/putong/live/base/data/BLiveTreasureBox;Landroid/view/View;)V

    return-void
.end method
