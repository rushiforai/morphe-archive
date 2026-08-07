.class public final synthetic Ll/qtd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ll/rtd0;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;Ll/rtd0;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qtd0;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Ll/qtd0;->b:Ll/rtd0;

    iput-object p3, p0, Ll/qtd0;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtd0;->a:Ljava/lang/Runnable;

    iget-object v1, p0, Ll/qtd0;->b:Ll/rtd0;

    iget-object p0, p0, Ll/qtd0;->c:Ljava/lang/Object;

    invoke-static {v0, v1, p0}, Ll/rtd0;->a(Ljava/lang/Runnable;Ll/rtd0;Ljava/lang/Object;)V

    return-void
.end method
