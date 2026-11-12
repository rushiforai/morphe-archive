.class public final Lg80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lg80;

.field public static final c:Lg80;

.field public static final d:Lg80;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lg80;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lg80;-><init>(I)V

    sput-object v0, Lg80;->b:Lg80;

    new-instance v0, Lg80;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lg80;-><init>(I)V

    sput-object v0, Lg80;->c:Lg80;

    new-instance v0, Lg80;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lg80;-><init>(I)V

    sput-object v0, Lg80;->d:Lg80;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lg80;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lg80;->a:B

    return p0
.end method
