.class public final synthetic Ll/d0i0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/wzh0$d$a;

.field public final synthetic b:Lcom/tantanapp/common/data/orm/Filter;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/wzh0$d$a;Lcom/tantanapp/common/data/orm/Filter;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d0i0;->a:Ll/wzh0$d$a;

    iput-object p2, p0, Ll/d0i0;->b:Lcom/tantanapp/common/data/orm/Filter;

    iput p3, p0, Ll/d0i0;->c:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d0i0;->a:Ll/wzh0$d$a;

    iget-object v1, p0, Ll/d0i0;->b:Lcom/tantanapp/common/data/orm/Filter;

    iget p0, p0, Ll/d0i0;->c:I

    invoke-static {v0, v1, p0}, Ll/wzh0$d$a;->a(Ll/wzh0$d$a;Lcom/tantanapp/common/data/orm/Filter;I)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
