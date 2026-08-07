.class public final synthetic Ll/c99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/l99;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/util/HashSet;

.field public final synthetic e:Lrx/subjects/a;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/l99;Ljava/lang/String;ZLjava/util/HashSet;Lrx/subjects/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c99;->a:Ll/l99;

    iput-object p2, p0, Ll/c99;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/c99;->c:Z

    iput-object p4, p0, Ll/c99;->d:Ljava/util/HashSet;

    iput-object p5, p0, Ll/c99;->e:Lrx/subjects/a;

    iput-object p6, p0, Ll/c99;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/c99;->a:Ll/l99;

    iget-object v1, p0, Ll/c99;->b:Ljava/lang/String;

    iget-boolean v2, p0, Ll/c99;->c:Z

    iget-object v3, p0, Ll/c99;->d:Ljava/util/HashSet;

    iget-object v4, p0, Ll/c99;->e:Lrx/subjects/a;

    iget-object v5, p0, Ll/c99;->f:Ljava/lang/String;

    invoke-static/range {v0 .. v5}, Ll/l99;->g3(Ll/l99;Ljava/lang/String;ZLjava/util/HashSet;Lrx/subjects/a;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
