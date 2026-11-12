.class public final Lkak;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:C

.field public final b:Lekc;

.field public final c:Ljak;

.field public final d:Lqzg;


# direct methods
.method public constructor <init>(ILekc;Ljak;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-char p1, p0, Lkak;->a:C

    iput-object p2, p0, Lkak;->b:Lekc;

    iput-object p3, p0, Lkak;->c:Ljak;

    new-instance p1, Lqzg;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lkak;->d:Lqzg;

    return-void
.end method
