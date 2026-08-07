.class public final synthetic Ll/vx70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xx70;


# direct methods
.method public synthetic constructor <init>(Ll/xx70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vx70;->a:Ll/xx70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vx70;->a:Ll/xx70;

    check-cast p1, Ll/pf60;

    invoke-static {p0, p1}, Ll/xx70;->L3(Ll/xx70;Ll/pf60;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    move-result-object p0

    return-object p0
.end method
