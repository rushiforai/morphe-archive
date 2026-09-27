.class public final synthetic Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic f$0:Lkotlin/jvm/functions/Function1;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda5;->f$0:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$$ExternalSyntheticLambda5;->f$0:Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1}, Lkotlin/internal/jdk8/JDK8PlatformImplementations;->computeIfAbsent$lambda$1(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
