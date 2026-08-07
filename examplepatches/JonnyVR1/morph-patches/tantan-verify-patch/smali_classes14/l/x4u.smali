.class public final synthetic Ll/x4u;
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
    check-cast p1, Ll/p5u;

    check-cast p2, Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareSuggestApiPlug;->s(Ll/p5u;Lcom/p1/mobile/putong/live/external/square/api/LiveSquareBannersBean;)Ll/p5u;

    move-result-object p0

    return-object p0
.end method
