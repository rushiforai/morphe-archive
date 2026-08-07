.class public final synthetic Ll/g4o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/k4o;


# direct methods
.method public synthetic constructor <init>(Ll/k4o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g4o;->a:Ll/k4o;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g4o;->a:Ll/k4o;

    check-cast p1, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    invoke-static {p0, p1}, Ll/k4o;->W2(Ll/k4o;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
