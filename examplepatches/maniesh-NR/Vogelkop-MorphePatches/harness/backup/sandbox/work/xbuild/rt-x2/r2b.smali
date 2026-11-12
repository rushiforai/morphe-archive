.class public final Lr2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llkf;


# virtual methods
.method public final b(Ljava/lang/Class;)Landroidx/fragment/app/Fragment;
    .registers 2

    const-class p0, Lo2b;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_e

    new-instance p0, Lo2b;

    invoke-direct {p0}, Lo2b;-><init>()V

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method
