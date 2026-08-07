.class public final synthetic Ll/bfb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/z1d0;


# direct methods
.method public synthetic constructor <init>(ILl/z1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/bfb;->a:I

    iput-object p2, p0, Ll/bfb;->b:Ll/z1d0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/bfb;->a:I

    iget-object p0, p0, Ll/bfb;->b:Ll/z1d0;

    invoke-static {v0, p0}, Ll/dkb;->C4(ILl/z1d0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
