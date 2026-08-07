.class public final synthetic Ll/b1z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/u1z;


# direct methods
.method public synthetic constructor <init>(Ll/u1z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b1z;->a:Ll/u1z;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b1z;->a:Ll/u1z;

    check-cast p1, Ljava/io/File;

    invoke-static {p0, p1}, Ll/u1z;->k0(Ll/u1z;Ljava/io/File;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
