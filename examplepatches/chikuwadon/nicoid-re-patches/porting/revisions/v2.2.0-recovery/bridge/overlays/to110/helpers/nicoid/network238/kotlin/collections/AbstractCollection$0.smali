.class public final synthetic Lnicoid/network238/kotlin/collections/AbstractCollection$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/kotlin/collections/AbstractCollection;"
    method = "toString$lambda$2"
    proto = "(Lnicoid/network238/kotlin/collections/AbstractCollection;Ljava/lang/Object;)Ljava/lang/CharSequence;"
.end annotation


# instance fields
.field public final synthetic f$0:Lnicoid/network238/kotlin/collections/AbstractCollection;


# direct methods
.method public synthetic constructor <init>(Lnicoid/network238/kotlin/collections/AbstractCollection;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/AbstractCollection$0;->f$0:Lnicoid/network238/kotlin/collections/AbstractCollection;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/AbstractCollection$0;->f$0:Lnicoid/network238/kotlin/collections/AbstractCollection;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->toString$lambda$2(Lnicoid/network238/kotlin/collections/AbstractCollection;Ljava/lang/Object;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
