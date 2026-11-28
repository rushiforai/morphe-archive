.class public final synthetic Lnicoid/network238/kotlin/text/StringsKt__StringsKt$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function2;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/kotlin/text/StringsKt__StringsKt;"
    method = "rangesDelimitedBy$lambda$14$StringsKt__StringsKt"
    proto = "([CZLjava/lang/CharSequence;I)Lnicoid/network238/kotlin/Pair;"
.end annotation


# instance fields
.field public final synthetic f$0:[C

.field public final synthetic f$1:Z


# direct methods
.method public synthetic constructor <init>([CZ)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$0;->f$0:[C

    iput-boolean p2, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$0;->f$1:Z

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 0
    iget-object v0, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$0;->f$0:[C

    iget-boolean v1, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$0;->f$1:Z

    check-cast p1, Ljava/lang/CharSequence;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v0, v1, p1, p2}, Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->$r8$lambda$khMEFDjIj766SCh5THQNoen7fI8([CZLjava/lang/CharSequence;I)Lnicoid/network238/kotlin/Pair;

    move-result-object p1

    return-object p1
.end method
