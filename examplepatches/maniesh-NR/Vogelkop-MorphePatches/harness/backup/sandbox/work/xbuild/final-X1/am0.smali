.class public final Lam0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lam0;

.field public static final c:Lam0;

.field public static final d:Lam0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lam0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lam0;-><init>(I)V

    sput-object v0, Lam0;->b:Lam0;

    new-instance v0, Lam0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lam0;-><init>(I)V

    sput-object v0, Lam0;->c:Lam0;

    new-instance v0, Lam0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lam0;-><init>(I)V

    sput-object v0, Lam0;->d:Lam0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lam0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lam0;->a:B

    return p0
.end method
