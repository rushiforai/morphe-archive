.class public final synthetic Ll/p7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

.field public final synthetic b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    iput-object p2, p0, Ll/p7c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    iget-object p0, p0, Ll/p7c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    invoke-static {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V

    return-void
.end method
