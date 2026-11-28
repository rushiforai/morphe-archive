.class public final synthetic Le/e/a/vendor/lang3/ClassUtils$0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/BiConsumer;


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ljava/lang/Class;

    check-cast p2, Ljava/lang/Class;

    sget-object p0, Le/e/a/vendor/lang3/ClassUtils;->ARRAY_TAIL_PATTERN:Ljava/util/regex/Pattern;

    .line 158
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    .line 159
    sget-object p0, Le/e/a/vendor/lang3/ClassUtils;->WRAPPER_PRIMITIVE_MAP:Ljava/util/HashMap;

    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method
