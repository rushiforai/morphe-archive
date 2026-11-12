.class public final Ledg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lg1g;

.field public final b:[I

.field public c:Z

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lg1g;

    invoke-direct {v0}, Lg1g;-><init>()V

    iput-object v0, p0, Ledg;->a:Lg1g;

    const/16 v0, 0x100

    new-array v0, v0, [I

    iput-object v0, p0, Ledg;->b:[I

    return-void
.end method
