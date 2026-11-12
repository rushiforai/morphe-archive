.class public final Lhmi;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:I

.field public final c:Lgmi;

.field public final d:Lfmi;


# direct methods
.method public constructor <init>(Ljava/lang/String;ILgmi;Lfmi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhmi;->a:Ljava/lang/String;

    iput p2, p0, Lhmi;->b:I

    iput-object p3, p0, Lhmi;->c:Lgmi;

    iput-object p4, p0, Lhmi;->d:Lfmi;

    return-void
.end method
