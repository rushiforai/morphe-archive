.class public abstract Ls43;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Lesd;


# instance fields
.field public final a:Lii;

.field public final b:Lumi;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "application/json"

    sget-object v1, Lesd;->e:Lkotlin/text/Regex;

    :try_start_4
    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0
    :try_end_8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_8} :catch_9

    goto :goto_a

    :catch_9
    const/4 v0, 0x0

    :goto_a
    sput-object v0, Ls43;->c:Lesd;

    return-void
.end method

.method public constructor <init>(Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lii;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    iput-object v0, p0, Ls43;->a:Lii;

    iput-object p1, p0, Ls43;->b:Lumi;

    return-void
.end method


# virtual methods
.method public final varargs a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Lfvh;
    .registers 6

    invoke-virtual {p0}, Ls43;->b()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const/4 p1, 0x0

    :goto_d
    array-length v0, p3

    if-ge p1, v0, :cond_1c

    aget-object v0, p3, p1

    add-int/lit8 v1, p1, 0x1

    aget-object v1, p3, v1

    invoke-virtual {p0, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    add-int/lit8 p1, p1, 0x2

    goto :goto_d

    :cond_1c
    new-instance p1, Lfvh;

    invoke-direct {p1}, Lfvh;-><init>()V

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lfvh;->h(Ljava/lang/String;)V

    sget-object p0, Ls43;->c:Lesd;

    iget-object p0, p0, Lesd;->a:Ljava/lang/String;

    const-string p3, "Accept"

    invoke-virtual {p1, p3, p0}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_3c

    const-string p0, "Authorization"

    invoke-virtual {p1, p0, p2}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3c
    return-object p1
.end method

.method public abstract b()Landroid/net/Uri;
.end method
