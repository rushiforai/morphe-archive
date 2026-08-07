.class public final synthetic Ll/vhj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vhj0;->a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vhj0;->a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    invoke-static {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->h(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
