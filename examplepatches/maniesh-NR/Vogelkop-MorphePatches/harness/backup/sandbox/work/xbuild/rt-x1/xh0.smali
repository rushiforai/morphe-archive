.class public final Lxh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lxh0;

.field public static final c:Lxh0;

.field public static final d:Lxh0;

.field public static final e:Lxh0;

.field public static final f:Lxh0;

.field public static final g:Lxh0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lxh0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->b:Lxh0;

    new-instance v0, Lxh0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->c:Lxh0;

    new-instance v0, Lxh0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->d:Lxh0;

    new-instance v0, Lxh0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->e:Lxh0;

    new-instance v0, Lxh0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->f:Lxh0;

    new-instance v0, Lxh0;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lxh0;-><init>(I)V

    sput-object v0, Lxh0;->g:Lxh0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lxh0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lxh0;->a:B

    return p0
.end method
