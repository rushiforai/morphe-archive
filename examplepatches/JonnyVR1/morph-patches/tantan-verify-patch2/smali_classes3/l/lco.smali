.class public final synthetic Ll/lco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/xco;


# direct methods
.method public synthetic constructor <init>(Ll/xco;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lco;->a:Ll/xco;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lco;->a:Ll/xco;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-static {p0, p1}, Ll/xco;->k0(Ll/xco;Lcom/p1/mobile/putong/location/Location;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
