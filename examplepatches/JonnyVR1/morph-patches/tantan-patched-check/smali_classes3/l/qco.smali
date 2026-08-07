.class public final synthetic Ll/qco;
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

    iput-object p1, p0, Ll/qco;->a:Ll/xco;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qco;->a:Ll/xco;

    check-cast p1, Lcom/google/android/gms/maps/model/LatLng;

    invoke-static {p0, p1}, Ll/xco;->y0(Ll/xco;Lcom/google/android/gms/maps/model/LatLng;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
