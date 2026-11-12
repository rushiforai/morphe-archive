.class public final Ldgd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;J)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p4, p0, Ldgd;->a:J

    iput-object p1, p0, Ldgd;->b:Ljava/lang/String;

    iput-object p3, p0, Ldgd;->c:Ljava/lang/String;

    iput p2, p0, Ldgd;->d:I

    return-void
.end method
