.class public final Lnre;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/net/URL;

.field public final c:Ll0c;

.field public final d:Ljava/util/List;

.field public final e:Ljava/util/List;

.field public final f:Ljava/util/List;

.field public final g:Lbre;

.field public final h:Z

.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lz05;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lqtm;->d:Ljava/lang/String;

    iput-object v0, p0, Lnre;->a:Ljava/lang/String;

    iget-object v0, p1, Ld93;->a:Lyla;

    iget-object v1, v0, Lyla;->a:Ljava/net/URL;

    iput-object v1, p0, Lnre;->b:Ljava/net/URL;

    iget-object v0, v0, Lyla;->e:Ll0c;

    iput-object v0, p0, Lnre;->c:Ll0c;

    iget-object v0, p1, Lfp4;->e:Ljava/util/List;

    iput-object v0, p0, Lnre;->d:Ljava/util/List;

    iget-object v0, p1, Lfp4;->f:Ljava/util/List;

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lnre;->e:Ljava/util/List;

    iget-object v0, p1, Lz05;->h:Ljava/util/List;

    iput-object v0, p0, Lnre;->f:Ljava/util/List;

    iget-object v0, p1, Lz05;->i:Lbre;

    iput-object v0, p0, Lnre;->g:Lbre;

    iget-boolean v0, p1, Lz05;->j:Z

    iput-boolean v0, p0, Lnre;->h:Z

    iget-object p1, p1, Ld93;->c:Ljava/lang/String;

    iput-object p1, p0, Lnre;->i:Ljava/lang/String;

    return-void
.end method
