.class public final synthetic Ll/d9s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/f9e;

.field public final synthetic b:Ll/n9s;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/f9e;Ll/n9s;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d9s;->a:Ll/f9e;

    iput-object p2, p0, Ll/d9s;->b:Ll/n9s;

    iput-object p3, p0, Ll/d9s;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d9s;->a:Ll/f9e;

    iget-object v1, p0, Ll/d9s;->b:Ll/n9s;

    iget-object p0, p0, Ll/d9s;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/n9s;->j(Ll/f9e;Ll/n9s;Ljava/lang/String;)V

    return-void
.end method
