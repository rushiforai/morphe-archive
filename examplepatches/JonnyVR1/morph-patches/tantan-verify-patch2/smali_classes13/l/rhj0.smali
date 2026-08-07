.class public final synthetic Ll/rhj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

.field public final synthetic b:Landroid/graphics/SurfaceTexture;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rhj0;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iput-object p2, p0, Ll/rhj0;->b:Landroid/graphics/SurfaceTexture;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rhj0;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iget-object p0, p0, Ll/rhj0;->b:Landroid/graphics/SurfaceTexture;

    invoke-static {v0, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->u(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/graphics/SurfaceTexture;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
