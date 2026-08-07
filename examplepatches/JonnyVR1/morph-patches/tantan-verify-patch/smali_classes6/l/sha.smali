.class public final synthetic Ll/sha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/jv00;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ll/jv00;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sha;->a:Ll/jka;

    iput-object p2, p0, Ll/sha;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sha;->c:Ll/jv00;

    iput-object p4, p0, Ll/sha;->d:Ljava/lang/String;

    iput-wide p5, p0, Ll/sha;->e:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sha;->a:Ll/jka;

    iget-object v1, p0, Ll/sha;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/sha;->c:Ll/jv00;

    iget-object v3, p0, Ll/sha;->d:Ljava/lang/String;

    iget-wide v4, p0, Ll/sha;->e:J

    invoke-static/range {v0 .. v5}, Ll/jka;->g3(Ll/jka;Ljava/lang/String;Ll/jv00;Ljava/lang/String;J)Lrx/c;

    move-result-object p0

    return-object p0
.end method
