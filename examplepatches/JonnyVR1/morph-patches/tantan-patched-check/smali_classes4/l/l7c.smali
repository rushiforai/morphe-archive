.class public final synthetic Ll/l7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iput-object p2, p0, Ll/l7c;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/l7c;->c:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    iput-boolean p4, p0, Ll/l7c;->d:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/l7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iget-object v1, p0, Ll/l7c;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/l7c;->c:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;

    iget-boolean p0, p0, Ll/l7c;->d:Z

    invoke-static {v0, v1, v2, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiGet;Z)V

    return-void
.end method
