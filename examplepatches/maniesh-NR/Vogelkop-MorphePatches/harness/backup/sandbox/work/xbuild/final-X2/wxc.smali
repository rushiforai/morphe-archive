.class public final Lwxc;
.super Lxxc;
.source "SourceFile"


# instance fields
.field public final d:Lfdn;


# direct methods
.method public constructor <init>(Lrcd;Lfdn;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lxxc;-><init>(Lrcd;Lrcd;)V

    iput-object p2, p0, Lwxc;->d:Lfdn;

    return-void
.end method


# virtual methods
.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lwxc;->d:Lfdn;

    iget-object p0, p0, Lfdn;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final f()Lfdn;
    .registers 1

    iget-object p0, p0, Lwxc;->d:Lfdn;

    return-object p0
.end method
