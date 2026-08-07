.class public Ll/yvg$a;
.super Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yvg;->j(Lcom/p1/mobile/putong/feed/data/Frame;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

.field public final synthetic b:Ll/yvg;


# direct methods
.method public constructor <init>(Ll/yvg;Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yvg$a;->b:Ll/yvg;

    .line 2
    .line 3
    iput-object p2, p0, Ll/yvg$a;->a:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantanapp/media/ttmediaeffect/anim/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yvg$a;->a:Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
