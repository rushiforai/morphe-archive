.class public final Lmo3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lpde;


# direct methods
.method public constructor <init>(Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lpde;

    new-instance v1, Llo3;

    invoke-direct {v1, p1}, Llo3;-><init>(Z)V

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lmo3;->a:Lpde;

    return-void
.end method
