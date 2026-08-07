.class public final synthetic Ll/yzh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wzh0$c;


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yzh0;->a:Ll/wzh0$c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yzh0;->a:Ll/wzh0$c;

    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-static {p0, p1}, Ll/wzh0$c;->a(Ll/wzh0$c;Lcom/tantanapp/common/data/DbObject;)V

    return-void
.end method
