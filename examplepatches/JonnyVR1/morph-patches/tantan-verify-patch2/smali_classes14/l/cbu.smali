.class public final synthetic Ll/cbu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/gbu;


# direct methods
.method public synthetic constructor <init>(Ll/gbu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cbu;->a:Ll/gbu;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cbu;->a:Ll/gbu;

    check-cast p1, Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;

    invoke-static {p0, p1}, Ll/gbu;->Q2(Ll/gbu;Lcom/p1/mobile/putong/live/external/square/LiveSquareSummaryInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
