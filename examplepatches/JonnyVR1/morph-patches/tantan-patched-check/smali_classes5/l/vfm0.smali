.class public final synthetic Ll/vfm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/vfm0;->a:Z

    iput-object p2, p0, Ll/vfm0;->b:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/vfm0;->a:Z

    iget-object p0, p0, Ll/vfm0;->b:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    check-cast p1, Ll/pf60;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->i0(ZLcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Ll/pf60;)V

    return-void
.end method
