.class public final synthetic Ll/ldq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/udq;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;


# direct methods
.method public synthetic constructor <init>(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ldq;->a:Ll/udq;

    iput-object p2, p0, Ll/ldq;->b:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ldq;->a:Ll/udq;

    iget-object p0, p0, Ll/ldq;->b:Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;

    invoke-static {v0, p0, p1}, Ll/udq;->c(Ll/udq;Lcom/p1/mobile/putong/core/data/DynamicSchemaMsgData;Landroid/view/View;)V

    return-void
.end method
