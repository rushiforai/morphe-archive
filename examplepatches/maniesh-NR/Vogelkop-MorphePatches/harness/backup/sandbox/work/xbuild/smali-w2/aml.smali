.class public final Laml;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:I

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Z


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p5, p0, Laml;->a:Z

    iput p1, p0, Laml;->b:I

    iput-object p2, p0, Laml;->c:Ljava/lang/String;

    iput-object p3, p0, Laml;->d:Ljava/lang/String;

    iput-object p4, p0, Laml;->e:Ljava/lang/String;

    iput-boolean p6, p0, Laml;->f:Z

    return-void
.end method
