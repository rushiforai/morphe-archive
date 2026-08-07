.class public final synthetic Ll/y7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/JoinFilter;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/JoinFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y7c;->a:Lcom/tantanapp/common/data/orm/JoinFilter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y7c;->a:Lcom/tantanapp/common/data/orm/JoinFilter;

    check-cast p1, Lcom/tantanapp/common/data/DbObject;

    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$UiQuery;->b(Lcom/tantanapp/common/data/orm/JoinFilter;Lcom/tantanapp/common/data/DbObject;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
