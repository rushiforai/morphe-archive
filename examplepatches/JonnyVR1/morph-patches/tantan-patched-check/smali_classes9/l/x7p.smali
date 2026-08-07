.class public final synthetic Ll/x7p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/pf60;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7p;->a:Ll/pf60;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7p;->a:Ll/pf60;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/intlpage/IntlPurchasePageContentNewView;->E(Ll/pf60;Ljava/util/List;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
