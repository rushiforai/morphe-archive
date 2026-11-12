.class public final Lwb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lwb0;

.field public static final c:Lwb0;

.field public static final d:Lwb0;

.field public static final e:Lwb0;

.field public static final f:Lwb0;

.field public static final g:Lwb0;

.field public static final h:Lwb0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lwb0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->b:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->c:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->d:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->e:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->f:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->g:Lwb0;

    new-instance v0, Lwb0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lwb0;-><init>(I)V

    sput-object v0, Lwb0;->h:Lwb0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lwb0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lwb0;->a:B

    return p0
.end method
