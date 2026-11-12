.class public final Lai0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lai0;

.field public static final c:Lai0;

.field public static final d:Lai0;

.field public static final e:Lai0;

.field public static final f:Lai0;

.field public static final g:Lai0;

.field public static final h:Lai0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lai0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->b:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->c:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->d:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->e:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->f:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->g:Lai0;

    new-instance v0, Lai0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lai0;-><init>(I)V

    sput-object v0, Lai0;->h:Lai0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lai0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lai0;->a:B

    return p0
.end method
