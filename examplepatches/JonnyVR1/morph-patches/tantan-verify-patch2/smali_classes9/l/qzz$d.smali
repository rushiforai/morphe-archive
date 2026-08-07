.class public Ll/qzz$d;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qzz;->J1(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Ll/qzz;


# direct methods
.method public constructor <init>(Ll/qzz;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qzz$d;->b:Ll/qzz;

    .line 2
    .line 3
    iput-object p2, p0, Ll/qzz$d;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qzz$d;->b:Ll/qzz;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qzz;->l1:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onStart()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzz$d;->a:Ll/x20;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
