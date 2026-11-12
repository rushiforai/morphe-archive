.class public final Leck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfck;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ldxh;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Ldxh;


# direct methods
.method public constructor <init>(Landroid/view/View;Ldxh;Landroid/view/View;Ldxh;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leck;->a:Landroid/view/View;

    iput-object p2, p0, Leck;->b:Ldxh;

    iput-object p3, p0, Leck;->c:Landroid/view/View;

    iput-object p4, p0, Leck;->d:Ldxh;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 2

    iget-object v0, p0, Leck;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Leck;->d:Ldxh;

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public final b()I
    .registers 2

    iget-object v0, p0, Leck;->c:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Leck;->b:Ldxh;

    invoke-virtual {p0, v0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    return p0
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Leck;->a:Landroid/view/View;

    return-object p0
.end method
