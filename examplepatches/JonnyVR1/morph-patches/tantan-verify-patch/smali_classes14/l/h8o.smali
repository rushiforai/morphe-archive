.class public final synthetic Ll/h8o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h8o;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h8o;->a:Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;->l(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlLiveSquareSuggestApiPlug;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
