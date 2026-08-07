.class public final synthetic Ll/shj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/shj0;->a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/shj0;->a:Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p0, p1}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->t(Lcom/p1/mobile/android/media/gltransition/TransitionEngine$c;F)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
