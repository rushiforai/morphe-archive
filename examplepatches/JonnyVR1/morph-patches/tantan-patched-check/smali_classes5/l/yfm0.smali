.class public final synthetic Ll/yfm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yfm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yfm0;->a:Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;

    check-cast p1, Lcom/p1/mobile/putong/data/VisitorCounter;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;->p0(Lcom/p1/mobile/putong/core/ui/visitor/frag/VisitorTabPresenter;Lcom/p1/mobile/putong/data/VisitorCounter;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
