.class public final Lms5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Lks5;

.field public final c:Lls5;


# direct methods
.method public constructor <init>(ILks5;Lls5;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lms5;->a:I

    iput-object p2, p0, Lms5;->b:Lks5;

    iput-object p3, p0, Lms5;->c:Lls5;

    return-void
.end method
