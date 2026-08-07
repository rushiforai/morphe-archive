.class public final synthetic Ll/e8o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/z8o;

    check-cast p2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->u(Ll/z8o;Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;)Ll/z8o;

    move-result-object p0

    return-object p0
.end method
