.class public final synthetic Ll/efn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gfn;

.field public final synthetic b:Ll/uoe0;

.field public final synthetic c:I

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/bkg;


# direct methods
.method public synthetic constructor <init>(Ll/gfn;Ll/uoe0;ILjava/lang/String;Ll/bkg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/efn;->a:Ll/gfn;

    iput-object p2, p0, Ll/efn;->b:Ll/uoe0;

    iput p3, p0, Ll/efn;->c:I

    iput-object p4, p0, Ll/efn;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/efn;->e:Ll/bkg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/efn;->a:Ll/gfn;

    iget-object v1, p0, Ll/efn;->b:Ll/uoe0;

    iget v2, p0, Ll/efn;->c:I

    iget-object v3, p0, Ll/efn;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/efn;->e:Ll/bkg;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/PaymentData;

    invoke-static/range {v0 .. v5}, Ll/gfn;->D4(Ll/gfn;Ll/uoe0;ILjava/lang/String;Ll/bkg;Lcom/p1/mobile/putong/data/PaymentData;)V

    return-void
.end method
