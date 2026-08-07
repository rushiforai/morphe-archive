.class public final synthetic Ll/vaj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ibj;

.field public final synthetic b:J

.field public final synthetic c:I

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/ibj;JILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vaj;->a:Ll/ibj;

    iput-wide p2, p0, Ll/vaj;->b:J

    iput p4, p0, Ll/vaj;->c:I

    iput-object p5, p0, Ll/vaj;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/vaj;->a:Ll/ibj;

    iget-wide v1, p0, Ll/vaj;->b:J

    iget v3, p0, Ll/vaj;->c:I

    iget-object v4, p0, Ll/vaj;->d:Ljava/util/List;

    move-object v5, p1

    check-cast v5, Ll/pf60;

    invoke-static/range {v0 .. v5}, Ll/ibj;->N(Ll/ibj;JILjava/util/List;Ll/pf60;)V

    return-void
.end method
