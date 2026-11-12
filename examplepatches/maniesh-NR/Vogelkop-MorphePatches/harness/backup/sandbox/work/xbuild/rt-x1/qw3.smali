.class public final Lqw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldul;


# instance fields
.field public final synthetic a:Ltw3;

.field public final synthetic b:Lkul;


# direct methods
.method public constructor <init>(Ltw3;Lkul;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqw3;->a:Ltw3;

    iput-object p2, p0, Lqw3;->b:Lkul;

    return-void
.end method


# virtual methods
.method public final a(Ljul;)Ljava/lang/Object;
    .registers 2

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final b()Lkotlin/Unit;
    .registers 2

    iget-object v0, p0, Lqw3;->a:Ltw3;

    iget-object v0, v0, Ltw3;->C0:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    iget-object v0, p0, Lqw3;->b:Lkul;

    iget-object v0, v0, Lkul;->e:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final c(Landroid/net/Uri;Lcek;)Ljava/lang/Object;
    .registers 3

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
