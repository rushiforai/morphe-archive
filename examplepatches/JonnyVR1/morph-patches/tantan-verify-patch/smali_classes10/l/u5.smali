.class public final synthetic Ll/u5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# instance fields
.field public final synthetic a:Ll/w5;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/e4d0;


# direct methods
.method public synthetic constructor <init>(Ll/w5;Ljava/lang/String;Ljava/lang/String;Ll/e4d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u5;->a:Ll/w5;

    iput-object p2, p0, Ll/u5;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u5;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/u5;->d:Ll/e4d0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/u5;->a:Ll/w5;

    iget-object v1, p0, Ll/u5;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/u5;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/u5;->d:Ll/e4d0;

    move-object v4, p1

    check-cast v4, Ljava/lang/String;

    move-object v5, p2

    check-cast v5, Ljava/io/File;

    invoke-static/range {v0 .. v5}, Ll/w5;->a(Ll/w5;Ljava/lang/String;Ljava/lang/String;Ll/e4d0;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
