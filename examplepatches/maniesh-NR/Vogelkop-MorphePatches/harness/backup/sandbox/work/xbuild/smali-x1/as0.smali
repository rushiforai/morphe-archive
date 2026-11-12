.class public final Las0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Las0;

.field public static final c:Las0;

.field public static final d:Las0;

.field public static final e:Las0;

.field public static final f:Las0;

.field public static final g:Las0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Las0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->b:Las0;

    new-instance v0, Las0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->c:Las0;

    new-instance v0, Las0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->d:Las0;

    new-instance v0, Las0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->e:Las0;

    new-instance v0, Las0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->f:Las0;

    new-instance v0, Las0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Las0;-><init>(I)V

    sput-object v0, Las0;->g:Las0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Las0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Las0;->a:B

    return p0
.end method
