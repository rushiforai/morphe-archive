.class public Ll/d550$a$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/d550$a;->onFinished()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/d550$a;


# direct methods
.method public constructor <init>(Ll/d550$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/d550$a$a;->a:Ll/d550$a;

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
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d550$a$a;->a:Ll/d550$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/d550$a;->b:Ll/d550;

    .line 4
    .line 5
    invoke-static {v0}, Ll/d550;->d(Ll/d550;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/d550$a$a;->a:Ll/d550$a;

    .line 14
    .line 15
    iget-object v0, v0, Ll/d550$a;->b:Ll/d550;

    .line 16
    .line 17
    invoke-static {v0}, Ll/d550;->c(Ll/d550;)Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onStart()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
