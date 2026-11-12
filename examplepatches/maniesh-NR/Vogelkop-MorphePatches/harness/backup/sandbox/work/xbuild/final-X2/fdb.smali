.class public final Lfdb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcdb;


# instance fields
.field public final a:Lwth;

.field public final b:Ljava/lang/String;

.field public final c:I

.field public final d:Z

.field public final e:I


# direct methods
.method public constructor <init>(Lwth;Ljava/lang/String;IZI)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfdb;->a:Lwth;

    iput-object p2, p0, Lfdb;->b:Ljava/lang/String;

    iput p3, p0, Lfdb;->c:I

    iput-boolean p4, p0, Lfdb;->d:Z

    iput p5, p0, Lfdb;->e:I

    return-void
.end method


# virtual methods
.method public final execute()V
    .registers 9

    new-instance v0, Lxxh;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Lac8;->a(Ljava/lang/Object;)V

    const/4 v7, 0x0

    const/4 v6, 0x0

    iget-object v1, p0, Lfdb;->a:Lwth;

    iget-object v2, p0, Lfdb;->b:Ljava/lang/String;

    iget v3, p0, Lfdb;->c:I

    iget-boolean v4, p0, Lfdb;->d:Z

    iget v5, p0, Lfdb;->e:I

    invoke-virtual/range {v1 .. v7}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    return-void
.end method
