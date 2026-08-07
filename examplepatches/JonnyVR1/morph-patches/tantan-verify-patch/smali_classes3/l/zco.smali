.class public final synthetic Ll/zco;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w6k;

.field public final synthetic b:Lcom/google/android/gms/maps/model/LatLng;


# direct methods
.method public synthetic constructor <init>(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zco;->a:Ll/w6k;

    iput-object p2, p0, Ll/zco;->b:Lcom/google/android/gms/maps/model/LatLng;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zco;->a:Ll/w6k;

    iget-object p0, p0, Ll/zco;->b:Lcom/google/android/gms/maps/model/LatLng;

    check-cast p1, Landroid/view/View;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->d2(Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;Landroid/view/View;)V

    return-void
.end method
