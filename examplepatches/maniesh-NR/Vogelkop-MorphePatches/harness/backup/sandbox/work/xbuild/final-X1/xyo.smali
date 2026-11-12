.class public final Lxyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkro;


# instance fields
.field public b:J


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lxyo;->b:J

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    .line 13
    const-string p0, "last-modified"

    return-object p0
.end method

.method public final a(Ljava/lang/String;)V
    .registers 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p1}, Ljava/util/Date;->parse(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lxyo;->b:J

    :cond_c
    return-void
.end method

.method public final b(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 5

    invoke-static {p1}, Ldyg;->c(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lmxo;

    iget-wide v1, p0, Lxyo;->b:J

    invoke-direct {v0, p1, v1, v2}, Lmxo;-><init>(Ljava/lang/String;J)V

    return-object v0
.end method
