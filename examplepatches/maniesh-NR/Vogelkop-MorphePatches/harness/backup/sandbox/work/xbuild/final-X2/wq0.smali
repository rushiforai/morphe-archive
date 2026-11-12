.class public final Lwq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lwq0;

.field public static final c:Lwq0;

.field public static final d:Lwq0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lwq0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lwq0;-><init>(I)V

    sput-object v0, Lwq0;->b:Lwq0;

    new-instance v0, Lwq0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lwq0;-><init>(I)V

    sput-object v0, Lwq0;->c:Lwq0;

    new-instance v0, Lwq0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lwq0;-><init>(I)V

    sput-object v0, Lwq0;->d:Lwq0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lwq0;->a:B

    return-void
.end method

.method public static final a(I)Lwq0;
    .registers 2

    if-eqz p0, :cond_13

    const/4 v0, 0x1

    if-eq p0, v0, :cond_10

    const/4 v0, 0x2

    if-ne p0, v0, :cond_b

    sget-object p0, Lwq0;->d:Lwq0;

    return-object p0

    :cond_b
    invoke-static {}, Lhai;->d()V

    const/4 p0, 0x0

    return-object p0

    :cond_10
    sget-object p0, Lwq0;->c:Lwq0;

    return-object p0

    :cond_13
    sget-object p0, Lwq0;->b:Lwq0;

    return-object p0
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lwq0;->a:B

    return p0
.end method
