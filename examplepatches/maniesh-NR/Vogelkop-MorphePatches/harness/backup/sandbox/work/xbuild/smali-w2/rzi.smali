.class public final Lrzi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvzi;


# instance fields
.field public final synthetic a:Ltzi;


# direct methods
.method public constructor <init>(Ltzi;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrzi;->a:Ltzi;

    return-void
.end method


# virtual methods
.method public final G(JZ)V
    .registers 4

    iget-object p0, p0, Lrzi;->a:Ltzi;

    if-eqz p3, :cond_8

    invoke-virtual {p0}, Ltzi;->c()V

    goto :goto_17

    :cond_8
    iget-object p1, p0, Ltzi;->a:Le5d;

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_17

    invoke-virtual {p0}, Ltzi;->d()V

    :cond_17
    :goto_17
    iget-boolean p1, p0, Ltzi;->h:Z

    if-nez p1, :cond_1e

    invoke-virtual {p0}, Ltzi;->a()V

    :cond_1e
    return-void
.end method
