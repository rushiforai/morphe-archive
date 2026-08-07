.class public final synthetic Ll/sqx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uqx$a;

.field public final synthetic b:Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;


# direct methods
.method public synthetic constructor <init>(Ll/uqx$a;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sqx;->a:Ll/uqx$a;

    iput-object p2, p0, Ll/sqx;->b:Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sqx;->a:Ll/uqx$a;

    iget-object p0, p0, Ll/sqx;->b:Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;

    invoke-static {v0, p0}, Ll/uqx$a;->n0(Ll/uqx$a;Lcom/immomo/momomediaext/utils/MMLiveErrorInfo;)V

    return-void
.end method
