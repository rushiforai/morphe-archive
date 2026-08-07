.class public final synthetic Ll/pc7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pcj;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pc7;->a:Ll/pcj;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc7;->a:Ll/pcj;

    invoke-static {p0}, Lcom/p1/mobile/putong/feed/api/a;->w0(Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
