.class public final synthetic Ll/lp10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/op10;


# direct methods
.method public synthetic constructor <init>(Ll/op10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lp10;->a:Ll/op10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lp10;->a:Ll/op10;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;

    invoke-static {p0, p1}, Ll/op10;->O3(Ll/op10;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallSummary;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
