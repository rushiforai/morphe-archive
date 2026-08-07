.class public final synthetic Ll/tmb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/enb;

.field public final synthetic b:Ljava/lang/StringBuilder;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/enb;Ljava/lang/StringBuilder;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tmb;->a:Ll/enb;

    iput-object p2, p0, Ll/tmb;->b:Ljava/lang/StringBuilder;

    iput-boolean p3, p0, Ll/tmb;->c:Z

    iput-object p4, p0, Ll/tmb;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tmb;->a:Ll/enb;

    iget-object v1, p0, Ll/tmb;->b:Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Ll/tmb;->c:Z

    iget-object p0, p0, Ll/tmb;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/enb;->d3(Ll/enb;Ljava/lang/StringBuilder;ZLjava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
