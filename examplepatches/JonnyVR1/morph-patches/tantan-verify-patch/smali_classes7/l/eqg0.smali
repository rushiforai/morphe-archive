.class public final synthetic Ll/eqg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/msg0;

.field public final synthetic b:Ljava/io/File;

.field public final synthetic c:Ll/uug0;

.field public final synthetic d:Ll/gkg0;


# direct methods
.method public synthetic constructor <init>(Ll/msg0;Ljava/io/File;Ll/uug0;Ll/gkg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eqg0;->a:Ll/msg0;

    iput-object p2, p0, Ll/eqg0;->b:Ljava/io/File;

    iput-object p3, p0, Ll/eqg0;->c:Ll/uug0;

    iput-object p4, p0, Ll/eqg0;->d:Ll/gkg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/eqg0;->a:Ll/msg0;

    iget-object v1, p0, Ll/eqg0;->b:Ljava/io/File;

    iget-object v2, p0, Ll/eqg0;->c:Ll/uug0;

    iget-object p0, p0, Ll/eqg0;->d:Ll/gkg0;

    invoke-virtual {v0, v1, v2, p0}, Ll/msg0;->b(Ljava/io/File;Ll/uug0;Ll/gkg0;)V

    return-void
.end method
