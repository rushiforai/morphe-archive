.class public final Le/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La/b;


# instance fields
.field public final synthetic a:Lstart/MainActivity;


# direct methods
.method public constructor <init>(Lstart/MainActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/h;->a:Lstart/MainActivity;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    iget-object v0, p0, Le/h;->a:Lstart/MainActivity;

    invoke-virtual {v0}, Le/i;->i()Le/o;

    move-result-object v1

    invoke-virtual {v1}, Le/o;->a()V

    iget-object v0, v0, Landroidx/activity/l;->e:LL/f;

    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    const-string v2, "androidx:appcompat"

    invoke-virtual {v0, v2}, LL/e;->c(Ljava/lang/String;)Landroid/os/Bundle;

    invoke-virtual {v1}, Le/o;->c()V

    return-void
.end method
