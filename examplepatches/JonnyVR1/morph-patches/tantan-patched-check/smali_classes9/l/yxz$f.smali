.class public Ll/yxz$f;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/yxz;->Y4(ILcom/p1/mobile/putong/core/data/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yxz$f;->a:Ll/yxz;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yxz$f;->a:Ll/yxz;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {v0, v1}, Ll/yxz;->v3(Ll/yxz;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/yxz$f;->a:Ll/yxz;

    .line 11
    .line 12
    iget-object v0, v0, Ll/qzz;->S0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/yxz$f;->a:Ll/yxz;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p0, v0}, Ll/yxz;->u3(Ll/yxz;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/yxz$f;->a:Ll/yxz;

    .line 5
    .line 6
    iget-object p0, p0, Ll/qzz;->S0:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
