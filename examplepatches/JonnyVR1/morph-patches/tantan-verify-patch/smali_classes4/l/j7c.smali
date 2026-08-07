.class public final synthetic Ll/j7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->e(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/util/List;)V

    return-void
.end method
