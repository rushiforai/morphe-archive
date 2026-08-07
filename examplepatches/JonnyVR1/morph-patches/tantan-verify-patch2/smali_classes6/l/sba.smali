.class public final synthetic Ll/sba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sba;->a:Ll/jka;

    iput-object p2, p0, Ll/sba;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/sba;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/sba;->d:Z

    iput p5, p0, Ll/sba;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/sba;->a:Ll/jka;

    iget-object v1, p0, Ll/sba;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/sba;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/sba;->d:Z

    iget v4, p0, Ll/sba;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Ll/jka;->H2(Ll/jka;Ljava/lang/String;Ljava/lang/String;ZILcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/data/Envelope;

    move-result-object p0

    return-object p0
.end method
