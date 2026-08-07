.class public final synthetic Ll/dn9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dn9;->a:Ljava/lang/String;

    iput p2, p0, Ll/dn9;->b:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dn9;->a:Ljava/lang/String;

    iget p0, p0, Ll/dn9;->b:I

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/r;->s3(Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
