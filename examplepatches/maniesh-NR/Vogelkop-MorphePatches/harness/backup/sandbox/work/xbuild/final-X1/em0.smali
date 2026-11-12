.class public final Lem0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lem0;

.field public static final c:Lem0;

.field public static final d:Lem0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lem0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lem0;-><init>(I)V

    sput-object v0, Lem0;->b:Lem0;

    new-instance v0, Lem0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lem0;-><init>(I)V

    sput-object v0, Lem0;->c:Lem0;

    new-instance v0, Lem0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lem0;-><init>(I)V

    sput-object v0, Lem0;->d:Lem0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lem0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lem0;->a:B

    return p0
.end method
