.class public final synthetic Ll/la90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qa90;

.field public final synthetic b:Lcom/tantan/library/svga/SVGAnimationView;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/qa90;Lcom/tantan/library/svga/SVGAnimationView;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/la90;->a:Ll/qa90;

    iput-object p2, p0, Ll/la90;->b:Lcom/tantan/library/svga/SVGAnimationView;

    iput-boolean p3, p0, Ll/la90;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/la90;->a:Ll/qa90;

    iget-object v1, p0, Ll/la90;->b:Lcom/tantan/library/svga/SVGAnimationView;

    iget-boolean p0, p0, Ll/la90;->c:Z

    check-cast p1, [I

    invoke-static {v0, v1, p0, p1}, Ll/qa90;->u(Ll/qa90;Lcom/tantan/library/svga/SVGAnimationView;Z[I)V

    return-void
.end method
