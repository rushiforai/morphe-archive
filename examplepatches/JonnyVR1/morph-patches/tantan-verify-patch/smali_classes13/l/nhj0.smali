.class public final synthetic Ll/nhj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nhj0;->a:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nhj0;->a:Lkotlin/jvm/functions/Function0;

    invoke-static {p0}, Lcom/p1/mobile/android/media/gltransition/impl/TransitionEngineImpl;->s(Lkotlin/jvm/functions/Function0;)V

    return-void
.end method
