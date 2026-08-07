.class public final synthetic Ll/et7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/List;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/et7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/et7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/et7;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/et7;->d:Ljava/util/List;

    iput p5, p0, Ll/et7;->e:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/et7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/et7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/et7;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/et7;->d:Ljava/util/List;

    iget v4, p0, Ll/et7;->e:I

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->Wc(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;ILcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
