.class public final Lmu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lmu0;

.field public static final c:Lmu0;

.field public static final d:Lmu0;

.field public static final e:Lmu0;

.field public static final f:Lmu0;

.field public static final g:Lmu0;

.field public static final h:Lmu0;

.field public static final i:Lmu0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lmu0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->b:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->c:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->d:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->e:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->f:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->g:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->h:Lmu0;

    new-instance v0, Lmu0;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lmu0;-><init>(I)V

    sput-object v0, Lmu0;->i:Lmu0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lmu0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lmu0;->a:B

    return p0
.end method
