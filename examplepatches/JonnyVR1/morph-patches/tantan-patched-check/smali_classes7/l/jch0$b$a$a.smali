.class public Ll/jch0$b$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jch0$b$a;->onFinished()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jch0$b$a;


# direct methods
.method public constructor <init>(Ll/jch0$b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jch0$b$a$a;->a:Ll/jch0$b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jch0$b$a$a;->a:Ll/jch0$b$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jch0$b$a;->a:Ll/jch0$b;

    .line 4
    .line 5
    iget-object v0, v0, Ll/jch0$b;->a:Ll/jch0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jch0;->F(Ll/jch0;)Ll/x20;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/jch0$b$a$a;->a:Ll/jch0$b$a;

    .line 14
    .line 15
    iget-object v0, v0, Ll/jch0$b$a;->a:Ll/jch0$b;

    .line 16
    .line 17
    iget-object v0, v0, Ll/jch0$b;->a:Ll/jch0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jch0;->F(Ll/jch0;)Ll/x20;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ll/x20;->call()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/jch0$b$a$a;->a:Ll/jch0$b$a;

    .line 27
    .line 28
    iget-object p0, p0, Ll/jch0$b$a;->a:Ll/jch0$b;

    .line 29
    .line 30
    iget-object p0, p0, Ll/jch0$b;->a:Ll/jch0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 33
    .line 34
    .line 35
    return-void
.end method
