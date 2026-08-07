.class public final synthetic Ll/f99;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/l99;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/util/HashSet;

.field public final synthetic d:Lrx/subjects/a;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/l99;ZLjava/util/HashSet;Lrx/subjects/a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f99;->a:Ll/l99;

    iput-boolean p2, p0, Ll/f99;->b:Z

    iput-object p3, p0, Ll/f99;->c:Ljava/util/HashSet;

    iput-object p4, p0, Ll/f99;->d:Lrx/subjects/a;

    iput-object p5, p0, Ll/f99;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/f99;->a:Ll/l99;

    iget-boolean v1, p0, Ll/f99;->b:Z

    iget-object v2, p0, Ll/f99;->c:Ljava/util/HashSet;

    iget-object v3, p0, Ll/f99;->d:Lrx/subjects/a;

    iget-object v4, p0, Ll/f99;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Ll/l99;->h3(Ll/l99;ZLjava/util/HashSet;Lrx/subjects/a;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
