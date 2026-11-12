.class public abstract Loy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lkotlin/text/Regex;


# direct methods
.method static constructor <clinit>()V
    .registers 23

    const-string v21, "will"

    const-string v22, "would"

    const-string v1, "are"

    const-string v2, "can"

    const-string v3, "compare"

    const-string v4, "define"

    const-string v5, "did"

    const-string v6, "do"

    const-string v7, "does"

    const-string v8, "explain"

    const-string v9, "has"

    const-string v10, "have"

    const-string v11, "how"

    const-string v12, "if"

    const-string v13, "is"

    const-string v14, "should"

    const-string v15, "what"

    const-string v16, "when"

    const-string v17, "where"

    const-string v18, "which"

    const-string v19, "who"

    const-string v20, "why"

    filled-new-array/range {v1 .. v22}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le82;->E([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lkotlin/text/Regex;

    move-object v2, v0

    check-cast v2, Ljava/lang/Iterable;

    const/4 v7, 0x0

    const/16 v8, 0x3e

    const-string v3, "|"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Lkotlin/collections/CollectionsKt;->P(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/String;ILkotlin/jvm/functions/Function1;I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "^("

    const-string v3, ")\\b|.+\\?$"

    invoke-static {v2, v0, v3}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lirh;->b:Lirh;

    invoke-direct {v1, v0, v2}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;Lirh;)V

    sput-object v1, Loy0;->a:Lkotlin/text/Regex;

    return-void
.end method
