.class public final synthetic Ll/ggm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ggm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ggm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    check-cast p1, Lcom/p1/mobile/putong/data/VisitorCounter;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->z0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Lcom/p1/mobile/putong/data/VisitorCounter;)V

    return-void
.end method
