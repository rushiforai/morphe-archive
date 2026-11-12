.class public final Ld15;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lbre;

.field public final c:I


# direct methods
.method public constructor <init>(ILbre;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ld15;->a:I

    iput-object p2, p0, Ld15;->b:Lbre;

    iput p3, p0, Ld15;->c:I

    return-void
.end method
