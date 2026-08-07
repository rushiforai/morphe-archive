.class public final synthetic Ll/upq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j9e;


# instance fields
.field public final synthetic a:Ll/wpq0;

.field public final synthetic b:Ll/e4d0;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wpq0;Ll/e4d0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/upq0;->a:Ll/wpq0;

    iput-object p2, p0, Ll/upq0;->b:Ll/e4d0;

    iput-object p3, p0, Ll/upq0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/upq0;->a:Ll/wpq0;

    iget-object v1, p0, Ll/upq0;->b:Ll/e4d0;

    iget-object v2, p0, Ll/upq0;->c:Ljava/lang/String;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-static/range {v0 .. v6}, Ll/wpq0;->q(Ll/wpq0;Ll/e4d0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    return-object p0
.end method
