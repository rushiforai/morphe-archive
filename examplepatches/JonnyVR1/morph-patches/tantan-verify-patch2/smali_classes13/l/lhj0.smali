.class public final synthetic Ll/lhj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

.field public final synthetic b:Landroid/view/Surface;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/view/Surface;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lhj0;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iput-object p2, p0, Ll/lhj0;->b:Landroid/view/Surface;

    iput-boolean p3, p0, Ll/lhj0;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lhj0;->a:Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;

    iget-object v1, p0, Ll/lhj0;->b:Landroid/view/Surface;

    iget-boolean p0, p0, Ll/lhj0;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->p(Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;Landroid/view/Surface;Z)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
