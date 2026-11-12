.class public final Lep0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lep0;

.field public static final c:Lep0;

.field public static final d:Lep0;


# instance fields
.field public final a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lep0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lep0;-><init>(I)V

    sput-object v0, Lep0;->b:Lep0;

    new-instance v0, Lep0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lep0;-><init>(I)V

    sput-object v0, Lep0;->c:Lep0;

    new-instance v0, Lep0;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lep0;-><init>(I)V

    sput-object v0, Lep0;->d:Lep0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-byte p1, p0, Lep0;->a:B

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-byte p0, p0, Lep0;->a:B

    return p0
.end method
