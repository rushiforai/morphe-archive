.class public final synthetic Ll/bnb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/enb;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/enb;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bnb;->a:Ll/enb;

    iput-object p2, p0, Ll/bnb;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/bnb;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bnb;->a:Ll/enb;

    iget-object v1, p0, Ll/bnb;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/bnb;->c:Z

    invoke-static {v0, v1, p0}, Ll/enb;->s3(Ll/enb;Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
