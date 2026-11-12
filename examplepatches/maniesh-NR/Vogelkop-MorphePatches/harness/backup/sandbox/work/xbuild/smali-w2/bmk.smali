.class public final Lbmk;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lcsh;

.field public final d:F

.field public final e:Z


# direct methods
.method public constructor <init>(Lcsh;FZ)V
    .registers 6

    sget-object v0, Lemk;->b:Lemk;

    const/16 v1, 0x13

    invoke-direct {p0, v0, v1}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lbmk;->c:Lcsh;

    iput p2, p0, Lbmk;->d:F

    iput-boolean p3, p0, Lbmk;->e:Z

    return-void
.end method
