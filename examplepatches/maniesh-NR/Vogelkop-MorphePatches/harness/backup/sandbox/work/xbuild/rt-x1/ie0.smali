.class public final Lie0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lie0;

.field public static final c:Lie0;

.field public static final d:Lie0;

.field public static final e:Lie0;

.field public static final f:Lie0;

.field public static final g:Lie0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lie0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->b:Lie0;

    new-instance v0, Lie0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->c:Lie0;

    new-instance v0, Lie0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->d:Lie0;

    new-instance v0, Lie0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->e:Lie0;

    new-instance v0, Lie0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->f:Lie0;

    new-instance v0, Lie0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lie0;-><init>(I)V

    sput-object v0, Lie0;->g:Lie0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lie0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lie0;->a:B

    return p0
.end method
