.class public final synthetic Ll/fk9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/fk9;->a:I

    iput-boolean p2, p0, Ll/fk9;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/fk9;->a:I

    iget-boolean p0, p0, Ll/fk9;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->Y3(IZ)Lrx/c;

    move-result-object p0

    return-object p0
.end method
