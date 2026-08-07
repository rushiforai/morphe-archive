.class public final synthetic Ll/xb90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ac90;

.field public final synthetic b:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public synthetic constructor <init>(Ll/ac90;Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xb90;->a:Ll/ac90;

    iput-object p2, p0, Ll/xb90;->b:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xb90;->a:Ll/ac90;

    iget-object p0, p0, Ll/xb90;->b:Lcom/tantan/library/svga/SVGAnimationView;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/ac90;->p(Ll/ac90;Lcom/tantan/library/svga/SVGAnimationView;[I)V

    return-void
.end method
