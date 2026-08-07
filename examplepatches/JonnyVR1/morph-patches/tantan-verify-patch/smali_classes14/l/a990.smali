.class public final synthetic Ll/a990;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e990;

.field public final synthetic b:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public synthetic constructor <init>(Ll/e990;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a990;->a:Ll/e990;

    iput-object p2, p0, Ll/a990;->b:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a990;->a:Ll/e990;

    iget-object p0, p0, Ll/a990;->b:Lcom/tantan/library/svga/SVGAnimationView;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/e990;->p(Ll/e990;Lcom/tantan/library/svga/SVGAnimationView;[I)V

    return-void
.end method
