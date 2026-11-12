.class public final synthetic Luzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:Lh42;

.field public final synthetic b:Lwzg;

.field public final synthetic c:Lkze;

.field public final synthetic d:Lkze;


# direct methods
.method public synthetic constructor <init>(Lh42;Lwzg;Lkze;Lkze;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luzg;->a:Lh42;

    iput-object p2, p0, Luzg;->b:Lwzg;

    iput-object p3, p0, Luzg;->c:Lkze;

    iput-object p4, p0, Luzg;->d:Lkze;

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 4

    iget-object p1, p0, Luzg;->b:Lwzg;

    iget-object p1, p1, Lwzg;->c:Ljava/lang/Object;

    check-cast p1, Lkze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Luzg;->c:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Luzg;->d:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez p1, :cond_38

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_38

    if-eqz v1, :cond_35

    sget-object p1, Lvzg;->a:Lvzg;

    goto :goto_3a

    :cond_35
    sget-object p1, Lvzg;->b:Lvzg;

    goto :goto_3a

    :cond_38
    sget-object p1, Lvzg;->c:Lvzg;

    :goto_3a
    iget-object p0, p0, Luzg;->a:Lh42;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
