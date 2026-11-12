.class public final Lwwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le8n;


# instance fields
.field public final a:Lvwf;

.field public b:I

.field public c:F


# direct methods
.method public constructor <init>(Lvwf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwwf;->a:Lvwf;

    return-void
.end method


# virtual methods
.method public final onPageScrollStateChanged(I)V
    .registers 2

    return-void
.end method

.method public final onPageScrolled(IFI)V
    .registers 4

    int-to-float p1, p1

    add-float/2addr p1, p2

    iput p1, p0, Lwwf;->c:F

    iget-object p0, p0, Lwwf;->a:Lvwf;

    invoke-interface {p0}, Lvwf;->o()V

    return-void
.end method

.method public final onPageSelected(I)V
    .registers 3

    iget v0, p0, Lwwf;->b:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lwwf;->b:I

    iget-object p0, p0, Lwwf;->a:Lvwf;

    invoke-interface {p0}, Lvwf;->o()V

    return-void
.end method
