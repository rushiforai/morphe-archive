.class public final Lxg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lxg0;

.field public static final c:Lxg0;

.field public static final d:Lxg0;

.field public static final e:Lxg0;

.field public static final f:Lxg0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lxg0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lxg0;-><init>(I)V

    sput-object v0, Lxg0;->b:Lxg0;

    new-instance v0, Lxg0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lxg0;-><init>(I)V

    sput-object v0, Lxg0;->c:Lxg0;

    new-instance v0, Lxg0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lxg0;-><init>(I)V

    sput-object v0, Lxg0;->d:Lxg0;

    new-instance v0, Lxg0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lxg0;-><init>(I)V

    sput-object v0, Lxg0;->e:Lxg0;

    new-instance v0, Lxg0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lxg0;-><init>(I)V

    sput-object v0, Lxg0;->f:Lxg0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lxg0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lxg0;->a:B

    return p0
.end method
