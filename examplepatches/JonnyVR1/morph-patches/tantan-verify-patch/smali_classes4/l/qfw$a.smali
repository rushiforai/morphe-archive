.class public Ll/qfw$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ltf0$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qfw;->n(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/qfw;


# direct methods
.method public constructor <init>(Ll/qfw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qfw$a;->a:Ll/qfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qfw$a;->a:Ll/qfw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 4
    .line 5
    const/high16 p1, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qfw$a;->a:Ll/qfw;

    .line 2
    .line 3
    iget-object p0, p0, Ll/qfw;->d:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 4
    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    add-int/2addr p1, v0

    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
