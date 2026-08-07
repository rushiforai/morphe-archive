.class public final synthetic Ll/zwn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/bxn;


# direct methods
.method public synthetic constructor <init>(Ll/bxn;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zwn;->a:Ll/bxn;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zwn;->a:Ll/bxn;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePopUp;

    invoke-static {p0, p1}, Ll/bxn;->e3(Ll/bxn;Lcom/p1/mobile/putong/live/base/data/BLivePopUp;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
