.class public final Lyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lyh0;

.field public static final c:Lyh0;

.field public static final d:Lyh0;

.field public static final e:Lyh0;

.field public static final f:Lyh0;

.field public static final g:Lyh0;

.field public static final h:Lyh0;

.field public static final i:Lyh0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lyh0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->b:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->c:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->d:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->e:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->f:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->g:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->h:Lyh0;

    new-instance v0, Lyh0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lyh0;-><init>(I)V

    sput-object v0, Lyh0;->i:Lyh0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lyh0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lyh0;->a:B

    return p0
.end method
