.class public final synthetic Ll/a6c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field public final synthetic a:Ll/b6c;


# direct methods
.method public synthetic constructor <init>(Ll/b6c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a6c;->a:Ll/b6c;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a6c;->a:Ll/b6c;

    invoke-static {p0, p1, p2}, Ll/b6c;->a(Ll/b6c;Ljava/io/File;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
