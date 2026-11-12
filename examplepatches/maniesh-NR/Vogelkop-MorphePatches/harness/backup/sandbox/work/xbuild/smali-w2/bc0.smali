.class public final Lbc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyc0;


# static fields
.field public static final b:Lbc0;

.field public static final c:Lbc0;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbc0;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lbc0;-><init>(I)V

    sput-object v0, Lbc0;->b:Lbc0;

    new-instance v0, Lbc0;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lbc0;-><init>(I)V

    sput-object v0, Lbc0;->c:Lbc0;

    return-void
.end method

.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lbc0;->a:Z

    return-void
.end method


# virtual methods
.method public final getValue()I
    .registers 1

    iget-boolean p0, p0, Lbc0;->a:Z

    return p0
.end method
