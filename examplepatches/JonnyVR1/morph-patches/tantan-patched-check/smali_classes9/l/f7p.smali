.class public final synthetic Ll/f7p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lrx/c;


# direct methods
.method public synthetic constructor <init>(Lrx/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f7p;->a:Lrx/c;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f7p;->a:Lrx/c;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPurchasePageContentNewView;->h(Lrx/c;Ll/pf60;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
