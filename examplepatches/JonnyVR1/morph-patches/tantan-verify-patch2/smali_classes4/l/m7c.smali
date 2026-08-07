.class public final synthetic Ll/m7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iput-object p2, p0, Ll/m7c;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iget-object p0, p0, Ll/m7c;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->c(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;Ljava/lang/String;)V

    return-void
.end method
