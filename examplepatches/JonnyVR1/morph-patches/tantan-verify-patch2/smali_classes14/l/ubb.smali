.class public final synthetic Ll/ubb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/dcb;


# direct methods
.method public synthetic constructor <init>(ZLl/dcb;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ubb;->a:Z

    iput-object p2, p0, Ll/ubb;->b:Ll/dcb;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ubb;->a:Z

    iget-object p0, p0, Ll/ubb;->b:Ll/dcb;

    invoke-static {v0, p0}, Ll/dcb;->b3(ZLl/dcb;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
