.class public abstract Lvsh;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lua1;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lua1;

    const/16 v1, 0x8

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lua1;-><init>(BI)V

    sput-object v0, Lvsh;->a:Lua1;

    return-void
.end method

.method public static a(Landroid/icu/util/ULocale;Landroid/icu/text/RelativeDateTimeFormatter$Style;)Landroid/icu/text/RelativeDateTimeFormatter;
    .registers 6

    sget-object v0, Landroid/icu/text/DisplayContext;->CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE:Landroid/icu/text/DisplayContext;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "\t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lvsh;->a:Lua1;

    invoke-virtual {v2, v1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/icu/text/RelativeDateTimeFormatter;

    if-nez v3, :cond_2f

    const/4 v3, 0x0

    invoke-static {p0, v3, p1, v0}, Landroid/icu/text/RelativeDateTimeFormatter;->getInstance(Landroid/icu/util/ULocale;Landroid/icu/text/NumberFormat;Landroid/icu/text/RelativeDateTimeFormatter$Style;Landroid/icu/text/DisplayContext;)Landroid/icu/text/RelativeDateTimeFormatter;

    move-result-object p0

    invoke-virtual {v2, v1, p0}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    :cond_2f
    return-object v3
.end method
