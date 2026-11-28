.class public final synthetic Lnicoid/network238/kotlin/text/StringsKt__IndentKt$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lnicoid/network238/kotlin/jvm/functions/Function1;


# annotations
.annotation runtime Lnicoid/network238/com/android/tools/r8/annotations/LambdaMethod;
    holder = "Lnicoid/network238/kotlin/text/StringsKt__IndentKt;"
    method = "getIndentFunction$lambda$9$StringsKt__IndentKt"
    proto = "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"
.end annotation


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$1;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    iget-object v0, p0, Lnicoid/network238/kotlin/text/StringsKt__IndentKt$1;->f$0:Ljava/lang/String;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/text/StringsKt__IndentKt;->$r8$lambda$nNic-LEWSJV9XuSiP33DOd1sLF4(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
