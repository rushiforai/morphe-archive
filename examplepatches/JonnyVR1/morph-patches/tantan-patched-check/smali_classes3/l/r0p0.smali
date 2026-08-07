.class public final synthetic Ll/r0p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/u0p0;


# direct methods
.method public synthetic constructor <init>(Ll/u0p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r0p0;->a:Ll/u0p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r0p0;->a:Ll/u0p0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    check-cast p2, Ljava/lang/String;

    invoke-static {p0, p1, p2}, Ll/u0p0;->F(Ll/u0p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Ljava/lang/String;)V

    return-void
.end method
