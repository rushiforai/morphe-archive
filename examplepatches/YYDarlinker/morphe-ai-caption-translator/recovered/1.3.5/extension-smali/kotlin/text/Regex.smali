.class public final Lkotlin/text/Regex;
.super Ljava/lang/Object;
.source "Regex.kt"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkotlin/text/Regex$Companion;,
        Lkotlin/text/Regex$Serialized;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRegex.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Regex.kt\nkotlin/text/Regex\n+ 2 Regex.kt\nkotlin/text/RegexKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,420:1\n24#2,3:421\n1#3:424\n*S KotlinDebug\n*F\n+ 1 Regex.kt\nkotlin/text/Regex\n*L\n105#1:421,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0080\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0008\u0007\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\r\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0008\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u0000 :2\u00060\u0001j\u0002`\u0002:\u00029:B\u0015\u0008A\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u001a\u0002\u0008\u0007\u00a2\u0006\u0004\u0008\u0005\u0010\u0006B\u0011\u0008V\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0005\u0010\nB\u0019\u0008V\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0005\u0010\rB\u001f\u0008V\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000f\u00a2\u0006\u0004\u0008\u0005\u0010\u0010J\u0012\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0086\u0084\u0004J\u0012\u0010\u001a\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019H\u0086\u0080\u0004J\u001e\u0010\u001b\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u001eH\u0086\u0080\u0004J\"\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u001c0 2\u0006\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010\u001d\u001a\u00020\u001eH\u0086\u0080\u0004J\u0014\u0010!\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u0018\u001a\u00020\u0019H\u0086\u0080\u0004J*\u0010\"\u001a\u0004\u0018\u00010\u001c2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010#\u001a\u00020\u001eH\u0087\u0080\u0004b\u000c\u0008$\u0012\u0008\u0008%\u0012\u0004\u0008\u0008(&J(\u0010\'\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010#\u001a\u00020\u001eH\u0087\u0080\u0004b\u000c\u0008$\u0012\u0008\u0008%\u0012\u0004\u0008\u0008(&J\u001a\u0010(\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010)\u001a\u00020\tH\u0086\u0080\u0004J&\u0010(\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\u00192\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u00190+H\u0086\u0080\u0004J\u001a\u0010,\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\u00192\u0006\u0010)\u001a\u00020\tH\u0086\u0080\u0004J\"\u0010-\u001a\u0008\u0012\u0004\u0012\u00020\t0.2\u0006\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010/\u001a\u00020\u001eH\u0086\u0080\u0004J0\u00100\u001a\u0008\u0012\u0004\u0012\u00020\t0 2\u0006\u0010\u0018\u001a\u00020\u00192\u0008\u0008\u0002\u0010/\u001a\u00020\u001eH\u0087\u0080\u0004b\u000c\u0008$\u0012\u0008\u0008%\u0012\u0004\u0008\u0008(1J\n\u00102\u001a\u00020\tH\u0096\u0080\u0004J\n\u00103\u001a\u00020\u0004H\u0086\u0080\u0004J\n\u00104\u001a\u000205H\u0082\u0080\u0004J\u0012\u00106\u001a\u0002072\u0006\u0010\u0018\u001a\u000208H\u0082\u0080\u0004R\u000f\u0010\u0003\u001a\u00020\u0004X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0008\u001a\u00020\t8FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0011\u0010\u0012R\u0017\u0010\u0013\u001a\n\u0012\u0004\u0012\u00020\u000c\u0018\u00010\u000fX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000f8FX\u0086\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0014\u0010\u0015\u00a8\u0006;"
    }
    d2 = {
        "Lkotlin/text/Regex;",
        "Ljava/io/Serializable;",
        "Lkotlin/io/Serializable;",
        "nativePattern",
        "Ljava/util/regex/Pattern;",
        "<init>",
        "(Ljava/util/regex/Pattern;)V",
        "Lkotlin/PublishedApi;",
        "pattern",
        "",
        "(Ljava/lang/String;)V",
        "option",
        "Lkotlin/text/RegexOption;",
        "(Ljava/lang/String;Lkotlin/text/RegexOption;)V",
        "options",
        "",
        "(Ljava/lang/String;Ljava/util/Set;)V",
        "getPattern",
        "()Ljava/lang/String;",
        "_options",
        "getOptions",
        "()Ljava/util/Set;",
        "matches",
        "",
        "input",
        "",
        "containsMatchIn",
        "find",
        "Lkotlin/text/MatchResult;",
        "startIndex",
        "",
        "findAll",
        "Lkotlin/sequences/Sequence;",
        "matchEntire",
        "matchAt",
        "index",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.7",
        "matchesAt",
        "replace",
        "replacement",
        "transform",
        "Lkotlin/Function1;",
        "replaceFirst",
        "split",
        "",
        "limit",
        "splitToSequence",
        "1.6",
        "toString",
        "toPattern",
        "writeReplace",
        "",
        "readObject",
        "",
        "Ljava/io/ObjectInputStream;",
        "Serialized",
        "Companion",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lkotlin/text/Regex$Companion;


# instance fields
.field private _options:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "+",
            "Lkotlin/text/RegexOption;",
            ">;"
        }
    .end annotation
.end field

.field private final nativePattern:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkotlin/text/Regex$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lkotlin/text/Regex$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lkotlin/text/Regex;->Companion:Lkotlin/text/Regex$Companion;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    const-string v0, "pattern"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 90
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    const-string v0, "compile(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lkotlin/text/Regex;-><init>(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Set;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "+",
            "Lkotlin/text/RegexOption;",
            ">;)V"
        }
    .end annotation

    const-string v0, "pattern"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "options"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    sget-object v0, Lkotlin/text/Regex;->Companion:Lkotlin/text/Regex$Companion;

    check-cast p2, Ljava/lang/Iterable;

    # invokes: Lkotlin/text/RegexKt;->toInt(Ljava/lang/Iterable;)I
    invoke-static {p2}, Lkotlin/text/RegexKt;->access$toInt(Ljava/lang/Iterable;)I

    move-result p2

    # invokes: Lkotlin/text/Regex$Companion;->ensureUnicodeCase(I)I
    invoke-static {v0, p2}, Lkotlin/text/Regex$Companion;->access$ensureUnicodeCase(Lkotlin/text/Regex$Companion;I)I

    move-result p2

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    const-string p2, "compile(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lkotlin/text/Regex;-><init>(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lkotlin/text/RegexOption;)V
    .registers 4

    const-string v0, "pattern"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "option"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    sget-object v0, Lkotlin/text/Regex;->Companion:Lkotlin/text/Regex$Companion;

    invoke-virtual {p2}, Lkotlin/text/RegexOption;->getValue()I

    move-result p2

    # invokes: Lkotlin/text/Regex$Companion;->ensureUnicodeCase(I)I
    invoke-static {v0, p2}, Lkotlin/text/Regex$Companion;->access$ensureUnicodeCase(Lkotlin/text/Regex$Companion;I)I

    move-result p2

    invoke-static {p1, p2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object p1

    const-string p2, "compile(...)"

    invoke-static {p1, p2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lkotlin/text/Regex;-><init>(Ljava/util/regex/Pattern;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/regex/Pattern;)V
    .registers 3

    const-string v0, "nativePattern"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public static final synthetic access$getNativePattern$p(Lkotlin/text/Regex;)Ljava/util/regex/Pattern;
    .registers 1

    .line 83
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    return-object p0
.end method

.method public static synthetic find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    .line 122
    :cond_5
    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex;->find(Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic findAll$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    .line 133
    :cond_5
    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex;->findAll(Ljava/lang/CharSequence;I)Lkotlin/sequences/Sequence;

    move-result-object p0

    return-object p0
.end method

.method static final findAll$lambda$0(Lkotlin/text/Regex;Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;
    .registers 3

    .line 137
    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex;->find(Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 2

    .line 329
    new-instance p0, Ljava/io/InvalidObjectException;

    const-string p1, "Deserialization is supported via proxy only"

    invoke-direct {p0, p1}, Ljava/io/InvalidObjectException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic split$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Ljava/util/List;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    .line 252
    :cond_5
    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex;->split(Ljava/lang/CharSequence;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic splitToSequence$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/sequences/Sequence;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_5

    const/4 p2, 0x0

    .line 290
    :cond_5
    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex;->splitToSequence(Ljava/lang/CharSequence;I)Lkotlin/sequences/Sequence;

    move-result-object p0

    return-object p0
.end method

.method private final writeReplace()Ljava/lang/Object;
    .registers 4

    .line 327
    new-instance v0, Lkotlin/text/Regex$Serialized;

    iget-object v1, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {v1}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v1

    const-string v2, "pattern(...)"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/util/regex/Pattern;->flags()I

    move-result p0

    invoke-direct {v0, v1, p0}, Lkotlin/text/Regex$Serialized;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public final containsMatchIn(Ljava/lang/CharSequence;)Z
    .registers 3

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result p0

    return p0
.end method

.method public final find(Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "matcher(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    # invokes: Lkotlin/text/RegexKt;->findNext(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lkotlin/text/MatchResult;
    invoke-static {p0, p2, p1}, Lkotlin/text/RegexKt;->access$findNext(Ljava/util/regex/Matcher;ILjava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method public final findAll(Ljava/lang/CharSequence;I)Lkotlin/sequences/Sequence;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I)",
            "Lkotlin/sequences/Sequence<",
            "Lkotlin/text/MatchResult;",
            ">;"
        }
    .end annotation

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-ltz p2, :cond_1b

    .line 134
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-gt p2, v0, :cond_1b

    .line 137
    new-instance v0, Lkotlin/text/Regex$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1, p2}, Lkotlin/text/Regex$$ExternalSyntheticLambda0;-><init>(Lkotlin/text/Regex;Ljava/lang/CharSequence;I)V

    sget-object p0, Lkotlin/text/Regex$findAll$2;->INSTANCE:Lkotlin/text/Regex$findAll$2;

    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-static {v0, p0}, Lkotlin/sequences/SequencesKt;->generateSequence(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)Lkotlin/sequences/Sequence;

    move-result-object p0

    return-object p0

    .line 135
    :cond_1b
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Start index out of bounds: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", input length: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final getOptions()Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lkotlin/text/RegexOption;",
            ">;"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lkotlin/text/Regex;->_options:Ljava/util/Set;

    if-nez v0, :cond_2d

    iget-object v0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {v0}, Ljava/util/regex/Pattern;->flags()I

    move-result v0

    .line 421
    const-class v1, Lkotlin/text/RegexOption;

    invoke-static {v1}, Ljava/util/EnumSet;->allOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    .line 422
    invoke-static {v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object v2, v1

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Lkotlin/text/Regex$special$$inlined$fromInt$1;

    invoke-direct {v3, v0}, Lkotlin/text/Regex$special$$inlined$fromInt$1;-><init>(I)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    invoke-static {v2, v3}, Lkotlin/collections/CollectionsKt;->retainAll(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;)Z

    .line 421
    check-cast v1, Ljava/util/Set;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    const-string v1, "unmodifiableSet(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 105
    iput-object v0, p0, Lkotlin/text/Regex;->_options:Ljava/util/Set;

    :cond_2d
    return-object v0
.end method

.method public final getPattern()Ljava/lang/String;
    .registers 2

    .line 101
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object p0

    const-string v0, "pattern(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final matchAt(Ljava/lang/CharSequence;I)Lkotlin/text/MatchResult;
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 149
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->useAnchoringBounds(Z)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->useTransparentBounds(Z)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-virtual {p0, p2, v0}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 150
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p2

    if-eqz p2, :cond_2c

    new-instance p2, Lkotlin/text/MatcherMatchResult;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {p2, p0, p1}, Lkotlin/text/MatcherMatchResult;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V

    goto :goto_2d

    :cond_2c
    const/4 p2, 0x0

    .line 149
    :goto_2d
    check-cast p2, Lkotlin/text/MatchResult;

    return-object p2
.end method

.method public final matchEntire(Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;
    .registers 3

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const-string v0, "matcher(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    # invokes: Lkotlin/text/RegexKt;->matchEntire(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;
    invoke-static {p0, p1}, Lkotlin/text/RegexKt;->access$matchEntire(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)Lkotlin/text/MatchResult;

    move-result-object p0

    return-object p0
.end method

.method public final matches(Ljava/lang/CharSequence;)Z
    .registers 3

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 108
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public final matchesAt(Ljava/lang/CharSequence;I)Z
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 155
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->useAnchoringBounds(Z)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->useTransparentBounds(Z)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0, p2, p1}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p0

    return p0
.end method

.method public final replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "replacement"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 180
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "replaceAll(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final replace(Ljava/lang/CharSequence;Lkotlin/jvm/functions/Function1;)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/text/MatchResult;",
            "+",
            "Ljava/lang/CharSequence;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "transform"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 188
    invoke-static {p0, p1, v2, v0, v1}, Lkotlin/text/Regex;->find$default(Lkotlin/text/Regex;Ljava/lang/CharSequence;IILjava/lang/Object;)Lkotlin/text/MatchResult;

    move-result-object p0

    if-nez p0, :cond_18

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 191
    :cond_18
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 192
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 195
    :cond_21
    invoke-interface {p0}, Lkotlin/text/MatchResult;->getRange()Lkotlin/ranges/IntRange;

    move-result-object v3

    invoke-virtual {v3}, Lkotlin/ranges/IntRange;->getStart()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, p1, v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 196
    invoke-interface {p2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 197
    invoke-interface {p0}, Lkotlin/text/MatchResult;->getRange()Lkotlin/ranges/IntRange;

    move-result-object v2

    invoke-virtual {v2}, Lkotlin/ranges/IntRange;->getEndInclusive()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    .line 198
    invoke-interface {p0}, Lkotlin/text/MatchResult;->next()Lkotlin/text/MatchResult;

    move-result-object p0

    if-ge v2, v0, :cond_4f

    if-nez p0, :cond_21

    :cond_4f
    if-ge v2, v0, :cond_54

    .line 202
    invoke-virtual {v1, p1, v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 205
    :cond_54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "toString(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final replaceFirst(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "replacement"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 232
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "replaceFirst(...)"

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public final split(Ljava/lang/CharSequence;I)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 253
    invoke-static {p2}, Lkotlin/text/StringsKt;->requireNonNegativeLimit(I)V

    .line 255
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    const/4 v0, 0x1

    if-eq p2, v0, :cond_5a

    .line 256
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_18

    goto :goto_5a

    .line 258
    :cond_18
    new-instance v1, Ljava/util/ArrayList;

    const/16 v2, 0xa

    if-lez p2, :cond_22

    invoke-static {p2, v2}, Lkotlin/ranges/RangesKt;->coerceAtMost(II)I

    move-result v2

    :cond_22
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    sub-int/2addr p2, v0

    const/4 v0, 0x0

    .line 263
    :cond_27
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-interface {p1, v0, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->end()I

    move-result v0

    if-ltz p2, :cond_42

    .line 265
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-eq v2, p2, :cond_48

    .line 266
    :cond_42
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_27

    .line 268
    :cond_48
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p0

    invoke-interface {p1, v0, p0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    check-cast v1, Ljava/util/List;

    return-object v1

    .line 256
    :cond_5a
    :goto_5a
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final splitToSequence(Ljava/lang/CharSequence;I)Lkotlin/sequences/Sequence;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "I)",
            "Lkotlin/sequences/Sequence<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 291
    invoke-static {p2}, Lkotlin/text/StringsKt;->requireNonNegativeLimit(I)V

    .line 293
    new-instance v0, Lkotlin/text/Regex$splitToSequence$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lkotlin/text/Regex$splitToSequence$1;-><init>(Lkotlin/text/Regex;Ljava/lang/CharSequence;ILkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function2;

    invoke-static {v0}, Lkotlin/sequences/SequencesKt;->sequence(Lkotlin/jvm/functions/Function2;)Lkotlin/sequences/Sequence;

    move-result-object p0

    return-object p0
.end method

.method public final toPattern()Ljava/util/regex/Pattern;
    .registers 1

    .line 325
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 318
    iget-object p0, p0, Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p0}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "toString(...)"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method
