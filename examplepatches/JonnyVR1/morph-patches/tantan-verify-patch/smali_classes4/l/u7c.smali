.class public final synthetic Ll/u7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;->a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Lcom/tantanapp/common/data/DbObject;)V

    return-void
.end method
