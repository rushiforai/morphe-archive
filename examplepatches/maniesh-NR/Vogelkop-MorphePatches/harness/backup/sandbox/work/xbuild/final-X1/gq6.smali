.class public final Lgq6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lg77;


# direct methods
.method public constructor <init>(Lg77;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgq6;->a:Lg77;

    return-void
.end method


# virtual methods
.method public final a()Lf99;
    .registers 1

    iget-object p0, p0, Lgq6;->a:Lg77;

    iget-object p0, p0, Lg77;->b:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf99;

    return-object p0
.end method
