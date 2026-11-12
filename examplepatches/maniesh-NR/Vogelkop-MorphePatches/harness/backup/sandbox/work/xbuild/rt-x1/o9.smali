.class public final Lo9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lx73;


# instance fields
.field public final synthetic a:Lp9;


# direct methods
.method public constructor <init>(Lp9;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo9;->a:Lp9;

    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/material/slider/Slider;

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lcom/google/android/material/slider/Slider;

    iget-object p0, p0, Lo9;->a:Lp9;

    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    invoke-virtual {p1}, Lcom/google/android/material/slider/Slider;->z0()F

    move-result p1

    iget-object p0, p0, Lt9;->d:Lbxk;

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Lbxk;->h(I)V

    return-void
.end method
