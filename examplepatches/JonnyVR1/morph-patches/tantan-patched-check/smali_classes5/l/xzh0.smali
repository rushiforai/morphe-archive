.class public final synthetic Ll/xzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/wzh0$c;


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xzh0;->a:Ll/wzh0$c;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzh0;->a:Ll/wzh0$c;

    invoke-static {p0}, Ll/wzh0$c;->b(Ll/wzh0$c;)Lcom/tantanapp/common/data/DbObject;

    move-result-object p0

    return-object p0
.end method
