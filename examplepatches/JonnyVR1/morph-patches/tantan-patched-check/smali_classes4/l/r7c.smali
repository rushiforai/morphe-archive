.class public final synthetic Ll/r7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

.field public final synthetic b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    iput-object p2, p0, Ll/r7c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    iput-boolean p3, p0, Ll/r7c;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    iget-object v1, p0, Ll/r7c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    iget-boolean p0, p0, Ll/r7c;->c:Z

    invoke-static {v0, v1, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->g(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Z)V

    return-void
.end method
