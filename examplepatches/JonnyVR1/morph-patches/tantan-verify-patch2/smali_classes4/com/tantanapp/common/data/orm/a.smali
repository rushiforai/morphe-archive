.class public final synthetic Lcom/tantanapp/common/data/orm/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/data/orm/a;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/orm/a;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;

    check-cast p1, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->f(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
