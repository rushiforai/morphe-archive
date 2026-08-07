.class public final synthetic Ll/iz70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rz70;


# direct methods
.method public synthetic constructor <init>(Ll/rz70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iz70;->a:Ll/rz70;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iz70;->a:Ll/rz70;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    invoke-static {p0, p1}, Ll/rz70;->y4(Ll/rz70;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method
