.class public final synthetic Lcom/momo/xengine/ar/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;


# instance fields
.field public final synthetic a:Lcom/momo/xengine/ar/XEngineARImpl;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xengine/ar/XEngineARImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xengine/ar/a;->a:Lcom/momo/xengine/ar/XEngineARImpl;

    return-void
.end method


# virtual methods
.method public final register(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/ar/a;->a:Lcom/momo/xengine/ar/XEngineARImpl;

    invoke-static {p0, p1, p2}, Lcom/momo/xengine/ar/XEngineARImpl;->a(Lcom/momo/xengine/ar/XEngineARImpl;J)V

    return-void
.end method
