.class public final synthetic Lnicoid/network238/kotlin/jvm/internal/TypeReference$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/kotlin/jvm/internal/TypeReference;"
    method = "asString$lambda$0"
    proto = "(Lnicoid/network238/kotlin/jvm/internal/TypeReference;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Ljava/lang/CharSequence;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/kotlin/jvm/internal/TypeReference;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/TypeReference;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference$0;->f$0:Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/kotlin/jvm/internal/TypeReference$0;->f$0:Lnicoid/network238/kotlin/jvm/internal/TypeReference;

    check-cast p1, Lnicoid/network238/kotlin/reflect/KTypeProjection;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/jvm/internal/TypeReference;->asString$lambda$0(Lnicoid/network238/kotlin/jvm/internal/TypeReference;Lnicoid/network238/kotlin/reflect/KTypeProjection;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
