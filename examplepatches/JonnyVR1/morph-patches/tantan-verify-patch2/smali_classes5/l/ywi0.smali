.class public final synthetic Ll/ywi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/bxi0;


# direct methods
.method public synthetic constructor <init>(Ll/bxi0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ywi0;->a:Ll/bxi0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ywi0;->a:Ll/bxi0;

    check-cast p1, Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;

    invoke-static {p0, p1}, Ll/bxi0;->d(Ll/bxi0;Lcom/p1/mobile/putong/core/data/IntlThirdQuickLoginEnvelope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
