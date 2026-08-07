.class public final synthetic Ll/jdb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/z1d0;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Ljava/lang/String;Ll/z1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdb;->a:Ll/dkb;

    iput-object p2, p0, Ll/jdb;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/jdb;->c:Ll/z1d0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jdb;->a:Ll/dkb;

    iget-object v1, p0, Ll/jdb;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/jdb;->c:Ll/z1d0;

    invoke-static {v0, v1, p0}, Ll/dkb;->w3(Ll/dkb;Ljava/lang/String;Ll/z1d0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
