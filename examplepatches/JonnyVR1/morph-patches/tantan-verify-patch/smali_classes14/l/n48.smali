.class public final synthetic Ll/n48;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:I

.field public final synthetic e:D


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;ILjava/lang/String;ID)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n48;->a:Lcom/p1/mobile/putong/core/api/g;

    iput p2, p0, Ll/n48;->b:I

    iput-object p3, p0, Ll/n48;->c:Ljava/lang/String;

    iput p4, p0, Ll/n48;->d:I

    iput-wide p5, p0, Ll/n48;->e:D

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/n48;->a:Lcom/p1/mobile/putong/core/api/g;

    iget v1, p0, Ll/n48;->b:I

    iget-object v2, p0, Ll/n48;->c:Ljava/lang/String;

    iget v3, p0, Ll/n48;->d:I

    iget-wide v4, p0, Ll/n48;->e:D

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->zc(Lcom/p1/mobile/putong/core/api/g;ILjava/lang/String;ID)V

    return-void
.end method
