.class public final Lgwf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[I

.field public final b:Lnd7;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lgwf;->a:[I

    iput-object v0, p0, Lgwf;->b:Lnd7;

    return-void
.end method

.method public constructor <init>([ILnd7;)V
    .registers 3

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lgwf;->a:[I

    .line 11
    iput-object p2, p0, Lgwf;->b:Lnd7;

    return-void
.end method
