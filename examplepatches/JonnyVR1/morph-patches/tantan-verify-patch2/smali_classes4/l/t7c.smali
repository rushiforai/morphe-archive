.class public final synthetic Ll/t7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->b(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)Lcom/tantanapp/common/data/DbObject;

    move-result-object p0

    return-object p0
.end method
