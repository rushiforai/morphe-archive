.class public final synthetic Ll/mjl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wjl0$a;

.field public final synthetic b:Ll/zjl0;


# direct methods
.method public synthetic constructor <init>(Ll/wjl0$a;Ll/zjl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mjl0;->a:Ll/wjl0$a;

    iput-object p2, p0, Ll/mjl0;->b:Ll/zjl0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mjl0;->a:Ll/wjl0$a;

    iget-object p0, p0, Ll/mjl0;->b:Ll/zjl0;

    invoke-static {v0, p0}, Ll/wjl0$a;->f(Ll/wjl0$a;Ll/zjl0;)V

    return-void
.end method
