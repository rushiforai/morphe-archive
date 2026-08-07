.class public final synthetic Ll/ttd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public synthetic constructor <init>(Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ttd0;->a:Lcom/tantan/library/svga/SVGAnimationView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ttd0;->a:Lcom/tantan/library/svga/SVGAnimationView;

    invoke-static {p0}, Lcom/tantan/library/svga/SVGAnimationView;->d(Lcom/tantan/library/svga/SVGAnimationView;)V

    return-void
.end method
