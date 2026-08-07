.class public final synthetic Ll/b19;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/d19;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/d19;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b19;->a:Ll/d19;

    iput-object p2, p0, Ll/b19;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/b19;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/b19;->d:Z

    iput-object p5, p0, Ll/b19;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/b19;->a:Ll/d19;

    iget-object v1, p0, Ll/b19;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/b19;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/b19;->d:Z

    iget-object p0, p0, Ll/b19;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Ll/d19;->k3(Ll/d19;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
