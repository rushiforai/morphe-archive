.class Ll/m9e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ioh0$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/m9e;->m(Ll/aje;Ljava/io/File;Ll/ire0;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/m9e;


# direct methods
.method public constructor <init>(Ll/m9e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m9e$a;->a:Ll/m9e;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(FD)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m9e$a;->a:Ll/m9e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wr4;->a()Ll/wr4$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/m9e$a;->a:Ll/m9e;

    .line 10
    .line 11
    invoke-interface {v0, p1, p2, p3, p0}, Ll/wr4$a;->a(FDLl/wr4;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
