.class public final synthetic Ll/rg10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/ug10;


# direct methods
.method public synthetic constructor <init>(Ll/ug10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rg10;->a:Ll/ug10;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rg10;->a:Ll/ug10;

    check-cast p1, Ll/le10;

    invoke-static {p0, p1}, Ll/ug10;->K3(Ll/ug10;Ll/le10;)Lcom/p1/mobile/putong/live/base/data/BLiveJsAudienceInfoData;

    move-result-object p0

    return-object p0
.end method
