.class public final synthetic Ll/g28;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g28;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/g28;->b:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/g28;->a:Ljava/lang/String;

    iget-boolean p0, p0, Ll/g28;->b:Z

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->l3(Ljava/lang/String;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method
