.class public final Lhg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lhg0;

.field public static final c:Lhg0;

.field public static final d:Lhg0;

.field public static final e:Lhg0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lhg0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lhg0;-><init>(I)V

    sput-object v0, Lhg0;->b:Lhg0;

    new-instance v0, Lhg0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lhg0;-><init>(I)V

    sput-object v0, Lhg0;->c:Lhg0;

    new-instance v0, Lhg0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lhg0;-><init>(I)V

    sput-object v0, Lhg0;->d:Lhg0;

    new-instance v0, Lhg0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lhg0;-><init>(I)V

    sput-object v0, Lhg0;->e:Lhg0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lhg0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lhg0;->a:B

    return p0
.end method
