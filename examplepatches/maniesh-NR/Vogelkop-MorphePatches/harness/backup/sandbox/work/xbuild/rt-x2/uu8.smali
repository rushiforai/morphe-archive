.class public final Luu8;
.super Lia2;
.source "SourceFile"

# interfaces
.implements Lpv8;


# instance fields
.field public final c:Lnw8;

.field public final d:Z


# direct methods
.method public constructor <init>(Lnw8;Z)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    iput-object p1, p0, Luu8;->c:Lnw8;

    iput-boolean p2, p0, Luu8;->d:Z

    return-void
.end method
