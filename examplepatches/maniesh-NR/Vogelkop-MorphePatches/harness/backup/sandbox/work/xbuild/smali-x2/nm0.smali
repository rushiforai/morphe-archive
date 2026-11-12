.class public final Lnm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lnm0;

.field public static final c:Lnm0;

.field public static final d:Lnm0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnm0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnm0;-><init>(I)V

    sput-object v0, Lnm0;->b:Lnm0;

    new-instance v0, Lnm0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lnm0;-><init>(I)V

    sput-object v0, Lnm0;->c:Lnm0;

    new-instance v0, Lnm0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lnm0;-><init>(I)V

    sput-object v0, Lnm0;->d:Lnm0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lnm0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lnm0;->a:B

    return p0
.end method
