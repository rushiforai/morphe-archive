.class public final synthetic Ll/k7c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iput p2, p0, Ll/k7c;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k7c;->a:Lcom/tantanapp/common/data/orm/DatabaseStore$Table;

    iget p0, p0, Ll/k7c;->b:I

    invoke-static {v0, p0}, Lcom/tantanapp/common/data/orm/DatabaseStore$Table;->f(Lcom/tantanapp/common/data/orm/DatabaseStore$Table;I)V

    return-void
.end method
