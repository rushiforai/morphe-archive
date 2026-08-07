.class public final synthetic Ll/qve0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qrm0;


# direct methods
.method public synthetic constructor <init>(Ll/qrm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qve0;->a:Ll/qrm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qve0;->a:Ll/qrm0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    invoke-static {p0, p1}, Ll/sve0;->L3(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
