.class public final Laqc;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Ljava/util/Map;

.field public static final h:Ljava/util/Comparator;

.field public static final i:Ljava/util/Comparator;


# instance fields
.field public final a:Lcq6;

.field public b:Ljava/util/List;

.field public final c:Ljava/util/LinkedHashMap;

.field public final d:Lzc5;

.field public final e:Lzc5;

.field public final f:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    sget-object v0, Loi9;->d:Loi9;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lkotlin/Pair;

    invoke-direct {v3, v0, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Loi9;->e:Loi9;

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v0, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v0, Loi9;->c:Loi9;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    new-instance v6, Lkotlin/Pair;

    invoke-direct {v6, v0, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v3, v4, v6}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lrbd;->c([Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Laqc;->g:Ljava/util/Map;

    new-instance v0, Lg8c;

    const/16 v3, 0x15

    invoke-direct {v0, v3}, Lg8c;-><init>(B)V

    new-instance v3, Lwpc;

    invoke-direct {v3, v0, v1}, Lwpc;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-static {v3}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Laqc;->h:Ljava/util/Comparator;

    new-instance v0, Lg8c;

    const/16 v1, 0x16

    invoke-direct {v0, v1}, Lg8c;-><init>(B)V

    new-instance v1, Lwpc;

    invoke-direct {v1, v0, v2}, Lwpc;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-static {v1}, Ljava/util/Comparator;->comparingLong(Ljava/util/function/ToLongFunction;)Ljava/util/Comparator;

    move-result-object v0

    sput-object v0, Laqc;->i:Ljava/util/Comparator;

    return-void
.end method

.method public constructor <init>(Lcq6;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laqc;->a:Lcq6;

    sget-object p1, Ll08;->a:Ll08;

    iput-object p1, p0, Laqc;->b:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Laqc;->c:Ljava/util/LinkedHashMap;

    new-instance p1, Lzpc;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lzpc;-><init>(Laqc;B)V

    new-instance v0, Lzc5;

    sget-object v1, Laqc;->h:Ljava/util/Comparator;

    invoke-direct {v0, p1, v1}, Lzc5;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    new-instance p1, Lzc5;

    sget-object v2, Laqc;->i:Ljava/util/Comparator;

    invoke-direct {p1, v0, v2}, Lzc5;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    iput-object p1, p0, Laqc;->d:Lzc5;

    new-instance p1, Lzpc;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lzpc;-><init>(Laqc;B)V

    new-instance v0, Lzc5;

    invoke-direct {v0, p1, v1}, Lzc5;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    new-instance p1, Lzc5;

    invoke-direct {p1, v0, v2}, Lzc5;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    iput-object p1, p0, Laqc;->e:Lzc5;

    new-instance p1, Lq4b;

    const/16 v0, 0x12

    invoke-direct {p1, p0, v0}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Laqc;->f:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lzmc;)Ljava/lang/Integer;
    .registers 5

    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object v0

    iget-wide v0, v0, Llmc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iget-object p0, p0, Laqc;->c:Ljava/util/LinkedHashMap;

    invoke-interface {p0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1d

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :cond_1d
    invoke-interface {p1}, Lzmc;->a()Llmc;

    move-result-object p1

    iget-object p1, p1, Llmc;->b:Loi9;

    sget-object v2, Laqc;->g:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method
