.class public abstract Lk2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# instance fields
.field public final a:Lzyk;

.field public final b:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lf2g;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lf2g;-><init>(Lk2g;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance v0, Lf2g;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lf2g;-><init>(Lk2g;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lk2g;->a:Lzyk;

    new-instance v0, Lf2g;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lf2g;-><init>(Lk2g;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lk2g;->b:Lzyk;

    return-void
.end method


# virtual methods
.method public abstract a()Lj2g;
.end method

.method public abstract b()[Lvz8;
.end method

.method public c(Landroid/content/Context;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Z)Landroid/service/autofill/Dataset;
    .registers 5

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Not implemented"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
