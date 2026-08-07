.class public final synthetic Ll/x4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:I

.field public final synthetic d:Lcom/tantan/library/svga/AnimListener;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;ILcom/tantan/library/svga/AnimListener;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x4;->a:Lcom/tantan/library/svga/SVGAnimationView;

    iput-object p2, p0, Ll/x4;->b:Landroid/view/View;

    iput p3, p0, Ll/x4;->c:I

    iput-object p4, p0, Ll/x4;->d:Lcom/tantan/library/svga/AnimListener;

    iput-object p5, p0, Ll/x4;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x4;->a:Lcom/tantan/library/svga/SVGAnimationView;

    iget-object v1, p0, Ll/x4;->b:Landroid/view/View;

    iget v2, p0, Ll/x4;->c:I

    iget-object v3, p0, Ll/x4;->d:Lcom/tantan/library/svga/AnimListener;

    iget-object p0, p0, Ll/x4;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/y4;->c(Lcom/tantan/library/svga/SVGAnimationView;Landroid/view/View;ILcom/tantan/library/svga/AnimListener;Ljava/lang/String;)V

    return-void
.end method
