.class public final synthetic Ll/l680;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/s680;


# direct methods
.method public synthetic constructor <init>(Ll/s680;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l680;->a:Ll/s680;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l680;->a:Ll/s680;

    check-cast p1, Ll/ru70;

    invoke-static {p0, p1}, Ll/s680;->O3(Ll/s680;Ll/ru70;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method
