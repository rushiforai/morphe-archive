.class public final synthetic Lug7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbcf;


# instance fields
.field public final synthetic a:Lwg7;


# direct methods
.method public synthetic constructor <init>(Lwg7;)V
    .registers 2

    iput-object p1, p0, Lug7;->a:Lwg7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 4

    const/16 p1, 0x207

    iget-object v0, p2, Lg3o;->a:Ld3o;

    invoke-virtual {v0, p1}, Ld3o;->i(I)Lr9b;

    move-result-object p1

    iget p1, p1, Lr9b;->d:I

    iget-object p0, p0, Lug7;->a:Lwg7;

    iput p1, p0, Lwg7;->Q:I

    invoke-virtual {p0}, Lwg7;->K0()V

    return-object p2
.end method
