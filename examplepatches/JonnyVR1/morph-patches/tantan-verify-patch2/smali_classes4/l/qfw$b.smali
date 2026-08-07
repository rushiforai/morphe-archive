.class public Ll/qfw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    iput-object p1, p0, Ll/qfw$b;->a:Ll/qfw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/qfw$b;->a:Ll/qfw;

    .line 2
    .line 3
    invoke-static {p1}, Ll/qfw;->f(Ll/qfw;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/qfw$b;->a:Ll/qfw;

    .line 11
    .line 12
    invoke-static {p0}, Ll/qfw;->i(Ll/qfw;)Ll/nfw;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/nfw;->o0()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
