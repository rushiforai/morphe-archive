.class public final synthetic Ll/fjn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/jjn0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;


# direct methods
.method public synthetic constructor <init>(Ll/jjn0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjn0;->a:Ll/jjn0;

    iput-object p2, p0, Ll/fjn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fjn0;->a:Ll/jjn0;

    iget-object p0, p0, Ll/fjn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;

    invoke-static {v0, p0, p1}, Ll/jjn0;->F(Ll/jjn0;Lcom/p1/mobile/putong/live/base/data/BLiveBossCallDetail;Landroid/view/View;)V

    return-void
.end method
