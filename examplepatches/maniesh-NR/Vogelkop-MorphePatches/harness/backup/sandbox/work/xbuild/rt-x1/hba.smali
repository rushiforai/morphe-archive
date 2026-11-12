.class public final Lhba;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lt0g;

.field public final b:Lt0g;


# direct methods
.method public constructor <init>(Ldg5;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lhba;->a:Lt0g;

    const/4 p1, 0x0

    invoke-static {p1}, Lhyg;->k(Ljava/lang/Object;)Lt0g;

    move-result-object p1

    iput-object p1, p0, Lhba;->b:Lt0g;

    return-void
.end method
