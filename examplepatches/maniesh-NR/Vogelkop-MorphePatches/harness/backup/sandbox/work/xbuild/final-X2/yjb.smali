.class public abstract Lyjb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lf30;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lf30;

    const/16 v1, 0xe

    invoke-direct {v0, v1}, Lf30;-><init>(B)V

    sput-object v0, Lyjb;->a:Lf30;

    const-string v0, "\\.\\d+(Z|[+\\-][0-9]{2}(?::?[0-9]{2})?)$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/util/Date;
    .registers 2

    sget-object v0, Lyjb;->a:Lf30;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method
