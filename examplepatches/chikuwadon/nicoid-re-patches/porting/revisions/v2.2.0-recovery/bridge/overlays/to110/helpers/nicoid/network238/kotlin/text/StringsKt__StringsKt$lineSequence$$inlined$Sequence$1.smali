.class public final Lnicoid/network238/kotlin/text/StringsKt__StringsKt$lineSequence$$inlined$Sequence$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/sequences/Sequence;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/text/StringsKt__StringsKt;->lineSequence(Ljava/lang/CharSequence;)Lnicoid/network238/kotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $this_lineSequence$inlined:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$lineSequence$$inlined$Sequence$1;->$this_lineSequence$inlined:Ljava/lang/CharSequence;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 3

    .line 23
    new-instance v0, Lnicoid/network238/kotlin/text/LinesIterator;

    iget-object v1, p0, Lnicoid/network238/kotlin/text/StringsKt__StringsKt$lineSequence$$inlined$Sequence$1;->$this_lineSequence$inlined:Ljava/lang/CharSequence;

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/text/LinesIterator;-><init>(Ljava/lang/CharSequence;)V

    return-object v0
.end method
