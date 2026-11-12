.class public final Ltm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Ltm0;

.field public static final c:Ltm0;

.field public static final d:Ltm0;

.field public static final e:Ltm0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ltm0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ltm0;-><init>(I)V

    sput-object v0, Ltm0;->b:Ltm0;

    new-instance v0, Ltm0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ltm0;-><init>(I)V

    sput-object v0, Ltm0;->c:Ltm0;

    new-instance v0, Ltm0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ltm0;-><init>(I)V

    sput-object v0, Ltm0;->d:Ltm0;

    new-instance v0, Ltm0;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ltm0;-><init>(I)V

    sput-object v0, Ltm0;->e:Ltm0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Ltm0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Ltm0;->a:B

    return p0
.end method
