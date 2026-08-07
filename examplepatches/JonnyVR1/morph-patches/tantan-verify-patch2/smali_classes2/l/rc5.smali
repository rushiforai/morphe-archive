.class public final synthetic Ll/rc5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mll0$b;


# instance fields
.field public final synthetic a:Lcom/facebook/internal/d;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/internal/d;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rc5;->a:Lcom/facebook/internal/d;

    iput-object p2, p0, Ll/rc5;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rc5;->a:Lcom/facebook/internal/d;

    iget-object p0, p0, Ll/rc5;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/tc5;->b(Lcom/facebook/internal/d;Ljava/lang/String;)V

    return-void
.end method
