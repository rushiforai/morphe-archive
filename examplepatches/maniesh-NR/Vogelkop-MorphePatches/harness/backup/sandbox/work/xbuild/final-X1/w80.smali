.class public final Lw80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lw80;

.field public static final c:Lw80;

.field public static final d:Lw80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lw80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lw80;-><init>(I)V

    sput-object v0, Lw80;->b:Lw80;

    new-instance v0, Lw80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lw80;-><init>(I)V

    sput-object v0, Lw80;->c:Lw80;

    new-instance v0, Lw80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lw80;-><init>(I)V

    sput-object v0, Lw80;->d:Lw80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lw80;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lw80;->a:B

    return p0
.end method
