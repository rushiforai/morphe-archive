.class public final synthetic Ll/dka;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ll/jv00;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ll/jv00;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dka;->a:Ll/jka;

    iput-object p2, p0, Ll/dka;->b:Ll/jv00;

    iput-object p3, p0, Ll/dka;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/dka;->d:Ljava/lang/String;

    iput-boolean p5, p0, Ll/dka;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dka;->a:Ll/jka;

    iget-object v1, p0, Ll/dka;->b:Ll/jv00;

    iget-object v2, p0, Ll/dka;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/dka;->d:Ljava/lang/String;

    iget-boolean v4, p0, Ll/dka;->e:Z

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Ll/jka;->N2(Ll/jka;Ll/jv00;Ljava/lang/String;Ljava/lang/String;ZLcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
