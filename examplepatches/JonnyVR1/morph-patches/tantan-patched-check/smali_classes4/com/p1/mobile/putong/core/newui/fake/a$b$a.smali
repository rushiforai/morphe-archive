.class public Lcom/p1/mobile/putong/core/newui/fake/a$b$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/fake/a$b;->onFinished()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/fake/a$b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/fake/a$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/a$b;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStart()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b$a;->a:Lcom/p1/mobile/putong/core/newui/fake/a$b;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a$b;->a:Lcom/p1/mobile/putong/core/newui/fake/a;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/fake/a;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
