.class public final synthetic Ll/obb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/sbb;


# direct methods
.method public synthetic constructor <init>(Ll/sbb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/obb;->a:Ll/sbb;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/obb;->a:Ll/sbb;

    invoke-static {p0}, Ll/sbb;->c3(Ll/sbb;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
