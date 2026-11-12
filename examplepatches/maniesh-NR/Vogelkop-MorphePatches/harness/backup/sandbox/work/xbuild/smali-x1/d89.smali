.class public final synthetic Ld89;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lni;


# instance fields
.field public final synthetic a:Lg89;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lg89;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld89;->a:Lg89;

    iput-boolean p2, p0, Ld89;->b:Z

    return-void
.end method


# virtual methods
.method public final a(ILandroid/content/Intent;)V
    .registers 5

    iget-object p2, p0, Ld89;->a:Lg89;

    iget-object v0, p2, Lg89;->a:Lx5f;

    iget-boolean p0, p0, Ld89;->b:Z

    const/4 v1, -0x1

    if-ne p1, v1, :cond_f

    sget-object p1, Lvb0;->b:Lvb0;

    invoke-virtual {v0, p1, p0}, Lx5f;->O0(Lvb0;Z)V

    goto :goto_14

    :cond_f
    sget-object p1, Lvb0;->c:Lvb0;

    invoke-virtual {v0, p1, p0}, Lx5f;->O0(Lvb0;Z)V

    :goto_14
    iget-object p0, p2, Lg89;->j:Lode;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p2}, Lg89;->c()V

    return-void
.end method
