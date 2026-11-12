.class public final Lo3m;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ly5i;

.field public final b:Lnb2;

.field public final c:Lnb2;


# direct methods
.method public constructor <init>(Ly5i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo3m;->a:Ly5i;

    new-instance p1, Lnb2;

    const/16 v0, 0x18

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lo3m;->b:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x19

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lo3m;->c:Lnb2;

    return-void
.end method
