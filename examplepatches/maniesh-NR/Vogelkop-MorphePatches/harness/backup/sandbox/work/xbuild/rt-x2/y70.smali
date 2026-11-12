.class public final Ly70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ly70;

.field public static final c:Ly70;

.field public static final d:Ly70;

.field public static final e:Ly70;

.field public static final f:Ly70;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ly70;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ly70;-><init>(I)V

    sput-object v0, Ly70;->b:Ly70;

    new-instance v0, Ly70;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ly70;-><init>(I)V

    sput-object v0, Ly70;->c:Ly70;

    new-instance v0, Ly70;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ly70;-><init>(I)V

    sput-object v0, Ly70;->d:Ly70;

    new-instance v0, Ly70;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ly70;-><init>(I)V

    sput-object v0, Ly70;->e:Ly70;

    new-instance v0, Ly70;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ly70;-><init>(I)V

    sput-object v0, Ly70;->f:Ly70;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ly70;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ly70;->a:B

    return p0
.end method
