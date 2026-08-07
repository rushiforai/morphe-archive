.class public final synthetic Ll/o4d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o4d0;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/o4d0;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o4d0;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/o4d0;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/s4d0;->c(Ljava/util/ArrayList;Ljava/io/File;)V

    return-void
.end method
