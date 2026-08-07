.class public Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;->g2(Ll/w6k;Lcom/p1/mobile/putong/data/MessageLocation;Lcom/google/android/gms/maps/model/LatLng;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/w6k;

.field public final synthetic c:Lcom/google/android/gms/maps/model/LatLng;

.field public final synthetic d:Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;Landroid/view/View;Ll/w6k;Lcom/google/android/gms/maps/model/LatLng;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->d:Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->b:Ll/w6k;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->a:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->b:Ll/w6k;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/map/IntlMapPreviewAct$a;->c:Lcom/google/android/gms/maps/model/LatLng;

    .line 13
    .line 14
    const/high16 v1, 0x41880000    # 17.0f

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/zc4;->a(Lcom/google/android/gms/maps/model/LatLng;F)Ll/yc4;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Ll/w6k;->f(Ll/yc4;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
