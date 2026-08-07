.class public final synthetic Ll/un90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xn90;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Ll/xn90;Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/un90;->a:Ll/xn90;

    iput-object p2, p0, Ll/un90;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/un90;->c:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/un90;->a:Ll/xn90;

    iget-object v1, p0, Ll/un90;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/un90;->c:Landroid/view/ViewGroup;

    check-cast p1, Lcom/google/android/gms/ads/AdView;

    invoke-static {v0, v1, p0, p1}, Ll/xn90;->k(Ll/xn90;Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;Lcom/google/android/gms/ads/AdView;)V

    return-void
.end method
