.class public final Lq1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Ljava/lang/String;

.field public final c:[Ljava/lang/String;

.field public final d:[Ljava/lang/String;

.field public final e:Z


# direct methods
.method public constructor <init>(ZLjava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lq1;->a:Z

    iput-object p2, p0, Lq1;->b:Ljava/lang/String;

    iput-object p3, p0, Lq1;->c:[Ljava/lang/String;

    iput-object p4, p0, Lq1;->d:[Ljava/lang/String;

    iput-boolean p5, p0, Lq1;->e:Z

    return-void
.end method
