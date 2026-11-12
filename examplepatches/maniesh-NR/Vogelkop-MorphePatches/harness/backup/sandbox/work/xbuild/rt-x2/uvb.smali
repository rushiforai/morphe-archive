.class public final Luvb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:B

.field public final c:B

.field public final d:Ltvb;


# direct methods
.method public constructor <init>(IIILtvb;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Luvb;->a:I

    iput-byte p2, p0, Luvb;->b:B

    iput-byte p3, p0, Luvb;->c:B

    iput-object p4, p0, Luvb;->d:Ltvb;

    return-void
.end method
