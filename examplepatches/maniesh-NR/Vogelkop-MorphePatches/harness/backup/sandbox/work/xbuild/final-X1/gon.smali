.class public final Lgon;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu2j;


# static fields
.field public static final a:Lgon;

.field public static final b:Lfon;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lgon;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lgon;->a:Lgon;

    invoke-static {}, Lfon;->g()Lfon;

    move-result-object v0

    sput-object v0, Lgon;->b:Lfon;

    return-void
.end method


# virtual methods
.method public final getDefaultValue()Ljava/lang/Object;
    .registers 1

    sget-object p0, Lgon;->b:Lfon;

    return-object p0
.end method

.method public final readFrom(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 3

    :try_start_0
    invoke-static {p1}, Lfon;->s(Ljava/io/InputStream;)Lfon;

    move-result-object p0
    :try_end_4
    .catch Lbjb; {:try_start_0 .. :try_end_4} :catch_5

    return-object p0

    :catch_5
    move-exception p0

    new-instance p1, Lwx5;

    const-string v0, "Cannot read proto."

    invoke-direct {p1, v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public final writeTo(Ljava/lang/Object;Ljava/io/OutputStream;)Lkotlin/Unit;
    .registers 3

    check-cast p1, Lfon;

    invoke-virtual {p1, p2}, Lw5;->writeTo(Ljava/io/OutputStream;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
