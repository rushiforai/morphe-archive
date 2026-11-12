.class public final Ls50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ls50;

.field public static final c:Ls50;

.field public static final d:Ls50;

.field public static final e:Ls50;

.field public static final f:Ls50;

.field public static final g:Ls50;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ls50;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->b:Ls50;

    new-instance v0, Ls50;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->c:Ls50;

    new-instance v0, Ls50;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->d:Ls50;

    new-instance v0, Ls50;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->e:Ls50;

    new-instance v0, Ls50;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->f:Ls50;

    new-instance v0, Ls50;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Ls50;-><init>(I)V

    sput-object v0, Ls50;->g:Ls50;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ls50;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ls50;->a:B

    return p0
.end method
