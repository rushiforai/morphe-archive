.class public final synthetic Ll/rva;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/z1d0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/z1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rva;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/rva;->b:Ll/z1d0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rva;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/rva;->b:Ll/z1d0;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/x;->n3(Ljava/lang/String;Ll/z1d0;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
