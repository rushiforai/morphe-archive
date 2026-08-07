.class public final synthetic Ll/elg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/elg;->a:I

    iput-object p2, p0, Ll/elg;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/elg;->a:I

    iget-object p0, p0, Ll/elg;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/hlg;->z3(ILjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
