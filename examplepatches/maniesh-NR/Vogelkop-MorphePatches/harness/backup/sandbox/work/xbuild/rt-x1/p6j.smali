.class public final Lp6j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq6j;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lp6j;->a:I

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    iget p0, p0, Lp6j;->a:I

    if-nez p0, :cond_7

    const-string p0, ""

    return-object p0

    :cond_7
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
