.class public final Lcu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lcu0;

.field public static final c:Lcu0;

.field public static final d:Lcu0;

.field public static final e:Lcu0;

.field public static final f:Lcu0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lcu0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcu0;-><init>(I)V

    sput-object v0, Lcu0;->b:Lcu0;

    new-instance v0, Lcu0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcu0;-><init>(I)V

    sput-object v0, Lcu0;->c:Lcu0;

    new-instance v0, Lcu0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcu0;-><init>(I)V

    sput-object v0, Lcu0;->d:Lcu0;

    new-instance v0, Lcu0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcu0;-><init>(I)V

    sput-object v0, Lcu0;->e:Lcu0;

    new-instance v0, Lcu0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcu0;-><init>(I)V

    sput-object v0, Lcu0;->f:Lcu0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lcu0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lcu0;->a:B

    return p0
.end method
