.class public final Lw4g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvnj;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget v0, Lvnj;->j:I

    return-void
.end method

.method public constructor <init>(Lvnj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw4g;->a:Lvnj;

    return-void
.end method

.method public static a(Lw3g;)Lknj;
    .registers 7

    new-instance v0, Lknj;

    iget-object v1, p0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v1, v1, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    new-instance v2, Llnj;

    sget-object v3, Lmnj;->b:Lmnj;

    iget p0, p0, Lw3g;->a:I

    int-to-long v4, p0

    invoke-direct {v2, v3, v4, v5}, Llnj;-><init>(Lmnj;J)V

    invoke-direct {v0, v1, v2}, Lknj;-><init>(Ljava/lang/String;Llnj;)V

    return-object v0
.end method
