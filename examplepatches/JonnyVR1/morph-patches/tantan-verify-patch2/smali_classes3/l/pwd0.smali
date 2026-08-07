.class public final synthetic Ll/pwd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:[Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Z[Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/pwd0;->a:Z

    iput-object p2, p0, Ll/pwd0;->b:[Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/io/File;)Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/pwd0;->a:Z

    iget-object p0, p0, Ll/pwd0;->b:[Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/swd0;->b(Z[Ljava/lang/String;Ljava/io/File;)Z

    move-result p0

    return p0
.end method
