.class public final synthetic Lcom/tantanapp/common/data/orm/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

.field public final synthetic b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tantanapp/common/data/orm/c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    iput-object p2, p0, Lcom/tantanapp/common/data/orm/c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    iput p3, p0, Lcom/tantanapp/common/data/orm/c;->c:I

    iput p4, p0, Lcom/tantanapp/common/data/orm/c;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    iget-object v1, p0, Lcom/tantanapp/common/data/orm/c;->b:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;

    iget v2, p0, Lcom/tantanapp/common/data/orm/c;->c:I

    iget p0, p0, Lcom/tantanapp/common/data/orm/c;->d:I

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;->a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery$UiQueryResult;IILl/pf60;)V

    return-void
.end method
