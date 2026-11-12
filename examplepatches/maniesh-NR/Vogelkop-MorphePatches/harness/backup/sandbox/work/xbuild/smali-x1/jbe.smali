.class public final Ljbe;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb2l;

.field public final b:I

.field public final c:J


# direct methods
.method public constructor <init>(Lb2l;IJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljbe;->a:Lb2l;

    iput p2, p0, Ljbe;->b:I

    iput-wide p3, p0, Ljbe;->c:J

    return-void
.end method
