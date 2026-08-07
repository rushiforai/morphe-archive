.class public final synthetic Ll/orp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rrp;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/rrp;Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/orp;->a:Ll/rrp;

    iput-object p2, p0, Ll/orp;->b:Ll/jl80;

    iput-object p3, p0, Ll/orp;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/orp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;

    iput-boolean p5, p0, Ll/orp;->e:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/orp;->a:Ll/rrp;

    iget-object v1, p0, Ll/orp;->b:Ll/jl80;

    iget-object v2, p0, Ll/orp;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/orp;->d:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;

    iget-boolean v4, p0, Ll/orp;->e:Z

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/rrp;->K3(Ll/rrp;Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;ZLandroid/view/View;)V

    return-void
.end method
