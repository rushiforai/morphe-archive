.class public final synthetic Ll/w40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j3f0$a;


# instance fields
.field public final synthetic a:Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;


# direct methods
.method public synthetic constructor <init>(Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w40;->a:Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;

    return-void
.end method


# virtual methods
.method public final onSharedElementsReady()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w40;->a:Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;

    invoke-static {p0}, Ll/v40$f;->a(Landroid/app/SharedElementCallback$OnSharedElementsReadyListener;)V

    return-void
.end method
