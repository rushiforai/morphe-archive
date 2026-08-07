.class public final synthetic Ll/et8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/et8;->a:I

    iput p2, p0, Ll/et8;->b:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/et8;->a:I

    iget p0, p0, Ll/et8;->b:I

    invoke-static {v0, p0}, Ll/lu8;->k3(II)Lrx/c;

    move-result-object p0

    return-object p0
.end method
