.class public final La56;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Laln;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, La56;->a:I

    iput p2, p0, La56;->b:I

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lg7j;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lo2c;)Lxkn;
    .registers 3

    iget p1, p0, La56;->a:I

    iget p2, p0, La56;->b:I

    invoke-static {p0, p1, p2}, Lxkn;->a(Laln;II)Lxkn;

    move-result-object p0

    return-object p0
.end method

.method public final f()I
    .registers 2

    iget v0, p0, La56;->a:I

    iget p0, p0, La56;->b:I

    if-eq v0, p0, :cond_9

    const/16 p0, 0x14

    return p0

    :cond_9
    const/16 p0, 0x13

    return p0
.end method

.method public final getId()Ljava/lang/String;
    .registers 1

    const-string p0, "CUSTOM_COLOR"

    return-object p0
.end method

.method public final getType()I
    .registers 2

    iget v0, p0, La56;->a:I

    iget p0, p0, La56;->b:I

    if-eq v0, p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
