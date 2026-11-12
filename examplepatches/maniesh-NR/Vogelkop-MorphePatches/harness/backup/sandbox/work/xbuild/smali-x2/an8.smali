.class public abstract Lan8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwcj;


# instance fields
.field public final a:Lzcj;


# direct methods
.method public constructor <init>(Lzcj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lan8;->a:Lzcj;

    return-void
.end method


# virtual methods
.method public final c(Landroid/content/Context;Li4d;)V
    .registers 3

    return-void
.end method

.method public e(Landroid/content/Context;)Landroid/graphics/drawable/Icon;
    .registers 2

    const p0, 0x7f0805bc

    invoke-static {p1, p0}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object p0

    return-object p0
.end method
