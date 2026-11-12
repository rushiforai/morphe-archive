.class public final Lzy3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lz8l;


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Z

.field public final f:[B

.field public final g:[B


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B[B)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lzy3;->a:I

    iput-object p2, p0, Lzy3;->b:Ljava/lang/String;

    iput-object p4, p0, Lzy3;->c:Ljava/lang/String;

    iput-object p3, p0, Lzy3;->d:Ljava/lang/String;

    iput-boolean p5, p0, Lzy3;->e:Z

    iput-object p6, p0, Lzy3;->f:[B

    iput-object p7, p0, Lzy3;->g:[B

    return-void
.end method


# virtual methods
.method public final getUrl()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lzy3;->b:Ljava/lang/String;

    return-object p0
.end method
