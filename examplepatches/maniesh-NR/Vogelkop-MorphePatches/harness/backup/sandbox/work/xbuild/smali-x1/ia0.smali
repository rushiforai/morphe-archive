.class public final Lia0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lia0;

.field public static final c:Lia0;

.field public static final d:Lia0;

.field public static final e:Lia0;

.field public static final f:Lia0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lia0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lia0;-><init>(I)V

    sput-object v0, Lia0;->b:Lia0;

    new-instance v0, Lia0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lia0;-><init>(I)V

    sput-object v0, Lia0;->c:Lia0;

    new-instance v0, Lia0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lia0;-><init>(I)V

    sput-object v0, Lia0;->d:Lia0;

    new-instance v0, Lia0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lia0;-><init>(I)V

    sput-object v0, Lia0;->e:Lia0;

    new-instance v0, Lia0;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lia0;-><init>(I)V

    sput-object v0, Lia0;->f:Lia0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lia0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lia0;->a:B

    return p0
.end method
