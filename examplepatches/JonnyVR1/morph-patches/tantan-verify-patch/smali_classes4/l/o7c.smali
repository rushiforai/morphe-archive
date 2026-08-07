.class public final synthetic Ll/o7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;

    invoke-static {p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;->a(Lcom/tantanapp/common/data/orm/DatabaseStore$Table$Query;)V

    return-void
.end method
